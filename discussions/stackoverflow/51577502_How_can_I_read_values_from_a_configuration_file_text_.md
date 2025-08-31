# How can I read values from a configuration file (text)?

**Link:**
<https://stackoverflow.com/questions/51577502/how-can-i-read-values-from-a-configuration-file-text>

**Asked:** 2018-07-29 05:26:10 UTC

------------------------------------------------------------------------

I need to read values (text) from a configuration file named `.env` and
assign them to variables so I can use them later in my program.

The `.env` file contains name/value pairs and looks something like this:

    ENVIRONMENT_VARIABLE_ONE = AC9157847d72b1aa5370fdef36786863d9
    ENVIRONMENT_VARIABLE_TWO = 73cad721b8cad6718d469acc42ffdb1f
    ENVIRONMENT_VARIABLE_THREE = +13335557777

------------------------------------------------------------------------

***What I have tried so far***

`read-values.red`

    Red [

    ]

    contents: read/lines %.env

    env-one: first contents
    env-two: second contents
    env-three: third contents

    print env-one ; ENVIRONMENT_VARIABLE_ONE = AC9157847d72b1aa5370fdef36786863d9
    print env-two ; ENVIRONMENT_VARIABLE_ONE = 73cad721b8cad6718d469acc42ffdb1f
    print env-three ; ENVIRONMENT_VARIABLE_ONE = +13335557777

------------------------------------------------------------------------

***What I\'m looking for***

    print env-one ; AC9157847d72b1aa5370fdef36786863d9
    print env-two ; 73cad721b8cad6718d469acc42ffdb1f
    print env-three ; +13335557777

How do I continue or change my code and parse these strings such as the
`env-` variables will contain just the values?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by giuliolunati

`env-one: skip find first contents " = " 3`

See help for find and skip

*Comment by Alex Baban:* Perfect, it works, thank you very much. Could
you recommend a link for the help?

*Comment by giuliolunati:* Red is largely Rebol-compatible, so [Rebol 3
docs](http://www.rebol.com/r3/docs/functions.html){rel="nofollow noreferrer"}
may help you. Have a nice coding day! :-)

------------------------------------------------------------------------

### Answer (score: 3) --- by endo64

Another solution using `parse` could be:
` foreach [word value] parse read %.env [collect some [keep to "=" skip keep to newline skip]] [set load word trim value] `

This one will add the words to the global context
`ENVIRONMENT_VARIABLE_ONE` will be `AC9157847d72b1aa5370fdef36786863d9`
and so on.

*Comment by endo64:* Instead of adding words to default context here is
another version that returns a `map!` value:
[gist.github.com/endo64/e1c0f0db9b287e2e1392604f79d9f3fd](https://gist.github.com/endo64/e1c0f0db9b287e2e1392604f79d9f3fd){rel="nofollow noreferrer"}
Also `[keep to "=" skip keep to [newline | end] skip]` could be better
as above version doesn\'t work if there is no newline at the end.

------------------------------------------------------------------------

## Comments on question
