
#3741: [View] Regression: `on-over` gets an invalid `event/offset` when `away?`
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[type.bug] [type.review] [GUI]
<https://github.com/red/red/issues/3741>

**Describe the bug**

```
>> view [base 100x100 on-over [probe event/offset]]
64x99
-9x-9
```
1st offset is when mouse enters, the 2nd is when it leaves (`away? = yes`)
**2nd offset is invalid!**

Regression crawled in with 2 commits in June (mostly the 1st one):
- https://github.com/red/red/commit/ad795e8b6bae3767d7cad4f232579092ea6f83c3
- https://github.com/red/red/commit/8240bfdac499cbf0f735b1a355eff4a1e69eb3a2

Initially there was this code:
```
if all [evt? IsWindowEnabled hover-saved] [
	msg/hWnd: hover-saved
	make-event msg EVT_FLAG_AWAY EVT_OVER
]
```
That doubled the WM_MOUSEHOVER event into the face it leaves (+ normally it goes into the face it enters).
After these commits, the `away? = yes` branch was only triggered by the WM_MOUSELEAVE code. What was overlooked is that this WM message is totally unsuitable for that because it **does not contain the pointer coordinates**. So the event gets 0x0 in window coordinates, which translates to `0x0 - face/offset` in face coordinates, hence the invalid result.

**Expected behavior**

`on-over` should provide proper event coordinates in face's coordinate system, even when `away?` flag is true. Both with `all-over` flag on and off. Of course this offset will be outside of the `0x0..face/size` box.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-16T22:29:20Z, endo64, commented:
<https://github.com/red/red/issues/3741#issuecomment-454968762>

    Is this related to (or duplicate of) #1745 ?

--------------------------------------------------------------------------------

On 2019-01-17T03:39:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/3741#issuecomment-455031121>

    Related, yes. Duplicate, no.

