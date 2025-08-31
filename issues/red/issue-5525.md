
#5525: [View] Platform differences in key events
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[GUI] [type.design]
<https://github.com/red/red/issues/5525>

**Describe the bug**


I was trying to figure out when to use `key` and when `key-down` events, and found these differences and peculiarities:

| key pressed | W10 `key` | W10 `key-down` | GTK `key` | GTK `key-down` | suggested preference |
| -|-|-|-|-|-|
| LCtrl | no event | `left-control` | `left-control` | `left-control` | no event for `key` |
| LShift | no event | `left-shift` | `left-shift` | `left-shift` | no event for `key` |
| LAlt | no event | `left-alt` | `left-alt` | `left-alt` | no event for `key` |
| LWin | `left-command` | `left-command` | no event | no event | no event for `key`, event for `key-down` |
| Menu | `none` | `#"]"` | `none` | `#"^R"` | as `menu` word for both `key` and `key-down` |
| Pause | `pause` | `pause` | `left-control` `num-lock` | `left-control` `num-lock` | as `pause` |
| Tab | `#"^-"` | `#"^-"` | `#"^-"` | no event | event for both `key` and `key-down` |
| Ctrl+Tab | no event | `#"^-"` | `#"^-"` | no event | have both events report it |
| Ctrl+Enter | `#"^/"` | `#"^M"` | `#"^M"` | `#"^M"` | `#"^/"` everywhere, incl. normal Enter |
| Delete (the gray one) | `delete` | `delete` | `#"^~"` | `delete` | `delete` everywhere |
| {5} (numpad center, w/o numlock) | `none` | `#"^L"` | `none` | `#"^L"` | maybe as `center` or `numpad5` word? |
| Keys: `` `-=[];',./\ `` | key as char | key as char | key as char | garbage, usually `#"^@"` | key as char everywhere |
| Ctrl+Keys: `` `~-=+[];',./\!#$%&*( `` (some with Shift on my KB, and can't test `Ctrl+)`) | no event | key as w/o Ctrl | key as w/o Ctrl | garbage, usually `#"^@"` | key as w/o Ctrl |
| Ctrl+Keys: `0123456789` | no event | key as w/o Ctrl | key as w/o Ctrl | key as w/o Ctrl | key as w/o Ctrl |
| Ctrl+@ (as Ctrl-Shift-2) | `#"^@"` | `#"2"` | `#"@"` |  `#"^@"` (garbage?) | `#"@"` for key, `#"2"` for key-down |
| Ctrl+^ (as Ctrl-Shift-6) | `#"^(1E)"` | `#"6"` | `#"^^"` |  `#"^@"` (garbage) | `#"^^"` for key, `#"6"` for key-down |
| Ctrl+_ (as Ctrl-Shift-Minus) | `#"^_"` | `#"-"` | `#"_"` |  `#"^@"` (garbage) | `#"_"` for key, `#"-"` for key-down |
| Alt+Keys: `` `-=[];',./\ `` | no event | key as w/o Alt | key as w/o Alt | garbage, usually `#"^@"` | key as w/o Alt |
| Alt+other Keys | no event | key as w/o Alt | key as w/o Alt | key as w/o Alt | key as w/o Alt |
| Ctrl ignores input language? | Yes | Yes | No | Yes | ignore for letters, not for symbols/digits |
| Alt ignores input language? | N/A (no event) | Yes | No | N/A (garbage) | ignore for letters, not for symbols/digits |
| Any non-English layout char | localized char | original key | localized char | `#"^@"` (garbage) | as on W10 |


**To reproduce**

I used this simple script:
`view [base focus on-key-down [print ["kd" mold event/key]] on-key [print ["k" mold event/key]]]`

**Expected behavior**

I suggest we should make the behavior cross-platform to ease it for the language users. Also need to test this on a Mac eventually.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 175 date: 1-Jul-2024/17:21:21 commit: #bbecb7eb6c23ef1040208187fb0fe160a4223c7f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-08-24T20:20:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/5525#issuecomment-2308526667>

    All this `key` vs `key-down` question is a really messy, so no wonder there's discrepancies.
    
    Ideally:
    - `key-down` should report a virtual *key*. E.g. one shouldn't require to switch input language to use the Ctrl+C shortcut.
    - `key` should report its localized *representation* with Shift, CapsLock and NumLock states accounted for (AltGr probably too). Useful for localized text input.
    
    This already however breaks on many occasions:
    - Windows ignores the language with Ctrl, but GTK doesn't 🤦‍♂️ Must be the reason why Windows doesn't produce many `key` events with Ctrl (like Ctrl+= or Ctrl+Shift+=), as it's hard to uniformly identify keys outside the A-Z range and digits: symbols jump from key to key between layouts.
    - `key-down` result depends on NumLock. Not the best behavior for games, but probably reasonable otherwise.
    - `key` definitely reports much more than just text input: navigation and edit keys, even Pause and Win keys. On the other hand it also skips a lot of key combinations. Why should e.g. `key` event report `Ctrl+Left` (jump to the previous word start) but block `Ctrl+Plus` (zoom in)? It's even backwards if you think about it: `Ctrl+Left` does not depend on Shift/Caps/AltGr state, so should not belong to the `key` event, while `Ctrl+Plus` does depend on the Shift state, and on small keyboards even requires Shift (but [not on all layouts](https://keyshorts.com/blogs/blog/44712961-how-to-identify-laptop-keyboard-localization)).
    
    This seriously complicates the UI definition, as there are two events to react to and no clear guidelines what events should be accepted by which one and skipped by the other one (don't want to react twice!), or even what each platform really supports.
    
    I'm currently leaning towards the idea that `key` should report all keys that may matter to the usual application, folding Shift into the key and ignoring the input language for A-Z when Ctrl or Alt is down (but not for any other keys: don't want Shift state and language to affect Ctrl+letter and Alt+letter shortcuts, but want it to affect all other keys which will vary between layouts). `key` should exclude events from single modifier keys (Alt/Ctrl/Shift/Win/Meta/Hyper/etc), and maybe Lock keys too. All the OS keys will be intercepted by the OS, so we don't have to worry about that. Then most applications would only have to use the `key` event for everything and could ignore the `key-down`, while games or some other apps that care about the keys but not the language will stick to the `key-down` and ignore the `key`.
    
    ---
    
    On Ctrl+Enter: `#"^/"` (line feed) char makes sense for normal Enter as then it can be directly inserted into the input of e.g. custom `area` widget. If we can agree on that, then with modifiers it should report the same char. Not the `#"^M"` it currently reports, because in Red we do not use this char for line feed (and Linux doesn't either, and on Windows you need two chars anyway). If however we don't want to insert it literally into the input, then it makes more sense to have it report the word `enter` instead as it's much less esoteric for the user (who may not easily make the connection between ASCII code 13 (or 10) and Enter key from experience).

