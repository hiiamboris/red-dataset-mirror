
#4206: [View] `do-events/no-wait` processes only ONE event
================================================================================
Issue is open, was reported by hiiamboris and has 82 comment(s).
[type.review]
<https://github.com/red/red/issues/4206>

**Describe the bug**

I would expect `do-events/no-wait` to process all queued events before returning, but [it processes only one event](https://github.com/red/red/blob/544a6e12b265765d343bd71a483cd79de383dbc6/modules/view/backends/windows/events.reds#L1581) ([likely a leftover from the 2015 version of it](https://github.com/red/red/blob/a171bbe43781b33f9a462096b0d3e4862877e11a/modules/view/backends/windows/events.reds#L478)). Otherwise I have to call it in a loop a lot of times to be sure.


**To reproduce**

I'm running mouse click simulations, but here's a silly example:
```
view [
	b: base on-down [n: n + 1]
	button "hit me" [
		n: 0
		b/color: red
		loop 10 [do-events/no-wait]	;) multiple calls only to force it to renew b/color
		wait 3
		b/color: gray
		loop 10 [do-events/no-wait]
		print [n 'presses 'detected]
	]
]
```
1. Click the button, observe the base turning red
2. Click the base many times during 3 seconds (until it becomes gray again)
3. Observe the message in the console: 10 calls to `do-events` can detect up to 4 clicks (other 4 times are likely wasted on `on-up` events, another 2 on `b/color`)

**Expected behavior**

A single call to `do-events/no-wait` empties the window message queue.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Dec-2019/19:03:46+03:00 commit #544a6e1
```



Comments:
--------------------------------------------------------------------------------

On 2019-12-27T08:05:02Z, qtxie, commented:
<https://github.com/red/red/issues/4206#issuecomment-569216393>

    Check the message queue once and exit, I think that's how `do-events/no-wait` works. (Maybe should call it `do-events/once` 🤔). 

--------------------------------------------------------------------------------

On 2019-12-27T11:40:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-569252609>

    Maybe. Though what would be the practical purpose of doing one event?
    If it's useful, can we have both `/no-wait` for emptying the queue, and `/once` for a single event? I don't feel very comfortable with `while [do-events/no-wait][]` construct.

--------------------------------------------------------------------------------

On 2019-12-27T12:41:50Z, qtxie, commented:
<https://github.com/red/red/issues/4206#issuecomment-569262227>

    The user can post messages to the message queue inside face event handlers. So the queue may never be emptied.

--------------------------------------------------------------------------------

On 2019-12-27T13:14:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-569267166>

    I see. It's a question of wording then...

--------------------------------------------------------------------------------

On 2019-12-27T13:19:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-569268089>

    Tricky. I need to flush the queue, but don't wanna be caught in a possible deadlock. If I knew how many messages have been queued so far, I could process just them and stop, so that newly generated ones will have to wait till later. Alas, there's no way of knowing the current queue size, and it seems Windows does not provide any API for that. So the only way to do that is to repeatedly call PeekMessage and save the messages into a temporary buffer, then empty that buffer. Which sounds boringly complex... ☻

--------------------------------------------------------------------------------

On 2019-12-27T20:40:50Z, greggirwin, commented:
<https://github.com/red/red/issues/4206#issuecomment-569342275>

    To keep the user from having to manually loop, we could add a refinement to specify the maximum number of events to process. `/part` is close to the meaning, but `/no-wait` is already there for *almost* this purpose. Adding an arg for that will be a breaking change, and also not be as explicit. `/limit` or `/max` are other possible names. 

--------------------------------------------------------------------------------

On 2022-09-26T08:56:54Z, qtxie, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257713700>

    Is that possible to remove `/no-wait`? What's the use cases?
    
    Sometimes I use it in the gui-console, but what I want is actually `view/no-event-loop`, not to consume 1 event with `/no-wait`.

--------------------------------------------------------------------------------

On 2022-09-26T09:15:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257736434>

    What about instead:
    - `do-events/pull` to process all queued input events
    - `do-events/push` to sync all queued facet changes (only those queued by the time of `do-events` call)
    ?

--------------------------------------------------------------------------------

On 2022-09-26T09:38:53Z, Oldes, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257767093>

    Would not it be more correct to have _timeout_ instead of `/no-wait`. There is many event types coming in and you you should not expect that the one you are waiting for is the one you want.

--------------------------------------------------------------------------------

On 2022-09-26T09:42:26Z, qtxie, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257771149>

    @hiiamboris  I don't think it's possible to do it on Windows event queue.

--------------------------------------------------------------------------------

On 2022-09-26T09:47:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257777686>

    > @hiiamboris  I don't think it's possible to do it on Windows event queue.
    
    Where do you see a showstopper?

--------------------------------------------------------------------------------

On 2022-09-26T10:29:39Z, qtxie, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257825751>

    @Oldes Yes. Timeout is useful especially considering IO.

--------------------------------------------------------------------------------

On 2022-09-26T10:32:06Z, qtxie, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257828347>

    > Where do you see a showstopper?
    
    Windows doesn't provide a way to do it. No way to get all the queued events.

--------------------------------------------------------------------------------

On 2022-09-26T10:44:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257840715>

    I don't see a problem. Just call GetMessage multiple times and it will flush the queue eventually.
    You could even simply specify a range from WM_KEYFIRST to WM_MOUSELAST to get most input events, although more precise filtering will require multiple calls to GetMessage, so stashing the queue locally is a better option IMO.

--------------------------------------------------------------------------------

On 2022-09-26T10:45:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257842559>

    `/timeout` means program will do nothing useful, and is easy to cook up on the mezz level on top of `/no-wait` (better named `/once`) or `/pull`.

--------------------------------------------------------------------------------

On 2022-09-26T11:34:29Z, Oldes, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257894642>

    `GetMessage` is blocking. So you should not just call it _multiple times_. `PeekMessage` should be used with some way of detection, when to stop... how many events to process (or the timeout).

--------------------------------------------------------------------------------

On 2022-09-26T11:54:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257918439>

    Indeed

--------------------------------------------------------------------------------

On 2022-09-26T12:47:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1257989341>

    If you're going to change how event loop works, also consider https://github.com/red/red/issues/4881
    Windows has this order:
    <img width=300 src=https://i.gyazo.com/9daf42ac4c0b9b1b25dc8f799687a2c0.png></img>
    So if I'm reacting to a lot of `over` events for example, I may not get `time` event at all for seconds or more.
    On GTK it's the other way around.. if I'm reacting to `time` events, it won't tell me the mouse moved thousand times over the window.
    This boring discrepancy will require a clever solution, that may start with fetching all events and prioritizing them using our own cross-platform algorithm.

--------------------------------------------------------------------------------

On 2022-09-26T17:11:57Z, greggirwin, commented:
<https://github.com/red/red/issues/4206#issuecomment-1258359868>

    I don't know if ad hoc hacks on this will produce results we want.
    
    This is a big design question, and @dockimbel has to say how much time should be spent on it right now. Whether we try to wrap things at the high level or build an async eventing/observer system, there's a lot to consider. Let's get IO in place first, since that also has to tie into the design. Some of this we can also address with docs. There will be limits, but if people know what they are, that helps them enormously. It may mean more work, but that's life. I want a real eventing system of course, but those can be more work to develop in many cases. What we want is for the simple cases to be handled as cleanly as possible, and only use advanced approaches when necessary. 

--------------------------------------------------------------------------------

On 2022-09-27T12:26:52Z, dockimbel, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259433196>

    > Is that possible to remove /no-wait? What's the use cases?
    
    Being able to process events inside long-lasting user loops. If an event handler requires a long time (one or more seconds) to do its processing, it needs a way to process pending events (mostly GUI ones) momentarily or otherwise the application can look frozen to the end user. So, no it's not possible to drop `do-events/no-wait`, it's needed, at least as long as Red relies on a single thread of execution.
    
    > Sometimes I use it in the gui-console, but what I want is actually view/no-event-loop, not to consume 1 event with /no-wait.
    
    `/no-wait` just means "do not block". If View could know if there's already an event loop running, then we could bypass the call to `do-events/no-wait` in such case (we still would need it if no event loop is running, at least to show the new window). You could expose a read-only logic flag under `system/view` so that we could check that at mezz level.

--------------------------------------------------------------------------------

On 2022-09-27T12:29:29Z, dockimbel, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259436336>

    > If you're going to change how event loop works,
    
    We won't make any significant change there unless needed by IO support or until we reach the v1.1 milestone where we'll make some deep improvements to View while porting it to 64-bit.

--------------------------------------------------------------------------------

On 2022-09-27T12:32:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259440112>

    Well, for the purposes of this issue I would suggest simply a better naming, e.g. `do-event` processes one event if one is pending, and `do-events` can be written as `forever [do-event]` or `until [not do-event]` or something (need to add explicit `wait` in case no event is pending).

--------------------------------------------------------------------------------

On 2022-09-27T12:38:13Z, Oldes, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259446655>

    You could replace `/no-wait` with `/timeout` using its value equal to zero imho. On macOS it is called `untilDate`/`expiration` https://developer.apple.com/documentation/appkit/nsapplication/1428485-nexteventmatchingmask

--------------------------------------------------------------------------------

On 2022-09-27T12:44:19Z, Oldes, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259453206>

    Btw... @hiiamboris, I believe that title of this issue is not correct... `do-events/no-wait` does not process _only one event_. It should process already queued events (at least on Windows), because the `PeekMessage` is inside a `while` loop and so it should process events as long as there are some. But you expect to wait for an event, which is not yet queued (but it is just my guess... I was not playing with View long enough).

--------------------------------------------------------------------------------

On 2022-09-27T12:49:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259458767>

    > Btw... @hiiamboris, I believe that title of this issue is not correct... `do-events/no-wait` does not process _only one event_.
    
    Have you tried reproducing the issue? On my W10 it can register up to 5 clicks to base. 5 downs + 5 ups = 10 events = 10 calls to `do-events`

--------------------------------------------------------------------------------

On 2022-09-27T12:50:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259460066>

    But thanks for the illustration of how confusing the name is :)

--------------------------------------------------------------------------------

On 2022-09-27T16:39:22Z, greggirwin, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259771061>

    We inherited the name, and it's not perfect. e.g. it doesn't actually _do_ events. To avoid breaking code now, why don't we deprecate it and define a new alias called `yield` (which has potential broader concurrency meaning) so could be `yield/OS` to process _just_ the event loop. No other good words come to mind at the moment. Then people know the change is coming, and it's a matter of deciding if we define it now, or wait or IO and concurrency to help inform the design.

--------------------------------------------------------------------------------

On 2022-09-27T18:41:59Z, luce80, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259908451>

    `do-events` does **2** things: without the refinement it processes all the events so the plural is legitimate, with the refinement it processes only one event and returns immediatly without waiting so the name is not that bad. If you use `do-event` then how do you explain that it processes many events ;) ?. About flushing queued events in R2 I used this:
    ```
    wait-fast: func [
    	"Allow GUI messages to be processed faster then wait." ; enhanced version of flush-events by Anton Rolls
    	/skip events [block!] "types of events to skip. Default: [move]"
    	/local evt
    	] [
    	events: any [events [move]]
    	; Remove the event-port
    	remove find system/ports/wait-list system/view/event-port
    	
    	; Clear the event port of queued events
    	while [evt: pick system/view/event-port 1][if not find events evt/type [do evt]]
    	
    	; Re-add the event-port to the wait-list
    	insert system/ports/wait-list system/view/event-port
    ]
    ```
    and this did miracles, even a sloppy script becames usable. So in R2 the trick was to avoid incoming events while you are flushing/processing the queued events.

--------------------------------------------------------------------------------

On 2022-09-27T18:52:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259919402>

    > If you use `do-event` then how do you explain that it processes many events ;) ?
    
    `do-event` + `do-events` (latter can be a mezz) (I just think `do-event` is a **much** better name than `do-events/once` :)

--------------------------------------------------------------------------------

On 2022-09-27T19:13:09Z, Oldes, commented:
<https://github.com/red/red/issues/4206#issuecomment-1259939653>

    @luce80 actually your R2 function is not doing what was discussed here... it just removes events, which are already on the Rebol side to be processed.. the native system functions like `PeekMessage` or `GetMessage` are used to take system events and make Rebol events from it. So basically there are 2 ques.. system one and Rebol/Red one.

--------------------------------------------------------------------------------

On 2022-09-28T07:20:22Z, qtxie, commented:
<https://github.com/red/red/issues/4206#issuecomment-1260491293>

    Suppose we have 2 event handlers, `A` and `B`. Calling `do-event/no-wait` inside `A` handler triggers `B` handler, and we also calls `do-event/no-wait` inside `B`. If we're not lucky, `A` handler may be triggered. We'll get a stack overflow error eventually.
    This is the big drawback of using `do-event/no-wait`. IIRC, there was a ticket caused by it.

--------------------------------------------------------------------------------

On 2022-09-28T08:24:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1260559209>

    Like this? 
    `view [base white "move over me" rate 100 on-time [wait 0.01 loop 10 [do-events/no-wait]] all-over on-over [wait 0.01 loop 10 [do-events/no-wait]]]`
    
    GUI console hangs after closing it

--------------------------------------------------------------------------------

On 2022-09-28T17:44:27Z, greggirwin, commented:
<https://github.com/red/red/issues/4206#issuecomment-1261247891>

    @dockimbel what do you think of my `yield` idea above?

--------------------------------------------------------------------------------

On 2022-09-28T17:58:53Z, dockimbel, commented:
<https://github.com/red/red/issues/4206#issuecomment-1261278989>

    > We inherited the name, and it's not perfect. e.g. it doesn't actually do events.
    
    `do` in Redbol context should be read as "evaluate". Moreover, in R2 (or maybe R3), I remember seeing that `event!` values could be evaluated using `do`, as a way to push an event in the event queue and get it processed.
    
    `yield` is a reserved word for concurrency handling using coroutines with very specific semantics attached, like specifying an exit/entry point in a function (see how it's used in other languages). So it would be better not to use it for other purposes until we get to concurrency handling.

--------------------------------------------------------------------------------

On 2022-09-28T18:02:00Z, dockimbel, commented:
<https://github.com/red/red/issues/4206#issuecomment-1261283224>

    > This is the big drawback of using do-event/no-wait. IIRC, there was a ticket caused by it.
    
    I'm not sure how big of a drawback it is, but it is the user responsability to architecture his event handlers properly to avoid such infinite recursion. Until we get some concurrency support, we can't drop such function, it is needed for long-running loops in an event-oriented app.

--------------------------------------------------------------------------------

On 2022-09-28T18:55:48Z, greggirwin, commented:
<https://github.com/red/red/issues/4206#issuecomment-1261336561>

    > `yield` is a reserved word for concurrency handling using coroutines with very specific semantics attached
    
    I understand that some langs use it as a keyword to implicitly create an iterator/generator, but for Red it seems better to have a specialized func maker, and then `return` could behave appropriately based on whether it's in a generator or not. @hiiamboris could weigh in here, as I think he's played with definitional returns to some extent. Certainly thunks make them tricky, but that's another case of telling people "Don't DO that! Red doesn't have to support your poor life choices." :^)

--------------------------------------------------------------------------------

On 2022-09-28T19:36:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1261382073>

    `return` in that context should IMO terminate the coroutine (otherwise how do you do that?). `yield` seems fine for giving up the flow but getting back later, which also aligns with the "yield remaining time slice" common meaning (`wait 0`).

--------------------------------------------------------------------------------

On 2022-09-28T20:01:07Z, greggirwin, commented:
<https://github.com/red/red/issues/4206#issuecomment-1261405058>

    > otherwise how do you do that?
    
    `exit`.

--------------------------------------------------------------------------------

On 2022-09-29T01:19:17Z, qtxie, commented:
<https://github.com/red/red/issues/4206#issuecomment-1261628622>

    > What about instead:
    > 
    >     * `do-events/pull` to process all queued input events
    > 
    >     * `do-events/push` to sync all queued facet changes (only those queued by the time of `do-events` call)
    >       ?
    
    I prefer to remove features instead of adding more. We should really define the scope of the View/VID. I think it's designed for small tools for now. For example, tool like [rufus](https://rufus.ie/en/) which has simple native UI. So let's keep it simple and focus. If we keep spreading our resource on both Red/Core and View/VID, they'll progress slowly and die slowly.

--------------------------------------------------------------------------------

On 2022-09-29T18:44:24Z, greggirwin, commented:
<https://github.com/red/red/issues/4206#issuecomment-1262677230>

    > We should really define the scope of the View/VID.
    
    Agreed. It's a different world than R2 VID was meant for, and many of us hit walls with it. Galen's `animate` lib, scatter/gather of data for LoB apps, etc. are higher level features over VID, but worth considering how they integrate. Big games are out of scope IMO, but being the scripting and data language _in_ them is a great use case. R2 actually let you go quite far, side scrollers, the box game @dockimbel did (IIRC), and a simple raycaster. Games are fun, and many don't require heavy graphics, but utility and business apps are where Red can provide a lot of real value.

--------------------------------------------------------------------------------

On 2022-09-29T19:09:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4206#issuecomment-1262703090>

    While I agree it's not pressing to improve the design, let's not limit View (and Draw, and event queue) by what VID is made for. My proposal above at least covers most use cases I can imagine. `/no-wait` only covers custom event loop and nothing else. Again, not saying let's make new refinements ASAP. Just throwing in design thoughts for the future View, and that this name must change if it's to stay.
    
    Let's defer this issue until IO is in.

