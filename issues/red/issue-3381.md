
#3381: cosine gives incorrect result when run in macOS GUI console
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/3381>

`cosine/radians pi / 2` gives the result `0.0` in the Windows GUI console and the macOS CLI console but gives `1.615544574432587e-15` in the macOS GUI console.

When 'pi` is displayed in the macOS GUI console, it has one less significant digit than when displayed in macOS CLI and Windows GUI consoles. 

### Expected behavior
```
>> cosine/radians pi / 2
== 0.0
>> pi
== 3.141592653589793
```
### Actual behavior
```
>> cosine/radians pi / 2
== 1.615544574432587e-15
>> pi
== 3.14159265358979
```
### Steps to reproduce the problem
### Red and platform version
```
commit 7c5f402062ac67fbd6078592ca477bbe91a56f92 (HEAD -> master, upstream/master)
macOS 10.12.16
Windows7 64
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-21T22:59:01Z, qtxie, commented:
<https://github.com/red/red/issues/3381#issuecomment-390807816>

    I don't have a macOS 10.12.16 version. I got correct result on macOS 10.11.6 and macOS 10.13.4.

--------------------------------------------------------------------------------

On 2019-09-05T16:55:24Z, qtxie, commented:
<https://github.com/red/red/issues/3381#issuecomment-528460184>

    It works fine on macOS 10.14. I'll close it now.

