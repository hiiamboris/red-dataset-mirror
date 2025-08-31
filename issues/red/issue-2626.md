
#2626: Arguments cache is not updated when function's spec block changed
================================================================================
Issue is open, was reported by endo64 and has 30 comment(s).
[status.waiting] [type.review]
<https://github.com/red/red/issues/2626>

```
>> f: function [a b] [a + b]
>> clear spec-of :f
>> ?? f
f: func [ ] [a + b]
>> f 1 2
== 3
```


Comments:
--------------------------------------------------------------------------------

On 2017-11-05T19:53:20Z, endo64, commented:
<https://github.com/red/red/issues/2626#issuecomment-342000004>

    Current behavior is:
    
    ```
    >> f 1 2 
    *** Script Error: + does not allow block! for its value1 argument
    *** Where: +
    *** Stack: f  
    
    ```

--------------------------------------------------------------------------------

On 2020-03-17T22:04:53Z, 9214, commented:
<https://github.com/red/red/issues/2626#issuecomment-600323145>

    https://github.com/red/red/issues/3171

--------------------------------------------------------------------------------

On 2025-01-10T18:35:48Z, dockimbel, commented:
<https://github.com/red/red/issues/2626#issuecomment-2583530045>

    One solution could be to use `modifiy` to reset the internal function cache.

--------------------------------------------------------------------------------

On 2025-01-10T19:57:20Z, greggirwin, commented:
<https://github.com/red/red/issues/2626#issuecomment-2583883105>

    Seems like we need a design chat on func mods, per some of the old chat. `words-of` returns a new block, and `spec-of` could return a copy, so you can't modify it as easily. Can add to docs as well, some of the Guru notes.

--------------------------------------------------------------------------------

On 2025-01-10T22:50:23Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/2626#issuecomment-2584644901>

    If `words-of` returns a new specs block, you loose the only way to have the words of function context.

--------------------------------------------------------------------------------

On 2025-01-10T23:02:19Z, greggirwin, commented:
<https://github.com/red/red/issues/2626#issuecomment-2584697134>

    `words-of` clones the block, so you can't modify the original through it.

--------------------------------------------------------------------------------

On 2025-01-11T13:01:57Z, dockimbel, commented:
<https://github.com/red/red/issues/2626#issuecomment-2585260264>

    > `spec-of` could return a copy 
    
    Seems like the simplest and safest option. I'm not sure if losing the ability to modify the func's spec directly will not come to bite us later, but we can probably add some other way to access it if really needed.

--------------------------------------------------------------------------------

On 2025-01-11T13:34:58Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/2626#issuecomment-2585271512>

    `Spec-of` block is a nice place to add informations to a function after its creation:
    
    ```
    >> append spec-of f: func [a b] [a + b] {This function has extended doc you can access here...}
    == [a b {This function has extended doc you can access here...}]
    ```
    
    While Retaining its functionality
    ```
    >> f 1 2
    == 3
    ```
    So I would keep it as and let `PROTECT` do this job when we will have it.

--------------------------------------------------------------------------------

On 2025-01-11T13:45:55Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/2626#issuecomment-2585274428>

    However there are additional issues in https://github.com/red/red/issues/4192 .  Look at all mentions at the end of https://github.com/red/red/issues/3171 and you will find more details. There are differences between `func`, `function!`, `has` and others.

--------------------------------------------------------------------------------

On 2025-01-11T17:05:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/2626#issuecomment-2585343316>

    The ability to modify function spec could be grounds for new and interesting language features. E.g. I while evaluating an argument, I could increase the arity of the function, thus paving way to weird variable arity cases. Or I could *specialize* existing functions without recreating them.
    
    Pragmatically though, it looks like a can of worms open for little to no value. I do however remember parsing a function spec and accidentally forgetting to copy it before `remove` or `clear`. And then stumbling upon `? myfunc` output, thinking "what have I done?" :)
    
    So I'm in favor of an error on an attempt to modify the spec in place (note that copy must be deep). And also not in favor of a copy, because it will only add extra load on all those cases where we just want to inspect the spec. And also not in favor of a copying `body-of`, because I'm sometimes modifying or binding it (as a function literal, not as a name - think of VID actors for example) :)
    
    One side note is that function spec is not currently bound to the function itself, and can link to other functions or objects via its words bindings, locking them from GC and risking Redbin `save` failures.

