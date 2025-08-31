
#3761:  Red changes history (gui console)
================================================================================
Issue is closed, was reported by nedzadarek and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3761>

**Describe the bug**
Gui console changes already printed text

**To reproduce**
Steps to reproduce the behavior:
[git/help post by Gregg Irwin](https://gitter.im/red/help?at=5c50b97c8aa5ca5abf512436):
```
s: ""
```
then type following line few times:
```
append s "*" print length? s print s
```
You should see a number of stars printed is changing and the stars have equal numbers.


**Expected behavior**
Already printed text should not be modified:
```
>> s: ""
== ""
>> append s "*" print length? s print s
1
*
>> append s "*" print length? s print s
2
**
```


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 19-Jan-2019/13:54:56+01:00 commit #4880ddb
```



