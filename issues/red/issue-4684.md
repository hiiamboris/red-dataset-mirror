
#4684: crash on reading a URL without scheme
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4684>

**Describe the bug**
`read` and `load` crash when called on a `url!` that denotes an address with a non-existent scheme.

**To reproduce**
```red
read to url! "www.example.org"
load make url! 0
```
```red
*** Runtime Error 1: access violation
*** in file: .../runtime/datatypes/object.reds
*** at line: 109
***
***   stack: red/object/get-values 02D32574h
***   stack: red/port/get-actors 02D32574h
***   stack: red/port/open 02D32574h false false false false 00541FA4h
***   stack: red/port/read 02D32574h 02D32564h 02D32564h false false false 02D32564h
***   stack: red/url/read 02D32574h 02D32564h 02D32564h false false false 02D32564h
***   stack: red/actions/read 02D32574h 02D32564h 02D32564h false false false 02D32564h
***   stack: red/actions/read* -1 -1 -1 -1 -1 -1
```

**Expected behavior**
An error; perhaps in the former case HTTPS should be assumed as a reasonable default.

**Platform version**
df54dcd, W10.


Comments:
--------------------------------------------------------------------------------

On 2020-10-19T12:48:50Z, rebolek, commented:
<https://github.com/red/red/issues/4684#issuecomment-712133259>

    @9214 why HTTPS and not HTTP? I agree that HTTPS should be preferred to HTTP but there are areas where HTTP makes sense still (separated LAN for home automation for example) and in the wild, any self-respecting web server does automatic redirection from HTTP to HTTPS.

--------------------------------------------------------------------------------

On 2020-10-19T14:00:32Z, 9214, commented:
<https://github.com/red/red/issues/4684#issuecomment-712177284>

    @rebolek right, HTTP makes more sense. Thanks!

