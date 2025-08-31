
#4252: [View] Summary of mousey hardships on Windows
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/4252>

I've been running `base` (& more) input simulations on W7, here's the results.

**Describe the bug**

1. Mouse events (up/down/click/dbl-click/wheel/over) do not contain the **`alt` flag** when Alt key is down, while key events (key-down/key-up) do contain that flag.
2. Button 4 does not produce **aux-down/aux-up events**, while key events do set an `aux-down` flag when a key event occurs with that button pressed
3. **Button 5** does not produce events (likely TBD), is undetectable by key events (no flag present), but sets the same `aux-down` flag for mouse events (i.e. indistinguishable from button 4)
4. **Wheel** and **click** events do not contain any of **mouse flags** (down/alt-down/mid-down/aux-down), while they do contain key flags (shift/alt/control)
5. **`base`** face does not produce an **`on-click`** event, though it does produce `on-dbl-click` (intentional? rationale?)
6. Second (fast) click of buttons other than left (double alt-click, double mid-click) are not producing any events at all. E.g. you click right button twice and only get **one `alt-down` event and two `alt-up` events**(!!!).
7. Right button does not produce an **`alt-down`** event if left button is also down, though it does produce an `alt-up` event.
8. In `all-over` mode, an **extra `on-over`** event is generated after `on-up` even if pointer was still.

**To reproduce**

You can test all the outlined issues on the following snippet
```
system/view/capturing?: yes
last: none
view [
	base "TEST ON ME" cyan all-over focus on-detect [
		this: form reduce [event/type mold event/flags]
		unless last = this [last: this print this]
	]
]
```

**Expected behavior**

1. `alt` flag supported in mouse events
2. `aux-down`/`aux-up` events (or `aux1-down`/`aux1-up`? or `back-down`/`back-up`?)
3. `aux2-down`/`aux2-up` events (or `forward-down`/`forward-up`?) and `aux2-down` flag in flags
4. `wheel` & `click` events should properly reflect mouse flags
5. `on-click` event for base, panel, window (and probably more...)
6. Second `alt-down`/`mid-down`/`aux-down`/`aux2-down` event should fire too
7. `alt-down` event fires with left button down as well
8. No `on-over` event in absence of mouse movement

(9. Should there be also an `event/alt?` field akin to `/ctrl?` and `/shift?` for consistency ?)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00
```



