
#924: GET of compiled object method doesn't run
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 18 comment(s).
[type.review] [status.wontfix]
<https://github.com/red/red/issues/924>

```
c: context [
    f: does [print 'c/f]
]
; g: :c/f
g: get in c 'f
?? g
g
```

g: func [][print 'c/f]

When using the get-path! or when using `do [g]` you also get:

c/f



Comments:
--------------------------------------------------------------------------------

On 2014-09-12T02:15:11Z, dockimbel, commented:
<https://github.com/red/red/issues/924#issuecomment-55353992>

    IN support is not implemented in the compiler yet. 
    
    Also, it's not GET not working, it's the compiler not recognizing that `g` is a function, so it does not generate a function call for it, but just retrieves the value. That is why `?? g` outputs the function value instead of running it.

--------------------------------------------------------------------------------

On 2014-09-12T11:52:57Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/924#issuecomment-55392667>

    I'm using IN in compiled code all the time. It's just a function which call gets compiled, isn't it?
    
    I was wondering if this call can be compiled, but the point is that it works with the get-path!, so there is an inconsistency with GET, while it should be equivalent.

--------------------------------------------------------------------------------

On 2014-09-12T12:17:15Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/924#issuecomment-55394751>

    Reading your explanation to #926, I get it now. The differences between the compiler and interpreter remain unintuitive, though.

--------------------------------------------------------------------------------

On 2014-09-12T12:17:55Z, dockimbel, commented:
<https://github.com/red/red/issues/924#issuecomment-55394824>

    IN is currently processed by the compiler as just a native function, so just a call for the native is generated. For the compiler, in order to be able to generate function (or object's method) invocations, it needs to recognized them as such, which means statically determining at compile time, which word! or path! refers to a function/method (and which function/method).
    
    So, in order to _guess_ that `g: get in c 'f` is making `g` reference an object's method, both `get` and `in` needs special processing by the compiler. As the get-path! alternative has been implemented already and as it is cleaner than having to make `get` and `in` statically processed by the compiler (as the user can very easily defeat the compiler in such cases), I am not sure that support for such expressions will be implemented in the compiler.
    
    As a general rule, don't expect the Red static compiler to match _all_ the semantics of the Red interpreter, it is simply impossible to achieve. The JIT compiler will help solve that (though with a runtime cost) and the interpreter will be used in all the other cases (with the worst case of running almost all of your program through it if you adopt a very dynamic coding style).
    
    Unfortunately, these are the limits of static analysis of a language from Rebol family.
    
    The IDE should be able to provide some help for the user to identify the code parts that will generate sub-optimal code (by marking them visually).

--------------------------------------------------------------------------------

On 2014-09-12T12:24:08Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/924#issuecomment-55395369>

    We made ourselves used to the concept of code being data, but we have to let go of that again with the compiler. I am using GET and IN for object fields, but didn't stop to think that when compiled, they behave very differently for object methods.

--------------------------------------------------------------------------------

On 2014-09-12T12:27:30Z, dockimbel, commented:
<https://github.com/red/red/issues/924#issuecomment-55395681>

    The work of the compiler is precisely to separate code _from_ data. So, there is a limit to the compiler's ability to do so in a Rebol-like language, as the meta-programming semantics allow the user to easily defeat even advanced inference methods. You can still ignore all that if code flexibility is your most important feature, but you can't expect more than interpreter performances in that case.
    
    Though, I already pushed the Red compiler further than I hoped for recognizing some code patterns for method invocations. I can still push it a little bit more, but we are really touching the limits now. Going further would need to resort to heavy type inferencing, which is not an option currently as it would eat way too much time to implement, and would kill compilation speed totally (look at the catastrophic Scala compiler performances for example).

--------------------------------------------------------------------------------

On 2014-10-04T15:48:52Z, dockimbel, commented:
<https://github.com/red/red/issues/924#issuecomment-57909450>

    Work on objects is done for now, this specific case will not be supported right now, as I need to find a general solution to dynamic function calls. The same approach as for dynamic methods could be used, but there's an overhead in term of generated code size that would be too high if applied to all _word!_ values now. I need to find a way to narrow down the cases where a word _could_ be a function call, so that the overhead will be minor.

--------------------------------------------------------------------------------

On 2018-03-27T16:08:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/924#issuecomment-376582212>

    Probably a closely related issue, although I think important to support:
    ```
    b: context [ f: does ["B/F"] ]
    g: func [x][ probe x/f ]
    
    probe b/f
    g b
    ```
    Basically, I just pass an object as argument and wanna call it's method. In the interpreter it prints:
    ```
    "B/F"
    "B/F"
    ```
    In the -c compiled mode:
    ```
    "B/F"
    func []["B/F"]
    ```
    (Red 0.6.3 stable and 2018-3-26-44229, win7 x64)

--------------------------------------------------------------------------------

On 2021-09-18T16:32:12Z, dockimbel, commented:
<https://github.com/red/red/issues/924#issuecomment-922336485>

    @hiiamboris It's the same class of issues. The current compiler cannot recognize function calls expect for the most obvious cases. There is no way to achieve that without actually running the code and deciding _at runtime_ which value is a function call. As the compiler prefetches all arguments for function calls and builds stack frames statically, if it cannot statically recognize a function call at compile-time, then no call will be generated. I've devised a method that mixes static analysis and dynamic decision making for function calls under the term of "dynamic stack", but it proved to be overly complex to implement. This topic is left to be solved at a later stage of Red, where the role of the static compiler might be redefined.

