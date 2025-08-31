
#3804: [Core] object on-change* looks away most of the time
================================================================================
Issue is closed, was reported by hiiamboris and has 26 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/3804>

**Describe the bug**

Given an object
```
o: object [
	i: 1
	on-change*: func [w o n] [print [" ***" w "changed" o ">" n]]
]
```
I want it to know when `i` value is changed.
Currently, only the set-path notation is detected:
```
do probe [o/i: o/i + 1]
do probe [set in o 'i o/i + 1]
do probe [do bind [i: i + 1] o]
```
Results in:
```
[o/i: o/i + 1]			; detected
 *** i changed 1 > 2
[set in o 'i o/i + 1]		; skipped
[do bind [i: i + 1] o]		; skipped
```
This limits the applicability of the `on-change*` a lot.

**Expected behavior**

I expect every change (except by `set-quiet`) to be detected

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```
:point_up: [March 5, 2019 10:48 PM](https://gitter.im/red/bugs?at=5c7ed2a20966d912042ae839)


Comments:
--------------------------------------------------------------------------------

On 2019-03-05T22:17:35Z, greggirwin, commented:
<https://github.com/red/red/issues/3804#issuecomment-469880644>

    @dockimbel will have to speak to whether this is by design. Your suggestion makes sense, and may just be a bug. There is a bit involved, between stack, `object/set-many` and `object/on-set-defined?`, versus the context funcs for setting values.
    
    This works, as the check for object in `set` catches it.
    ```
    >> set o [i: 2]
     *** i changed 4 > i
    == [i: 2]
    ```

--------------------------------------------------------------------------------

On 2019-03-07T09:37:05Z, Oldes, commented:
<https://github.com/red/red/issues/3804#issuecomment-470453938>

    My guess is, that version 2 and 3 would be too difficult to implement (if not impossible) as opposite to version 1, which is quite easy as the reporting is done on [eval-path](https://github.com/red/red/blob/53b5b37b3fd37a2a4b88452b2cc90a7e89c5f428/runtime/datatypes/object.reds#L1129) 

--------------------------------------------------------------------------------

On 2019-03-12T19:10:46Z, dockimbel, commented:
<https://github.com/red/red/issues/3804#issuecomment-472141614>

    The detection on set-paths only is by design. 
    
    Having a generic detection on every word set would be probably too expensive and significantly affect the overall performances of Red (though, this has not been measured, so it's just an educated guess at this point). We can try to extend it when the next iteration on object events will happen, and see how much performance is lost in various common use-cases.
    
    Moreover, in the above set-path version case, the compiler can understand such code pattern and generate static calls to object events, but there's no way for the compiler to do the same for the other non-path cases.
    
    Last reason, set-path represent external accesses, while set-words are used usually for object internal code. So the change events are there to track changes made by outside code, while avoiding internal object changes to trigger events. Internal changes are "known" to the object, so don't need a notification mechanism (`on-change*` call could be inlined in object's function if really needed).
    
    So for now, it will be limited to set-path accessors.

--------------------------------------------------------------------------------

On 2019-03-12T19:30:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/3804#issuecomment-472148394>

    Just for the info, my use case was like this.
    I have a block (tiny DB) with lots of values `[a b c  a b c  a b c ...]`, sort of like reactivity/relations. And I wanted a simple lookup object & a function on that object that, when any of a/b/c is set - will fill in the other two. Like `lookup [a: 1 b]` would detect a change in `a`, perform a search and change `b` and `c` and then return the new `b`. Simple idea, but it requires me to preprocess the block and replace all set-words with set-paths or it won't work.

--------------------------------------------------------------------------------

On 2019-03-26T10:12:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/3804#issuecomment-476557346>

    Worthy of note that the above does work with the reactors (which in turn are supported by R/S), and thus I find it unfair that one cannot build one's own reactivity in pure Red that is not based on the `reactor!` (or `face!`) type:
    ```
    o: make reactor! [
    	i: 1
    	on-change*: func [w o n] [print [" ***" w "changed" :o ">" :n]]
    ]
    
    do probe [o/i: o/i + 1]
    do probe [set in o 'i o/i + 1]
    do probe [do bind [i: i + 1] o]
    ```
    Output:
    ```
     *** on-change* changed ?function? > ?function?
    [o/i: o/i + 1]                                 
     *** i changed 1 > 2                           
    [set in o 'i o/i + 1]                          
     *** i changed 2 > 3                           
    [do bind [i: i + 1] o]                         
     *** i changed 3 > 4                           
    ```

--------------------------------------------------------------------------------

On 2019-03-27T17:47:03Z, greggirwin, commented:
<https://github.com/red/red/issues/3804#issuecomment-477276436>

    Why do you consider the current model unfair? As @dockimbel noted, this limitation could be lifted in the future, but all designs have tradeoffs, whether they be privileged elements or performance. For example, you *could* build your own reactivity system, in pure Red, I imagine, but it wouldn't be compatible with the current one.
    
    Given that it works with reactors, what limitation does it impose? That is, what *can't* you do, other than using a plan `object` instead of a `reactor!`?

--------------------------------------------------------------------------------

On 2019-03-27T19:16:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/3804#issuecomment-477310485>

    @greggirwin True. I seems I can build my own reactivity based on `reactor!` by overriding it's `on-change*` value. ☻ But then what purpose does `object!/on-change*` serve if it can't be relied upon like `reactor!/on-change*`? I just don't understand designs that work *sometimes* or under very *specific conditions*. IMO they create more problems that they solve.

--------------------------------------------------------------------------------

On 2019-03-27T20:21:44Z, greggirwin, commented:
<https://github.com/red/red/issues/3804#issuecomment-477332211>

    We should absolutely document, clearly, how object/on-change* works and its limitations. We can then decide if it's useful, because it works in the most common case, or look at disallowing it, because it will trip up too many people.

--------------------------------------------------------------------------------

On 2019-05-15T14:42:26Z, dockimbel, commented:
<https://github.com/red/red/issues/3804#issuecomment-492684735>

    @hiiamboris 
    > I find it unfair that one cannot build one's own reactivity in pure Red that is not based on the reactor! (or face!) type:
    
    The reactivity framework exposed through `reactor!` and `face!` objects is entirely built in Red, so you can freely write your own reactive frameworks using the built-in `object!` events (that we will extend in the future with more events).
    
    > I seems I can build my own reactivity based on reactor! by overriding it's on-change* value. 
    
    You don't need to do that, just write directly your own objects with their own `on-change*` and `on-deep-change*` handlers.
    
    > But then what purpose does object!/on-change* serve if it can't be relied upon like reactor!/on-change*?
    
    See "Objects ownership system" section in this [blog entry](https://www.red-lang.org/2016/03/060-red-gui-system.html).
    
    > I just don't understand designs that work sometimes or under very specific conditions. IMO they create more problems that they solve.
    
    Do you think Red and View would be better without the current reactive framework and object events? If you have a better alternative, feel free to propose it.
    
    
    All that said, the difference between object! and reactor! in behavior is indeed odd and needs investigation.

--------------------------------------------------------------------------------

On 2019-05-15T15:03:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3804#issuecomment-492693345>

    FYI, in both cases, it works fine when compiled... so it should be possible to make it work the same way in the interpreter.

--------------------------------------------------------------------------------

On 2022-05-05T12:22:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/3804#issuecomment-1118484325>

    Here's a workaround to avoid reactors and use objects:
    ```
    o: make object [on-change*: does []] [
    	i: 1
    	on-change*: func [w o n] [print [" ***" w "changed" :o ">" :n]]
    ]
    
    do probe [o/i: o/i + 1]
    do probe [set in o 'i o/i + 1]
    do probe [do bind [i: i + 1] o]
    ```
    ```
     *** on-change* changed ?function? > ?function?
    [o/i: o/i + 1]
     *** i changed 1 > 2
    [set in o 'i o/i + 1]
     *** i changed 2 > 3
    [do bind [i: i + 1] o]
     *** i changed 3 > 4
    ```
    
    Pure magic...

--------------------------------------------------------------------------------

On 2022-08-26T20:38:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3804#issuecomment-1228928610>

    > Pure magic...
    
    Stack corruption caused by providing an invalid `on-change*` handler with a wrong number of mandatory arguments. Arity needs to be checked and the event handler definition rejected if it's not compliant. This applies to all event handlers provided by the user and called from within the Red runtime.
    
    I'll open a separate ticket for this one, as it's not related to the original topic.

--------------------------------------------------------------------------------

On 2022-08-26T21:48:04Z, dockimbel, commented:
<https://github.com/red/red/issues/3804#issuecomment-1228982183>

    > FYI, in both cases, it works fine when compiled... so it should be possible to make it work the same way in the interpreter.
    
    Now supported in interpreter too, as a side-effect of fixing several object events issues.

