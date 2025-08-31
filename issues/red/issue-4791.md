
#4791: READ throws errors on SECURE sites
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 28 comment(s).
<https://github.com/red/red/issues/4791>

As discussed in this [gitter chat](https://gitter.im/red/bugs?at=5ff1082de7f693041f48aa2d):

`read` returns errors on Italian language sites (and maybe others):

```
>> read http://www.ilmessaggero.it
*** Access Error: cannot connect: http://www.ilmessaggero.it reason: timeout
*** Where: read
*** Stack:  
```

Try also: http://www.repubblica.it https://www.ilsole24ore.com

Other users report:

```
Access Error: invalid UTF-8 encoding
```

But no errors using `read/lines`

Here both `read` and `read/lines` generate errors.

**Platform version**
```
Red 0.6.4 for Windows built 25-Nov-2020/10:15:19+01:00 commit #9b937c1
```



Comments:
--------------------------------------------------------------------------------

On 2021-01-03T15:25:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/4791#issuecomment-753633444>

    ```
    >> loop 10 [read http://www.ilmessaggero.it]
    == { <!doctype html>^/<html lang="it">^/<head>^/<meta http-equiv="conten...
    >> 
    >> loop 10 [read http://www.repubblica.it/]
    == {<!DOCTYPE html>^/<html class="no-js" lang="it">^/ <head>^/  <meta ch...
    >> 
    >> loop 10 [read https://www.ilsole24ore.com]
    == {<!DOCTYPE html><html lang="it"><head><meta charSet="utf-8" class=...
    >> 
    >> loop 10 [read http://www.virgilio.it]
    == {<!DOCTYPE html>^/<html class="" lang="it-IT">^/<head>^/    <meta cha...
    >> 
    ```
    no errors for me on W10

--------------------------------------------------------------------------------

On 2021-01-03T15:48:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4791#issuecomment-753636614>

    @GiuseppeChillemi try `read/binary` and if it works, post content here. Otherwise this issue is pointless if there's no known way to reproduce it.

--------------------------------------------------------------------------------

On 2021-01-03T18:36:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4791#issuecomment-753658740>

    I also haven't been able to dupe it on Win10.

--------------------------------------------------------------------------------

On 2021-01-03T18:37:36Z, greggirwin, commented:
<https://github.com/red/red/issues/4791#issuecomment-753658843>

    If other langs can read the site, having wire traces, e.g. with wireshark, can help see what's going on.

--------------------------------------------------------------------------------

On 2021-01-03T21:43:44Z, gltewalt, commented:
<https://github.com/red/red/issues/4791#issuecomment-753680369>

    Updated today and no errors.
    
    ```
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.4 ahead: 3396 date: 24-Dec-2020/23:08:25 commit: #98f31b56d03e314735d951419f4cb0d9304372f2 ]
    PLATFORM: [ name: "Linux Mint 20" OS: 'Linux arch: 'x86_64 version: 5.4.0 build: "#64-Ubuntu SMP Wed Dec 9 08:16:25 UTC 2020" ]
    --------------------------------------------
    ```
    
    ```
    >> read http://www.ilmessaggero.it
    == { <!doctype html>^/<html lang="it">^/<head>^/<meta http-equiv="content-language...
    >> loop 10 [read http://www.ilmessaggero.it]
    == { <!doctype html>^/<html lang="it">^/<head>^/<meta http-equiv="content-language...
    >> loop 10 [read http://www.repubblica.it/]
    == {<!DOCTYPE html>^/<html class="no-js" lang="it">^/ <head>^/  <meta charset="utf...
    >> loop 10 [read https://www.ilsole24ore.com]
    == {<!DOCTYPE html><html lang="it"><head><meta charSet="utf-8" class="next-head...
    >> loop 10 [read http://www.virgilio.it]
    == {<!DOCTYPE html>^/<html class="" lang="it-IT">^/<head>^/    <meta charset="utf-...
    ```

--------------------------------------------------------------------------------

On 2021-01-03T21:49:46Z, gltewalt, commented:
<https://github.com/red/red/issues/4791#issuecomment-753681079>

    republica.it has issues with the site, and issues with the SSL certificate for https, but other than that, I'm not sure why timeouts were happening.

--------------------------------------------------------------------------------

On 2021-01-18T22:52:25Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4791#issuecomment-762503241>

    I have tried @rebolek Gritter, same problem:
    
    
    ```
    >> do %gritter/gritter.red
    *** Access Error: cannot connect: https://avatars1.githubusercontent.com/u/2xxxxx?v=4&s=60 reason: timeout
    *** Where: do
    *** Stack: do-file  
    ```

--------------------------------------------------------------------------------

On 2021-01-18T22:55:43Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4791#issuecomment-762504058>

    @hiiamboris This is read/binary on http://www.wikipedia.it it fails on .com
    
    ```
    probe read/binary http://www.wikipedia.it
    #{
    3C686561643E0A3C6D65746120687474702D65717569763D2272656672657368
    2220636F6E74656E743D22323B2055524C3D687474703A2F2F69742E77696B69
    70656469612E6F726722202F3E0A3C2F686561643E0A3C6672616D6573657420
    726F77733D33352C2A204652414D45424F524445523D226E6F223E0A3C667261
    6D65207372633D226865616465722E68746D6C22204D415247494E5749445448
    3D223022204D415247494E4845494748543D2230223E0A3C6672616D65207372
    633D2222204D415247494E57494454483D223022204D415247494E4845494748
    543D2230223E0A3C4E4F4652414D45533E3C2F4E4F4652414D45533E0A3C2F66
    72616D657365743E0A
    }
    ```

--------------------------------------------------------------------------------

On 2021-01-18T23:03:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4791#issuecomment-762505997>

    if read/binary fails, it proves this is not an encoding problem

--------------------------------------------------------------------------------

On 2021-01-19T00:06:08Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4791#issuecomment-762522376>

    I have installed Wireshark and I have some trace save.
    Who can I send them to?
    
    Note: the issue is **SSL/TSL** related. 
    
    **wikipedia.it** is an old unsecured site that redirects to wikipedia.org. This is the reason I can read from wikipedia.it.
    
    Also **http://rebolforum.com** can be read by Red.
    
    (Both can be read also by REBOL!)
    
    I have a couple of Wireshark captures if interested, I have installed it!
    

--------------------------------------------------------------------------------

On 2021-01-19T00:11:11Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4791#issuecomment-762523566>

    > republica.it has issues with the site, and issues with the SSL certificate for https, but other than that, I'm not sure why timeouts were happening.
    
    Timeouts are too quick. They happen as soon as I hit enter. So, IMHO, It should be another error, or condition, which is erroneously interpreted as TIMEOUT. Which network timeout has Red which is set to less than 1 second?

--------------------------------------------------------------------------------

On 2021-01-19T09:12:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/4791#issuecomment-762707286>

    it just says 'timeout' on ANY error, so don't take it too seriously

--------------------------------------------------------------------------------

On 2021-01-19T09:51:37Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4791#issuecomment-762730256>

    I have installed Wireshark, is there a way to debug it?

--------------------------------------------------------------------------------

On 2021-08-20T16:40:48Z, dockimbel, commented:
<https://github.com/red/red/issues/4791#issuecomment-902819204>

    ```
    >> read http://www.ilmessaggero.it
    == { <!doctype html>^/<html lang="it">^/<head>^/<meta http-equiv="content-lan...
    >> read  http://www.repubblica.it
    == {<!DOCTYPE html>^/<html class="no-js" lang="it">^/ <head>^/  <meta charset...
    >> read https://www.ilsole24ore.com
    == {<!DOCTYPE html><html lang="it"><head><meta charSet="utf-8" class="next...
    ```
    Can't reproduce the issue, so I'm closing the ticket.

