
#3374: trim/with corrupts trim function
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3374>

### Expected behavior
>> trim/all {   a ^-1^/    ab2^-  ^/  ac3  ^/  ^/^/}
== "a1ab2ac3"
### Actual behavior
>> mstr: {   a ^-1^/    ab2^-  ^/  ac3  ^/  ^/^/}
== {   a ^-1^/    ab2^-  ^/  ac3  ^/  ^/^/}
>> trim/all {   a ^-1^/    ab2^-  ^/  ac3  ^/  ^/^/}
== "a1ab2ac3"
>> "    ^-1^/    2^-  ^/  c3  ^/  ^/^/" = trim/with copy mstr "ab"
== true
>> trim/all {   a ^-1^/    ab2^-  ^/  ac3  ^/  ^/^/}
== {^-1^/2^-^/c3^/^/^/}
>> 
### Steps to reproduce the problem
run the above code
### Red and platform version
commit 9ce2aacce1509943ac11efa3b13457e8a66f03b4 (HEAD -> master, upstream/master)
macOS 10.12.16


Comments:
--------------------------------------------------------------------------------

On 2018-05-08T12:29:37Z, meijeru, commented:
<https://github.com/red/red/issues/3374#issuecomment-387385967>

    Looks like unintentional global?

--------------------------------------------------------------------------------

On 2018-05-09T14:23:42Z, bitbegin, commented:
<https://github.com/red/red/issues/3374#issuecomment-387756189>

    when trim has `with` parameter, if the parameter is larger than 4 chars or it's a integer type, the with-chars buffer will be changed.  
    
    I have given a simple resolution like `https://github.com/red/red/pull/3378`

