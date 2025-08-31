
#5451: [Compiler] Variable "has no value" when compiled (interpreted works)
================================================================================
Issue is open, was reported by SkySpiral7 and has 8 comment(s).
[type.bug] [status.wontfix] [type.compiler]
<https://github.com/red/red/issues/5451>

**Describe the bug**
Confusing compilation behavior is wrong and inconsistent with interpreted. For some reason the variable "has no value".

**To reproduce**
Unfortunately the minimum reproducible example is a little large:
```red
Red []

print ""
print ""

deltaIterator: context [
   someConstant: 64
   deltaStream: 64

   parseNext: does [
      prin "top deltaStream = "
      print deltaStream
      switch deltaStream reduce [
         someConstant [
            prin "switch deltaStream = "
            print deltaStream
         ]
      ]
   ]
]

applyDelta: does [
   deltaItr: make deltaIterator []
   print "before parseNext"
   deltaItr/parseNext
   print "after parseNext"
]
applyDelta
```
When compiling this code with `redc -c` or `redc -r` then running it, it will fail with "Script Error: deltaStream has no value" inside the switch even though it can print fine just before that.

Additionally `redc -c` will work with any of these (illogical) changes:

* If deltaStream is moved outside of deltaIterator.
* If deltaStream is moved inside of deltaIterator/parseNext.
* If deltaIterator/parseNext switch statment doesn't reduce.
* If the lines for applyDelta are put directly in the red script (instead of in a function).


**Expected behavior**
Running the interpreter (or compiling with -e) correctly prints "switch deltaStream = 64".

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5075 date: 22-Dec-2023/9:07:34 commit: #6cb7d502bcbfae8b00630adee6561909eee2b478 ]
PLATFORM: [ name: "Ubuntu 22.04.3 LTS" OS: 'Linux arch: 'x86_64 version: 6.2.0 build: {#40~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Thu Nov 16 10:53:04 UTC 2} ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-12-30T13:47:40Z, dockimbel, commented:
<https://github.com/red/red/issues/5451#issuecomment-1872531420>

    After a short analysis, I am not still not sure if it is a compiler limitation (most probably) or just a bug.
    
    The core issue is that `switch` (like most other control flow functions _when compiled_) requires a static block as second argument. If you provide a dynamic one (like here generating it with `reduce`), you are _on your own_, as the compiler cannot statically analyze what `switch` will get as second argument anymore. In such case, it may work without issue, or not, depending on what you provide. 
    
    I will do a more in-depth investigation in the next days to get to the bottom of it, though, in the meantime, you can use at least two workarounds:
    
    1) Set explicitly `deltaStream` value when cloning the object:
    ```
    deltaItr: make deltaIterator [deltaStream: 100]
    ```
    
    2) Force the binding of the `reduce` argument block to the local object:
    ```
    switch deltaStream bind reduce [...] self
    ```
    
    Anyway, I am working on deprecating the high-level compiler partially (or completely), so that all provided Red code will be directed to the interpreter, getting rid of those problematic static/dynamic combos edge cases for the compiler. Such cases can be solved but the increase in complexity in the compiler internals is  just not worth the effort. They are better (cleaner, faster, shorter) ways.

--------------------------------------------------------------------------------

On 2024-01-02T15:23:41Z, SkySpiral7, commented:
<https://github.com/red/red/issues/5451#issuecomment-1874166695>

    It doesn't make sense to me that switch takes a static block, I expected it to bind to the self by default (which would match interpreted). Your work around #2 does work however #1 doesn't: `deltaItr: make deltaIterator [deltaStream: 64]` has the same "no value" error. The reason the value 100 didn't fail is because the switch statement doesn't match and therefore the deltaStream value is not accessed.
    
    I'm guessing by "high-level compiler" you mean compiling ahead of time instead of JIT. Being able to do `redc -e -r` is pretty fundamental to distribution but AOT vs JIT doesn't make much difference. I wouldn't mind `redc -c` being removed and `-e` being the new default. AOT would be better but maybe it contradicts Red design at a fundamental level such that it would never be possible (or maybe just impractical).

--------------------------------------------------------------------------------

On 2024-01-17T22:27:24Z, dockimbel, commented:
<https://github.com/red/red/issues/5451#issuecomment-1897150494>

    After a deeper analysis, I confirm that it is a compiler limitation: the `deltaStream` word in the `reduce` argument block is stored (along with that block) in redbin format with a binding to an empty context, as the compiler in the above case compiles the objects entirely into code, so that the compiled context and the one stored in redbin format are not linked together. The result is that the inner `deltaStream` is pulling its value from an empty context in redbin format where all the fields are unset.
    
    > It doesn't make sense to me that `switch` takes a static block
    
    I should have used "literal" instead of "static" there to avoid misunderstanding.
    
    > The reason the value 100 didn't fail is because the switch statement doesn't match and therefore the deltaStream value is not accessed.
    
    You're right, I've missed that, sorry.
    
    > I'm guessing by "high-level compiler" you mean compiling ahead of time instead of JIT
    
    I meant the Red to Red/System compiler which is currently an AOT one. In the future, we will have a JIT one, which is a much better fit for Red semantics.
    
    > Being able to do redc -e -r is pretty fundamental to distribution
    
    We're keeping that of course.
    
    > AOT would be better but maybe it contradicts Red design at a fundamental level such that it would never be possible (or maybe just impractical).
    
    That's exactly right.
    

--------------------------------------------------------------------------------

On 2024-01-17T22:28:22Z, dockimbel, commented:
<https://github.com/red/red/issues/5451#issuecomment-1897155163>

    I will leave that ticket open with the "wontfix" status until we drop the Red compiler. Once that done, we'll close all the "type.compiler" tickets all together.

