
#4427: `read` on urls doesn't apply CRLF->LF translation
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4427>

**Describe the bug**

`do https://raw.githubusercontent.com/hiiamboris/whatever/master/crlfs.red`
![](https://i.gyazo.com/748cf312efe5630edd9e5ad8b3480274.png)

```
>> read https://raw.githubusercontent.com/hiiamboris/whatever/master/crlfs.red
== {Red [needs: view]^M^/^M^/view [^M^/text ^{^M^/123^M^/234^M^/345^M^/456^M^/567^M^/678^M^/789^M^/890^M^/901^M^/012...
```
While when saved:
```
>> write/binary %1.red read/binary https://raw.githubusercontent.com/hiiamboris/whatever/master/crlfs.red
>> do %1.red
```
![](https://i.gyazo.com/e703804478e276b23a50cc50042bb798.png)
Which is also wrong by 1 line :/


**To reproduce**

`do https://raw.githubusercontent.com/hiiamboris/whatever/master/crlfs.red`

**Expected behavior**

CRLFs become LFs without /binary refinement.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