--------------------------------------------------------------------------------

On 2025-01-11T18:58:00Z, greggirwin, commented:
<https://github.com/red/red/issues/2626#issuecomment-2585376360>

    I've done the same thing as @hiiamboris, more than once.
    
    > I'm in favor of an error on an attempt to modify the spec in place
    
    This, and @GiuseppeChillemi 's note on `protect` mean much bigger changes, right? We don't have series protection today.
    
    While this seems like a tough question, because of the flexibility we love so much, my gut leans heavily toward safety here. The overhead of copying seems extremely minimal to me, given how many funcs may exist and how inspection might be used. e.g. 10K copies of `find`'s spec takes ~0.04s here.
    
    The `body-of` question seems like it's even less safe to modify, but I understand Boris's use case as well. Still, constructing and reassigning funcs seems much safer in general. If we want to do things like AOP, that's a bigger design discussion.
    
    Boris, if we simply copy `spec-of`, will that break your code today?

--------------------------------------------------------------------------------

On 2025-01-11T19:02:50Z, greggirwin, commented:
<https://github.com/red/red/issues/2626#issuecomment-2585377601>

    We can also ask how other reflectors work, and how they should work. I don't think reflection necessarily means access.

--------------------------------------------------------------------------------

On 2025-01-11T19:13:38Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/2626#issuecomment-2585380187>

    You know I like to experiment but this seems too much to me. Modifying the inner of the interface "on the fly"  is too dangerous.  I prefer having a special dynamic function interface that can access the code block at call site. From a special interface code, you will be able to choose how many argument it should take relative to the call site and create the context to bind the code to. 
    
    Something like:
    
    ```
    dynamic-function: dynamic [<specs-code>] [<body> ... return-skip <value> <arg-skip]
    
    f: dynamic [
       case [
          series? code/1 [set x: context [series: none value: none type: none] reduce [code/1 code/2 'series-interface]]
          Integer? code/1 [set x: context [len: none type: none] reduce [code/1 'lenght-interface]]
       ]
       x; <--- Returns the context here
    ] [
       if type = 'length-interface [<do code here.....>]
       ...
       return-skip return-value 1;--- It skips the number of elements at call-site
    ]
    ```

--------------------------------------------------------------------------------

On 2025-01-12T01:09:01Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/2626#issuecomment-2585519269>

    @hiiamboris About this:
    
    > Pragmatically though, it looks like a can of worms open for little to no value. 
    
    I can see an use. I am taking notes from time to time of a vision I have to express code with variable arity, where the exprassion is centered and managed by one the words, being the others mere keywords or doing some processing too, or being value.
    
    Something like: 
    
    `add table row [code]`
    
    Where `add` manages the number of elements to read
    
    So it could be
    
    `add server port 6868`
    
    Or
    
    `add object word validator source-library function-name`
    
    Where, as example: `ADD` manages all the remaining parameters.
    
    But you could also center the code in another element, like::
    
    `add table server row row-here` 
    
    where `table` could be a function that looks at its left for the action `add` and then on the rigth for the target `server` the element to add `row` and then the row itself `row-here`
    
    I have never gone other than taking note and some parsing. With variable arity function and arity managemente code, it could be ported at Red level, gaining flexibility and speed... and the language could gain a power in building phrases that has never be seen before in other languages, bringing our expressiveness further ahead!

--------------------------------------------------------------------------------

On 2025-01-13T15:13:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/2626#issuecomment-2587382962>

    @giuseppechillemi that is a place for dialects use.
    
    @greggirwin
    > Boris, if we simply copy `spec-of`, will that break your code today?
    
    No. And I'm not using `spec-of` in any performance critical code at the moment. But I still would prefer `protect` here as a proper by-design solution, rather than patching the runtime with kludges. 

