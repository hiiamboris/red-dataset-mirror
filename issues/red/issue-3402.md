
#3402: Segmentation fault on http:// read
================================================================================
Issue is closed, was reported by loziniak and has 12 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3402>

### Expected behavior
```
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="https://redmine.robotix-lozinski.pl/">here</a>.</p>
<hr>
<address>Apache/2.4.25 (Debian) Server at redmine.robotix-lozinski.pl Port 80</address>
</body></html>
```

### Actual behavior
```
*** Runtime Error 32: segmentation fault
*** at: F7A3A664h
```

### Steps to reproduce the problem
`>> read http://redmine.robotix-lozinski.pl/`

### Red and platform version
```
RED: [ branch: "master" tag: #v0.6.3 ahead: 716 date: 21-May-2018/10:00:21 commit: #9e5803bb48f6cb39eed40b7af22e4c8853dafd2f ]
PLATFORM: [ name: "Arch Linux" OS: 'Linux arch: 'x86_64 version: 4.15.15 build: "#1 SMP PREEMPT Sat Mar 31 23:59:25 UTC 2018" ]
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-31T01:41:12Z, qtxie, commented:
<https://github.com/red/red/issues/3402#issuecomment-393374308>

    I tried with the latest version on Ubuntu 18.04 kernel 4.15.0, seems works fine. 
    `read` will auto-redirect the link by default, this is result:
    ```
    >>  read http://redmine.robotix-lozinski.pl/
    == {<!DOCTYPE html>^/<html lang="pl">^/<head>^/<meta charset="utf-8" />^/<meta http-equiv=
    ```

--------------------------------------------------------------------------------

On 2018-06-02T13:46:10Z, loziniak, commented:
<https://github.com/red/red/issues/3402#issuecomment-394088820>

    Maybe #2252  is the duplicate, because this http request is redirected to https url.

--------------------------------------------------------------------------------

On 2018-06-06T23:10:18Z, loziniak, commented:
<https://github.com/red/red/issues/3402#issuecomment-395242325>

    Another strange behavior: When I run this script from file:
    ```
    Red []
    
    probe write/info http://httpbin.org/put [PUT [Content-Type: "Content-Type: text/html; charset=utf-8"] "Hello Red"]
    ```
    ... I get a segfault, but when I run this from a console, all is ok:
    ```
    >> probe write/info http://httpbin.org/put [PUT [Content-Type: "Content-Type: text/html; charset=utf-8"] "Hello Red"]
    ```

--------------------------------------------------------------------------------

On 2018-09-29T07:38:13Z, rebolek, commented:
<https://github.com/red/red/issues/3402#issuecomment-425624328>

    @qtxie to reproduce this bug, use Arch-based distro.

--------------------------------------------------------------------------------

On 2018-09-29T08:45:04Z, xmonader, commented:
<https://github.com/red/red/issues/3402#issuecomment-425628235>

    I've the same on my archlinux machine

--------------------------------------------------------------------------------

On 2018-10-29T00:19:17Z, qtxie, commented:
<https://github.com/red/red/issues/3402#issuecomment-433756143>

    Should be fixed now.

