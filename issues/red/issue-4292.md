
#4292: [View] `tight` keyword is order-dependend and little too tight
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[GUI]
<https://github.com/red/red/issues/4292>

**Describe the bug**

1. `tight` keyword of VID doesn't apply when it's not following the text (both 2nd and 3rd faces should be small):
![](https://i.gyazo.com/d86ef43102c8d4f6c3e48401925e8704.png)
```
view [
text "text" blue
text "text" tight blue
text tight blue "text"
]
```

2. It does not account for extra decorations some faces might have:
![](https://i.gyazo.com/9b395d902570fe1a5535cf62d4e1853b.png)
```
view [
	backdrop magenta
	radio blue "text" tight
	check blue "text" tight
	drop-down blue "text" tight
	drop-list blue "text" tight
	area blue "text" tight
	group-box blue "text" tight
]
```

3. It does not account for `pane` contents of `group-box`:
![](https://i.gyazo.com/b20832b2869688590c450af2af467bdb.png)
```
view [
group-box blue "abc" tight [base]
group-box blue "abc" [base]
]
```

**Expected behavior**

1. `tight` should not depend on keyword order
2. "text" should be fully visible
3. `pane` contents should be visible

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 31-Jan-2020/17:12:41+03:00 commit #414cdb3
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-30T16:53:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4292#issuecomment-651918305>

    `drop-down` (group 2) has been fixed.
    ![](https://i.gyazo.com/7ab0183be254966901cd55fba42388ca.png)

--------------------------------------------------------------------------------

On 2022-11-05T16:43:16Z, luce80, commented:
<https://github.com/red/red/issues/4292#issuecomment-1304583894>

    Is bugged if you use it as a new style like: `style text: text font-size 10 tight`

