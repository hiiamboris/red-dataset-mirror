
#8: String comparison bug?
================================================================================
Issue is closed, was reported by PeterWAWood and has 8 comment(s).
[status.deferred] [type.wish] [Red/System]
<https://github.com/red/red/issues/8>

I have found that comparing a string variable with a string literal does not produce the expected result. I ran the following script:

``` rebol
Red/System []
str: "hello"
either str = "hello" [print "correct"] [print "incorrect"]
str2: "hello"
either str = str2 [print "correct"] [print "incorrect"]
str3: ""
either str3 = "" [print "correct"] [print "incorrect"]
```

and got the following results:

```
C:\Red\red-system\builds>test
incorrect
correct
correct
```



Comments:
--------------------------------------------------------------------------------

On 2011-04-05T19:18:27Z, dockimbel, commented:
<https://github.com/red/red/issues/8#issuecomment-960702>

    This is not supported yet, nor it is part of the specifications yet. The section "13.2.3 Comparison operators" of the specifications is missing <value> definition. Only integer values are currently supported. Obviously, it needs to be extended to strings too.
    
    I'm marking this ticket as a wish for now.

--------------------------------------------------------------------------------

On 2011-05-07T18:28:30Z, dockimbel, commented:
<https://github.com/red/red/issues/8#issuecomment-1116066>

    I think that string equality check should be better supported by a dedicated function from a string! library. However, using the '= infix op for that could be a nice syntactic sugar. I will see if this can be done without impacting existing op implementation too much.

--------------------------------------------------------------------------------

On 2011-05-07T23:02:40Z, PeterWAWood, commented:
<https://github.com/red/red/issues/8#issuecomment-1116793>

    I think that having a dedicated function in a string! library is a good idea. Perhaps using the '= infix op could be implemented in the version of Red/System that will be written in Red.

--------------------------------------------------------------------------------

On 2012-10-25T10:47:01Z, dockimbel, commented:
<https://github.com/red/red/issues/8#issuecomment-9773193>

    Moving this wish to [Red/System v2 wish list](https://github.com/dockimbel/Red/wiki/Red-System-v2-Wish-List).

