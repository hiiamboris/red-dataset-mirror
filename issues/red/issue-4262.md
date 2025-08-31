
#4262: Calling Red with input causes Access Violation Runtime Error
================================================================================
Issue is open, was reported by rgchris and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/4262>

I have Red installed on OS X via Homebrew (red-latest, recently reinstalled). I hit this while trying to call Red from Rebol 2:

```
probe call/wait/input "red" {Red []^/print "I am Red!"}
```

I get the following response:

```
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

== 
I am Red!

*** Runtime Error 1: access violation
*** at: 000244A5h
0
```

Adding QUIT avoids the runtime error, but still prints the banner:

```
>> probe call/wait/input "red" {Red []^/print "I am Red!" quit}
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

== 
I am Red!
0
```

Omitting the Red header or the newline elicits no response from Red:

```
probe call/wait/input "red" {Red [] print "I am Red!"}
probe call/wait/input "red" {print "I am Red!"}
```

I checked in BASH to be sure it wasn't a quirk with Rebol's CALL:
```
$ printf "Red []\nprint 123" | red
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

== 
123

*** Runtime Error 1: access violation
*** at: 000244A5h
```

Platform:
```
Red 0.6.4 for macOS built 22-Jan-2020/7:37:16-05:00 commit #6d787d9
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-25T18:11:35Z, 9214, commented:
<https://github.com/red/red/issues/4262#issuecomment-578428963>

    https://github.com/red/red/issues/3944

