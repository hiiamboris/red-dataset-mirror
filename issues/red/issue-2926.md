
#2926: libRed: Better reference handling
================================================================================
Issue is open, was reported by AntonMeep and has 4 comment(s).
[type.wish] [type.GC] [type.design]
<https://github.com/red/red/issues/2926>

Hello! I am developing a binding to libRed for the D programming language. Currently I am working on the high-level wrapper but I found out that it isn't possible because of the way libRed manages its memory.

As defined in documentation:
> Red values can be returned by libRed function calls. They are represented as opaque 32-bit references. Those references are short-lived, so they are suitable only for restricted local use, like passing that reference to another libRed function call. Setting such references to host variables is possible, but it should be used immediately after. Those references are using a specific memory manager that will only **keep references alive for about the next 50 API calls**.

Which results in:
1. Almost useless API. Yes, it runs some code, but Red values cannot be handled properly. (stored and managed in the C code)
2. Undefined behaviour because of references pointing to already deleted Red values.
3. Only one way to use API in the safe way is to recreate every single value. So, to make a series of 10 exactly same strings, `redString` should be called 10 times. It leads to a lot of copy/paste which results in even more errors.
4. Non-optimal memory usage. Temporary values aren't deleted ASAP, even if they are never used again.

Workarounds:
1. Use `sprintf` to generate Red code, which will create all needed values in one call.
 - Slow
 - Ugly
2. Store type and value and create Red values when it is necessary
 - Slow
 - High memory usage
 - Even uglier

My thoughts:
Use reference counting to handle references. So, `redCopy` increases reference count, `redFree` decreases and if it is 0, value will be deleted.

Pros:
 - Low memory usage. Values are deleted ASAP.
 - Value can be initialized once and used/copied as many times as needed.
 - Multithreading (in future). You can be sure that reference is still valid and it haven't been deleted by other thread.

Cons:
 - Code breakage.  Which isn't a problem since there are not much code to break. Also, that's why it should be done before Red is released.
 - API will be more complicated, because of need to increase/decrease reference count manually. (Which is not a problem if we are talking about high-level wrappers)

Anyway, I am new to Red language, and I don't know if it can be done this way. I am happy to hear your suggestions and talk about it.


Comments:
--------------------------------------------------------------------------------

On 2017-07-24T16:11:15Z, greggirwin, commented:
<https://github.com/red/red/issues/2926#issuecomment-317472896>

    I imagine this is because Red doesn't have a GC yet (coming soon though), and a temporary GC was added just for libRed, to allow more experiments from other langs. Using Red directly, we have more tricks we can use to conserve memory, which may not be possible with libRed's model. There was a also a recent request for supporting libRed from multithreaded hosts (Go in this case), and Nenad said there was already a plan for that. 

--------------------------------------------------------------------------------

On 2017-07-24T17:23:39Z, AntonMeep, commented:
<https://github.com/red/red/issues/2926#issuecomment-317493803>

    > I imagine this is because Red doesn't have a GC yet (coming soon though), and a temporary GC was added just for libRed, to allow more experiments from other langs.
    
    GC is cool but I don't think it can be used in this case. GC stops everything to collect information about used references, and if we want to use references from the host program, GC should stop it as well. Predictably slow reference counting is much better.
    
    > Using Red directly, we have more tricks we can use to conserve memory, which may not be possible with libRed's model.
    
    I think that libRed should manage memory used in Red code by GC, but values used from the host program should be reference counted.
    
    > There was a also a recent request for supporting libRed from multithreaded hosts (Go in this case), and Nenad said there was already a plan for that.
    
    Nice! But I am more interested in 64-bit support, because multithreading is not that useful if we are restricted to 4Gb of memory.

