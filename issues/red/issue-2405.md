
#2405: routine in nested context seems to return routine itself
================================================================================
Issue is closed, was reported by koba-yu and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2405>

I compile the code below and run.

```
outer-context: context [

    inner-context: context [

        get-one: routine [
            return: [integer!]
        ] [
            1
        ]
    ]

    get-add-one: function [return: [integer!]][
        temp: inner-context/get-one
        temp + 1 
    ]
]

outer-context/get-add-one
```
Then the error below is raised.

```
*** Script Error: + does not allow routine! for its value1 argument
*** Where: +
*** Stack: get-add-one +
```

According to error, I guess "get-one" routine returns routine itself  though defined return value is integer.


Comments:
--------------------------------------------------------------------------------

On 2017-01-07T02:22:51Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2405#issuecomment-271056193>

    I suspect the issue is due to the compiler not yet being able to recognise that get-one is a routine when it is being called.
    
    A workaround would be using:
    ```text
    temp: do inner-context/get-one
    ```

--------------------------------------------------------------------------------

On 2017-01-07T13:11:46Z, koba-yu, commented:
<https://github.com/red/red/issues/2405#issuecomment-271083055>

    @PeterWAWood Thank you for your comment!
    By your workaround, I could get my code progressed. I use it for the moment.

--------------------------------------------------------------------------------

On 2017-02-14T14:25:51Z, dockimbel, commented:
<https://github.com/red/red/issues/2405#issuecomment-279720597>

    Peter guessed right, the compiler is not yet able to handle relative paths for calling routines.

--------------------------------------------------------------------------------

On 2017-10-10T10:49:30Z, dockimbel, commented:
<https://github.com/red/red/issues/2405#issuecomment-335434865>

    The Red compiler has now better capabilities for resolving relative object paths, so the above code now runs fine and returns `2` as expected.

