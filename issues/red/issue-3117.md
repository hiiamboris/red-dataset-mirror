
#3117: path-thru doesn't sanitise illegal characters
================================================================================
Issue is closed, was reported by pijoter and has 14 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3117>

### Expected behavior
path-thru hould sanitise characters illegal from filesystem point of view (remove them or change); characters like "?" or ":" are illegal for most of filesystems but allowed (required) in most of url adresses

### Actual behavior
>> path-thru http://rowery.olsztyn.pl/?r=10
== %/C/ProgramData/Red/cache/rowery.olsztyn.pl/?r=10

### Steps to reproduce the problem
>> read-thru/binary http://rowery.olsztyn.pl/?r=10
*** Access Error: cannot open: %/C/ProgramData/Red/cache/rowery.olsztyn.pl/?r=10
*** Where: write
*** Stack: read-thru  

### Red version and build date, operating system with version.
>> system/version
== 0.6.3
>> system/build/date
== 12-Aug-2017/17:41:41+02:00



Comments:
--------------------------------------------------------------------------------

On 2017-11-30T11:03:17Z, dockimbel, commented:
<https://github.com/red/red/issues/3117#issuecomment-348156166>

    Good point.

--------------------------------------------------------------------------------

On 2017-11-30T11:18:41Z, dockimbel, commented:
<https://github.com/red/red/issues/3117#issuecomment-348159665>

    Some sanitization code added to `path-thru`:
    ```
    >> path-thru http://rowery.olsztyn.pl/?r=10
    == %/C/ProgramData/Red/cache/rowery.olsztyn.pl/
    >> path-thru http://rowery.olsztyn.pl/#hashtag
    == %/C/ProgramData/Red/cache/rowery.olsztyn.pl/
    ```

--------------------------------------------------------------------------------

On 2017-11-30T17:10:12Z, pijoter, commented:
<https://github.com/red/red/issues/3117#issuecomment-348255401>

    With these changes there will be the same cache-file for many urls! 
    Maybe better approach is to store cache-files under md5 checksum name (like here https://github.com/red/red/pull/3124)?

--------------------------------------------------------------------------------

On 2017-11-30T19:17:43Z, Oldes, commented:
<https://github.com/red/red/issues/3117#issuecomment-348291732>

    I have same opinion as @pijoter ... the part after question mark must be used as a part of the url.

--------------------------------------------------------------------------------

On 2018-07-06T12:00:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/3117#issuecomment-403013550>

    In continuation of this issue: :point_up: [July 5, 2018 8:42 PM](https://gitter.im/red/bugs?at=5b3e586a3572e970c179111c)
    
    `load-thru https://picsum.photos/100/100/?random` doesn't do the caching, because it ends in a slash and tries to write into a directory: 
    ```
    >> path-thru https://picsum.photos/100/100/?random
    == %/C/Users/Gregg/AppData/Roaming/Red/cache/picsum.photos/100/100/
    ```
    
    Hopefully it will be solved by #3124 

--------------------------------------------------------------------------------

On 2019-10-08T15:50:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/3117#issuecomment-539578567>

    This one should be closed, as the PR implementing it was merged.

--------------------------------------------------------------------------------

On 2019-10-09T02:56:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3117#issuecomment-539799912>

    I'll close this, but need to revisit the chat on the PR, which was quite extensive.

