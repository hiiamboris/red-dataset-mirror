
#2096: read url! after read file! fails on macOS 
================================================================================
Issue is closed, was reported by x8x and has 24 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2096>

```
  read http://static.red-lang.org/download.html
;   ""
  read http://apple.com
*** Access Error: cannot connect: http://apple.com reason: timeout
*** Where: read
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-06T13:35:56Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2096#issuecomment-230772779>

    Seems to be working for me:
    
    ```
    red>> system/build
    == "6-Jul-2016/21:32:57+8:00"
    red>> system/platform
    == MacOSX
    red>> read http://static.red-lang.org/download.html
    == {<?xml version="1.0" encoding="UTF-8" ?>^/<!DOCTYPE html>^/<html>^/<he
    red>> read http://apple.com
    == {<!DOCTYPE html>^/<html xmlns="http://www.w3.org/1999/xhtml" xml:lan
    ```

--------------------------------------------------------------------------------

On 2016-07-06T15:59:06Z, x8x, commented:
<https://github.com/red/red/issues/2096#issuecomment-230818086>

    Got it narrowed down.
    `%user.red`:
    
    ```
    Red []
    
    ```
    
    `%test.red`:
    
    ```
    Red []
    
    ;do %user.red
    print mold copy/part read http://static.red-lang.org/download.html 20
    print "done"
    ```
    
    `red -c test.red` and `./test`:
    
    ```
    {<?xml version="1.0" }
    done
    ```
    
    `%test.red`:
    
    ```
    Red []
    
    do %user.red
    print mold copy/part read http://static.red-lang.org/download.html 20
    print "done"
    ```
    
    `red -c test.red` and `./test`:
    
    ```
    ""
    done
    ```
    
    Same result with `do load %user.red` `do read %user.red` `do load read %user.red`.

--------------------------------------------------------------------------------

On 2016-07-06T16:35:17Z, x8x, commented:
<https://github.com/red/red/issues/2096#issuecomment-230829854>

    Probably unrelated to `do`, shorter failing example:
    `%test.red`:
    
    ```
    Red []
    
    read %file
    print mold copy/part read http://static.red-lang.org/download.html 20
    print "done"
    ```
    
    `touch file`, `red -c test.red` and `./test`:
    
    ```
    ""
    done
    ```

--------------------------------------------------------------------------------

On 2016-07-06T17:07:20Z, x8x, commented:
<https://github.com/red/red/issues/2096#issuecomment-230839029>

    It's working on Linux so unless I missed something the issue is macOS specific.

--------------------------------------------------------------------------------

On 2016-07-06T18:09:11Z, x8x, commented:
<https://github.com/red/red/issues/2096#issuecomment-230856774>

    Must be a regression with `read`.
    Fresh REPL session:
    
    ```
      read http://domain.com
    ;   "ok"
      read %file
    ;   {ok}
      read http://domain.com
    ;   ""
    ```

--------------------------------------------------------------------------------

On 2016-07-06T22:42:34Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2096#issuecomment-230929345>

    The last example worked on my machine:
    
    ```
    red>> system/build
    == "6-Jul-2016/21:32:57+8:00"
    red>> system/platform
    == MacOSX
    red>> read http://domain.com
    == {<!DOCTYPE html>^/<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8
    red>> read %boot.red
    == {Red [^/^-Title:   "Red base environment definitions"^/^-Author:  "Nena
    red>> read http://domain.com
    == {<!DOCTYPE html>^/<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8
    red>> 
    ```

--------------------------------------------------------------------------------

On 2016-07-07T08:05:13Z, x8x, commented:
<https://github.com/red/red/issues/2096#issuecomment-231010591>

    Humm.. @PeterWAWood by coincidence `domain.com` works..
    Here is latest red in a fresh install of macOS 10.11.5:
    
    ```
    red>> read %file
    == ""
    red>> read http://domain.com
    == {<!DOCTYPE html>^/<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8
    red>> read http://www.red-lang.org/p/download.html
    == {<html><title>Error 400 (Bad Request)!!1</title></html>}
    red>> read http://english.china.com/
    == {<HTML><HEAD>^/<TITLE>Bad Request</TITLE>^/</HEAD><BODY>^/<H1>Bad Requ
    red>> read http://google.com
    == {<html><title>Error 400 (Bad Request)!!1</title></html>}
    red>> read http://domain.com
    == {<!DOCTYPE html>^/<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8
    ```
    
    and:
    
    ```
    red>> read http://apple.com
    == {<!DOCTYPE html>^/<html xmlns="http://www.w3.org/1999/xhtml" xml:lan
    red>> read %file
    == ""
    red>> read http://apple.com
    *** Access Error: cannot connect: http://apple.com reason: timeout
    *** Where: read
    ```

--------------------------------------------------------------------------------

On 2016-07-07T08:27:03Z, x8x, commented:
<https://github.com/red/red/issues/2096#issuecomment-231014926>

    Looking at it with wireshark, looks like after a `file!` read, an `url!` read will miss its method in the request.
    before:
    
    ```
    GET / HTTP/1.1
    Host: ...
    ```
    
    after:
    
    ```
     / HTTP/1.1
    Host: ...
    ```
    
    Strangely, wireshark can't recognise the request as http even with a proper method (before reading any local `file!`)

--------------------------------------------------------------------------------

On 2016-07-07T09:58:29Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2096#issuecomment-231035520>

    @x8x I can confirm the behaviour that you saw Will.

--------------------------------------------------------------------------------

On 2016-07-07T13:09:30Z, x8x, commented:
<https://github.com/red/red/issues/2096#issuecomment-231072464>

    Thank you @qtxie ! Looks good now. 👍 

--------------------------------------------------------------------------------

On 2016-12-08T11:12:52Z, setoff, commented:
<https://github.com/red/red/issues/2096#issuecomment-265715904>

    @qtxie 
    It seems that it's still doesn't work. Reproduce log:
    ```
    red>> system
    == make object! [
        version: "0.6.1"
        build: "8-Dec-2016/14:39:50+"
    
    red>> system/platform
    == MacOSX   
    
    red>> read %testtext
    == "test text file contents"
    
    red>> read https://www.opengl.org/registry/specs/EXT/framebuffer_object.txt
    == {<!DOCTYPE html>^/<html>^/^/<head>^/<title>OpenGL - 404 Error Page not 
    ```
    
    but for example
    `$ curl  https://www.opengl.org/registry/specs/EXT/framebuffer_object.txt` works fine.
    
    moreover after restart red it also works fine.

--------------------------------------------------------------------------------

On 2016-12-08T13:12:49Z, qtxie, commented:
<https://github.com/red/red/issues/2096#issuecomment-265736639>

    I cannot reproduce it on master branch. 

