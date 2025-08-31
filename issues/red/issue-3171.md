
#3171: modification of function's body or spec doesn't affect its behavior
================================================================================
Issue is closed, was reported by 9214 and has 22 comment(s).
[type.wish]
<https://github.com/red/red/issues/3171>

### Expected behavior
Function evaluates its body block fully and executes all added instructions, and also accept all new refinements/arguments/whatever was modified/added in/to its spec.
### Actual behavior
Function still behaves like nothing was changed in its body or spec.
### Steps to reproduce the problem
```Red
>> append body-of :rejoin [print "all rejoined, yay!"]
== [
    if empty? block: reduce block [return block] 
    append either series? first block [copy first block] [
...
>> rejoin [1 2 3]
== "123"
>> ?? rejoin
rejoin: func [
    "Reduces and joins a block of values." 
    block [block!] "Values to reduce and join"
][
    if empty? block: reduce block [return block] 
    append either series? first block [copy first block] [
        form first block
    ] next block print "all rejoined, yay!"
]
>> append spec-of :rejoin [/refinement x]
== [
    "Reduces and joins a block of values." 
    block [block!] "Values to reduce and join" /refinement x
]
>> rejoin/refinement
*** Script Error: rejoin has no refinement called refinement
*** Where: rejoin
*** Stack: rejoin
>> ?? rejoin
rejoin: func [
    "Reduces and joins a block of values." 
    block [block!] "Values to reduce and join" /refinement x
][
    if empty? block: reduce block [return block] 
    append either series? first block [copy first block] [
        form first block
    ] next block print "all rejoined, yay!"
]
```
This trick partially works with user-defined functions, but not with build-in ones.
```Red
>> foo: func [x][x + 1]
== func [x][x + 1]
>> foo 1
== 2
>> insert body-of :foo [1337 +]
== [x + 1]
>> foo 1
== 1339
>> append spec-of :foo [/refinement y]
== [x /refinement y]
>> foo/refinement
*** Script Error: foo has no refinement called refinement
*** Where: foo
*** Stack: foo  
>> ?? foo
foo: func [x /refinement y][1337 + x + 1]
```

### Red version and build date, operating system with version.
Latest build as of this report:
```Red
>> about
Red for Windows version 0.6.3 built 27-Dec-2017/17:25:05+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2017-12-28T07:33:43Z, 9214, commented:
<https://github.com/red/red/issues/3171#issuecomment-354243710>

    @greggirwin pointed out the cause, still, such "monkey patching" would be nice to have :monkey: 
    https://github.com/red/red/wiki/Guru-Meditations#compiled-versus-interpreted-behaviors

--------------------------------------------------------------------------------

On 2017-12-28T08:54:43Z, greggirwin, commented:
<https://github.com/red/red/issues/3171#issuecomment-354253565>

    I suppose JIT might solve that. Not sure how else though, unless you have the ability to monitor changes via object ownership in the future, where a function context could do it. So the system could detect changes, and even prevent them possibly. 
    
    If there's an actual use case for this, we can leave this ticket open. Otherwise, I'll label it as a wish and close it.

--------------------------------------------------------------------------------

On 2017-12-28T09:09:05Z, 9214, commented:
<https://github.com/red/red/issues/3171#issuecomment-354255565>

    @greggirwin you can safely mark it as a wish, though, I'd use this to redefine existing functions on-the-fly, but such style is kinda... dirty? :feelsgood: 

--------------------------------------------------------------------------------

On 2018-01-14T01:23:38Z, greggirwin, commented:
<https://github.com/red/red/issues/3171#issuecomment-357481094>

    What does this wish allow that can't be done by reassigning the original function name to a newly built function, that is a mod of the original? The first thing that comes to mind is instrumenting functions at runtime, where you use the function value, not the name, to work against. But is that something we want to encourage, or are there better approaches we can devise?

--------------------------------------------------------------------------------

On 2018-01-14T05:05:10Z, 9214, commented:
<https://github.com/red/red/issues/3171#issuecomment-357489110>

    I can imagine scenarios where function is anonymous and can't be trivially re-assigned, because they aren't bound to any word. Count it as "would be nice to have, but not required prior to 1.0 release".

--------------------------------------------------------------------------------

On 2018-01-14T17:09:20Z, greggirwin, commented:
<https://github.com/red/red/issues/3171#issuecomment-357526259>

    Right, I see that use case, but are we then opening up more security issues? That is, if you can't do that, any precompiled funcs are safe from modification, yes? You can still change words that refer to them, but the funcs themselves are "immutable".

--------------------------------------------------------------------------------

On 2018-01-14T18:58:21Z, 9214, commented:
<https://github.com/red/red/issues/3171#issuecomment-357533232>

    Interesting detail you pointed out. Does `protect` in R2 prevents modification of functions' specs and bodies, or does it preserves only words' bindings? In the latter case, I would prefer to ditch this wish for reasons you've described.

--------------------------------------------------------------------------------

On 2018-01-14T19:26:44Z, greggirwin, commented:
<https://github.com/red/red/issues/3171#issuecomment-357535177>

    In Rebol, `protect` only protects the word binding. Rebol doesn't have compiled mezzanines, so it's a different beast.

--------------------------------------------------------------------------------

On 2018-01-14T19:28:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3171#issuecomment-357535279>

    We should remember this ticket's discussion though, as it's going to come up a lot in the future I imagine, as the community grows and we get more people doing creative things with dynamic code.

--------------------------------------------------------------------------------

On 2018-04-23T14:59:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/3171#issuecomment-383606408>

    In the absence of GC, I wanted to make a free list of functions - dump them there when not needed anymore and pick up on demand, but changing spec doesn't work after the func has been called once:
    ```
    >> f: func [][print 420]
    == func [][print 420]
    >> append spec-of :f [x [integer!]]
    == [x [integer!]]
    >> f "a"
    *** Script Error: f does not allow string! for its x argument
    *** Where: f
    *** Stack: f  
    
    >> f 1
    420
    >> clear spec-of :f
    == []
    >> ? f
    USAGE:
         F 
    
    DESCRIPTION: 
         F is a function! value.
    
    >> f
    *** Script Error: f is missing its x argument
    *** Where: f
    *** Stack: f  
    ```

--------------------------------------------------------------------------------

On 2018-04-25T06:37:16Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3171#issuecomment-384176262>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

