
#4150: Disable Red Console with interpreter
================================================================================
Issue is closed, was reported by ghost and has 4 comment(s).
<https://github.com/red/red/issues/4150>

Using this script:

~~~
Red [
   Title: "Simple hello world script"
]
print "Hello World!"
~~~

I try to run like this:

~~~
red-064 hello.red
~~~

but a new window "Red Console" opens with the output, instead of outputting to
my current console. How do I resolve this?



Comments:
--------------------------------------------------------------------------------

On 2019-11-24T07:59:02Z, qtxie, commented:
<https://github.com/red/red/issues/4150#issuecomment-557866314>

    @cup `red-064 --cli hello.red`

--------------------------------------------------------------------------------

On 2019-11-25T04:48:38Z, greggirwin, commented:
<https://github.com/red/red/issues/4150#issuecomment-557986924>

    @cup please ask questions on Gitter, rather than opening tickets for them. If a bug is confirmed, that'st the time to open a ticket. Thanks.

