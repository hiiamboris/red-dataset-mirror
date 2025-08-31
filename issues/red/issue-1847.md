
#1847: Using 'stop as the return value of on-detect doesn't stop the event flow
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1847>

``` Red
red []

view [
    panel [
        button "press me and check the console" [ print "This message should not be printed"]
    ] 
    on-detect [
        print "on-detect"
        'stop ; <== stop the event flow
    ]
    do [
        system/view/capturing?: yes 
    ]
]
```

I am using Windows 10



Comments:
--------------------------------------------------------------------------------

On 2016-05-06T04:48:13Z, dockimbel, commented:
<https://github.com/red/red/issues/1847#issuecomment-217347695>

    Your event catching is a bit too aggressive, so even the `close` event will be cancelled, preventing from even closing the window. Here is a softer version:
    
    ```
    Red []
    
    view [
        panel [
            button "press me and check the console" [ print "This message should not be printed"]
        ] 
        on-detect [
            if event/type = 'click [
                print "on-detect"
                'stop ; <== stop the event flow
            ]
        ]
        do [
            system/view/capturing?: yes 
        ]
    ]
    ```

