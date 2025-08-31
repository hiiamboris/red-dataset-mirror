
#3674: Auto complete doesn't work with uppercase file names
================================================================================
Issue is closed, was reported by endo64 and has 6 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/3674>

**Describe the bug**
If there is a file named in uppercase in a folder, auto complete doesn't work correctly.

**To reproduce**

1.Create files named: `test1`,  `test2`, `TEST3`
2.Open console (GUI or CLI)
3.Go to that folder, type `%te` and press `tab`

**Expected behavior**
`%te` should be completed to `%test`

Case sensitive OSes should be considered as well.

**Platform version**
```
RED: [ branch: "master" tag: #v0.6.4 ahead: 47 date: 11-Dec-2018/3:54:21 commit: #ba127045ba10d19e0f586013432afc0b8e65b0b9 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-21T18:25:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3674#issuecomment-449462729>

    I think the issue is when case is mixed for any matches, due to `common-substr` comparing char by char (which is case sensitive). `common-substr` should probably be rewritten. It's structure is not great IMO. The algorithm is fine, but it is completely side effect based. Changing that will affect the other auto-complete code though.

--------------------------------------------------------------------------------

On 2018-12-26T03:52:15Z, qtxie, commented:
<https://github.com/red/red/issues/3674#issuecomment-449898539>

    Code changed in commit 89f29492c2dae5a019f4158f7c75bf8cc4dad207

--------------------------------------------------------------------------------

On 2018-12-31T23:45:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3674#issuecomment-450699529>

    Works on Windows now, with the code changed to use `find`. However, `/case` is not used with find, so it will not match case on case-sensitive file systems at this time. The question is, should it? It would have to be an environment option. By default, I prefer case-insensitive matching. 

