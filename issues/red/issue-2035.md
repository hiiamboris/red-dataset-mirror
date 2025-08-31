
#2035: Functions ?? and SOURCE should also take a path! as argument
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[type.wish] [status.contribution]
<https://github.com/red/red/issues/2035>

It often happens that one wishes to know the source of a function that is defined within a context. Currently, this is not possible since both ?? and SOURCE take only `any-word!` as argument. Extension to `any-path!` is quite feasible and does not even need a change of program logic.



Comments:
--------------------------------------------------------------------------------

On 2016-07-21T07:15:29Z, xqlab, commented:
<https://github.com/red/red/issues/2035#issuecomment-234175624>

    like that?
    
    ```
    ??: func [
        "Prints a word and the value it refers to (molded)" 
        'value [word! path!]
    ][
        prin mold :value 
        prin ": " 
        print either value? :value [mold get/any :value] ["unset!"]
    ]
    
    red>> o: context [ i: does [print 1]]
    == make object! [
           i: func [][print 1]
    ]
    red>> ?? o/i
    o/i: func [][print 1]
    red>> 
    ```

--------------------------------------------------------------------------------

On 2016-07-21T07:45:27Z, meijeru, commented:
<https://github.com/red/red/issues/2035#issuecomment-234180994>

    Yes that would allow `?? o/i` and `source o/i` which are impossible currently.

--------------------------------------------------------------------------------

On 2016-07-21T07:57:04Z, xqlab, commented:
<https://github.com/red/red/issues/2035#issuecomment-234183219>

    ```
    red>> source: func [
    [        "Print the source of a function" 
    [        'func-name [any-word! any-path!] "The name of the function" 
    [        /local type
    [    ][
    [        print either function? get/any func-name [[append mold func-name #":" mold get func-name]] [
    [            type: mold type? get/any func-name ["Sorry," func-name "is" a-an type type "so no source is available"]
    [        ]
    [    ]
    == func [
        "Print the source of a function" 
        'func-name [any-word! any-path!] "The name of the funct...
    red>> source system/platform
    system/platform: func ["Return a word identifying the operating system"][
        #system [
            #switch OS [
                Windows [SET_RETURN (words/_windows)] 
                Syllable [SET_RETURN (words/_syllable)] 
                MacOSX [SET_RETURN (words/_macosx)] 
                #default [SET_RETURN (words/_linux)]
            ]
        ]
    ]
    red>> 
    ```

--------------------------------------------------------------------------------

On 2016-07-21T15:57:46Z, meijeru, commented:
<https://github.com/red/red/issues/2035#issuecomment-234299312>

    Since I don't have GitHub commit facilities, I would be happy for you to make the pull request.

--------------------------------------------------------------------------------

On 2017-06-09T14:19:34Z, meijeru, commented:
<https://github.com/red/red/issues/2035#issuecomment-307401787>

    Next week this wish will be a year old. Since it is now fulfilled, I close it.

