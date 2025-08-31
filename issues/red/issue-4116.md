
#4116: [View] Regression in font application
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4116>

**Describe the bug**
https://gitter.im/red/help?at=5db4536814d55a37857d7b9b
```
f: make font! [ name: "Times New Roman" size: 18 ]
view [ canvas: base 150x150 white draw [font f text 50x50 "Hello!!!!" circle 70x60 40]]
```
Related to https://github.com/red/red/pull/4072 likely
![](https://i.gyazo.com/9beb6fd90144afe838b778b99fef9f51.png)

**Expected behavior**
![](https://i.gyazo.com/ff0b80a70b0522dbbdd77dae69550df5.png)

This and https://github.com/red/red/issues/3225 need a dedicated set of tests in `base-self-test.red`.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Oct-2019/15:33:41+03:00 commit #ed913ef
```



