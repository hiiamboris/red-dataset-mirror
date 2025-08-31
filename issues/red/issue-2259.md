
#2259: `read/info <url>` throws Access Error: invalid UTF-8 encoding
================================================================================
Issue is closed, was reported by wolframkriesing and has 10 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2259>

``` red
red>> read/info http://news.ycombinator.com
*** Access Error: invalid UTF-8 encoding: #{8C5CA0E0}
*** Where: read
```

Just stabbing in the dark: it looks like the redirect that takes place is confusing the `read` command.



Comments:
--------------------------------------------------------------------------------

On 2016-10-11T20:33:42Z, geekyi, commented:
<https://github.com/red/red/issues/2259#issuecomment-253037067>

    I'm not seeing this error with ycombinator (but the page is not redirecting for me)
    
    With google, it is a known problem:
    
    ```
    read/info http://www.google.com
    *** Access Error: invalid UTF-8 encoding: #{A050726F}
    *** Where: read
    ```
    
    Can you test with http://httpbin.org/ and see if you can narrow it down?

--------------------------------------------------------------------------------

On 2016-10-12T11:35:28Z, wolframkriesing, commented:
<https://github.com/red/red/issues/2259#issuecomment-253189566>

    @geekyi this looks good
    
    ```
    red>> read http://httpbin.org/
    == {<!DOCTYPE html>^/<html>^/<head>^/  <meta http-equiv='content-type' va
    
    red>> read/info http://httpbin.org/
    == [200 #(
        Access-Control-Allow-Origin: "*"
        Server: "nginx"
     ...
    ```
    
    the redirect to the HTTPS isn't the problem neither it seems
    
    ```
    red>> read/info http://bitly.com/
    *** Access Error: invalid UTF-8 encoding: #{B0030009}
    *** Where: read
    red>> read/info https://bitly.com/
    *** Access Error: invalid UTF-8 encoding: #{B40F84A0}
    *** Where: read
    ```

--------------------------------------------------------------------------------

On 2016-10-12T19:21:20Z, geekyi, commented:
<https://github.com/red/red/issues/2259#issuecomment-253311761>

    @wolframkriesing strange.. works for me with the most recent build (007b5c3) and one from several days ago (sept 24) on windows 10 anniversary edition. Anything like proxies?
    
    ```
    red>> read/info http://bitly.com/
    == [200 #(
        Cache-Control: "no-cache, no-store, max-age=0, must...
    red>> read/info https://bitly.com/
    == [200 #(
        Cache-Control: "no-cache, no-store, max-age=0, must...
    red>> system/platform
    == Windows
    ```

--------------------------------------------------------------------------------

On 2016-10-13T08:25:21Z, wolframkriesing, commented:
<https://github.com/red/red/issues/2259#issuecomment-253447603>

    just did a 
    - `git pull` on master and I am on 4fb928aa06 now
    - then in rebol I recompiled with `do/args %red.r "%environment/console/console.red"`
    - and started red like so `> ./console`
    
    Is that correct so far, to run red from source? (not done that too often yet :))
    And result has not changed yet :(
    
    ``` red
    red>> read/info http://bitly.com/
    *** Access Error: invalid UTF-8 encoding: #{BC4202F0}
    *** Where: read
    ```
    
    I am on Mac OS X 10.10.5
    
    ``` red
    red>> system/platform
    == MacOSX
    red>> system
    == make object! [
        version: "0.6.1"
        build: "8-Oct-2016/14:53:08+"
    ```

--------------------------------------------------------------------------------

On 2019-09-11T17:05:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2259#issuecomment-530473061>

    Those cases are working fine with latest commit.

