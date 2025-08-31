
#2365: Regression in compiler
================================================================================
Issue is closed, was reported by x8x and has 16 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2365>

Code of `%test.red`:
```
Red []

if zero? call/output {date} o: "" []
```
Compiling return an error:
```
red -c -r test.red

-=== Red Compiler 0.6.1 ===- 

Compiling /test.red ...
*** Compilation Error: expected a block for IF-BODY instead of string! value 
*** in file: %/test.red
*** near: ["date" o: "" []]
```


Comments:
--------------------------------------------------------------------------------

On 2016-12-12T09:54:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2365#issuecomment-266386219>

    `call` is not yet part of Red runtime library, so that code cannot be compiled as is.

--------------------------------------------------------------------------------

On 2016-12-12T10:39:37Z, x8x, commented:
<https://github.com/red/red/issues/2365#issuecomment-266395796>

    Sorry, I shortened the example too much..
    so the problem seams to be that running this code:
    Code of `%test.red`
    ```
    Red []
    write %test2.red trim/head next head clear back tail mold compose/only [
    	Red []
    	#include %libs/call/call.red
    	if zero? call/output {date} o: "" []
    ]
    ``` 
    Now I run `red test.red` and the content of resulting file `%test2.red` is:
    ```
    Red [] do %libs/call/call.red 
        if zero? call/output "date" o: "" []
    ```
    `#include %libs/call/call.red` has been converted to `do %libs/call/call.red ` and that is why I suppose I can not compile it with `red -c -r test2.red`
    
    I suppose I should switch from using `compose` to the new macros functionalities, but still is it correct that `compose` convert the preprocessor line which is outside of parens?
    
    Thank you!

--------------------------------------------------------------------------------

On 2016-12-13T01:35:27Z, geekyi, commented:
<https://github.com/red/red/issues/2365#issuecomment-266609212>

    @x8x you say it's a regression. Do you know of any working version?
    
    Interestingly, when you run the `%test.red` code directly in the interpreter instead of `red test.red`, it works as you expect (i.e. no conversion from `#include` to `do`)
    
    Edit: red-061.exe works as @x8x expected, I'll have to check some more.. 

--------------------------------------------------------------------------------

On 2016-12-14T21:07:32Z, x8x, commented:
<https://github.com/red/red/issues/2365#issuecomment-267156897>

    True, if run in the interpreter it will not do the conversion, thought, `red test.red` will do the conversion.

--------------------------------------------------------------------------------

On 2017-02-18T14:35:27Z, dockimbel, commented:
<https://github.com/red/red/issues/2365#issuecomment-280849352>

    @x8x Your second description looks confusing to me, sorry. `compose/only` has no effect on the argument, so why is it there? It seems you try to run Red code which includes R/S code from the interpreter? Can you tell me simply what error you get and how to reproduce it?
    
    About `compose`, I don't get your question, `compose` is a runtime function, so it has nothing to do with the preprocessor (which happens before the evaluation of a given script).

--------------------------------------------------------------------------------

On 2017-03-16T04:32:07Z, x8x, commented:
<https://github.com/red/red/issues/2365#issuecomment-286955323>

    Rereading this issue, it is indeed confusing, so let me give a clearer example:
    file `%include.red` content:
    ```
    Red []
    
    a: true
    ```
    file `%code.red` content:
    ```
    Red []
    
    hello: "Hello World"
    
    save %compile.red compose [
    
    	Red []
    	#include %include.red
    	print a
    	print (hello)
    
    ]
    
    call/console {red -c -r compile.red}
    ```
    now let's run `red code.red` and look at the content of the generated `%compile.red`:
    ```
    Red [] do %include.red
    print a
    print "Hello World"
    ```
    Note that `#include %include.red` has been converted to `do %include.red` !
    This is the issue!
    So is this conversion a feature or a regression?
    If it is a feature, what would be the best way to generate code in red that I later want to compile and that includes macros?
    
    Note that by executing above `red code.red` the compiler will return an error:
    ```
    -=== Red Compiler 0.6.1 ===- 
    
    Compiling /red/test.red ...
    *** Compilation Error: undefined word a 
    *** in file: /red/test.red
    *** near: [a 
        print "Hello World"
    ]
    ```
    So in this use case the conversion is NOT a feature.
    
    The conversion by the interpreter is probably a feature that allow to run code containing `#include` statements unmodified in the interpreter, but I suspect that an exception preventing the conversion to occur in a `compose` block would be a better approach.
    Actually the conversion should be done at execution time when a block of data is evaluated and left alone otherwise.

--------------------------------------------------------------------------------

On 2017-03-16T05:12:54Z, dockimbel, commented:
<https://github.com/red/red/issues/2365#issuecomment-286959924>

    The `#include` => `do` conversion happens when you run code in the interpreter. It is a feature, allowing user code to run unchanged from interpreter and compiler. When such transformation is not wanted, you can switch off/on the preprocessor (see the [documentation](https://doc.red-lang.org/en/preprocessor.html#__process)), so the following code would work fine:
    ```
    	Red []
    	#process off
    	#include %include.red
    	#process on
    	print a
    	print (hello)
    ```

--------------------------------------------------------------------------------

On 2017-03-16T05:18:59Z, x8x, commented:
<https://github.com/red/red/issues/2365#issuecomment-286960604>

    Very nice! Thank you! Read the docs Luke... :-)

