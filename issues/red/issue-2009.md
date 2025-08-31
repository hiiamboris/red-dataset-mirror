
#2009: Load does not promote 2147483648 or -2147483649 to float values
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/2009>

Load in Rebol automatically "promotes" integer literal values outside of the "integer range" to float! values. Red does not promote them. 

2147483648 is returned as -2147483648, script errors are given for other values. The error messages are inconsistent between positive and negative integer literals:

``````
red>> 2147483648
== -2147483648
red>> 2147483649
*** Syntax error: invalid value at "2147483649"
*** Where: do
red>> -2147483649
*** Script error: -2147483649 has no value
*** Where: catch```

(Tests load-45 and load-46 are commented out in load-test.red)

``````



Comments:
--------------------------------------------------------------------------------

On 2016-06-15T09:23:47Z, dockimbel, commented:
<https://github.com/red/red/issues/2009#issuecomment-226134497>

    This is a planned feature (most probably for 0.6.2), so I'm closing this ticket.

--------------------------------------------------------------------------------

On 2016-07-12T17:06:29Z, dockimbel, commented:
<https://github.com/red/red/issues/2009#issuecomment-232111796>

    I leave it open, to remind us to uncomment those tests once the feature gets implemented.

--------------------------------------------------------------------------------

On 2016-07-13T01:06:54Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2009#issuecomment-232227067>

    Also the current behaviour could appear a little inconsistent as rather than giving a script error `2147483648` is converted to `-2147483648`:
    
    ```
    red>> i: 2147483648
    == -2147483648
    red>> i: 2147483649
    *** Syntax Error: invalid value at "2147483649"
    *** Where: do
    red>> i: -2147483648
    == -2147483648
    red>> i: -2147483649
    *** Script Error: -2147483649 has no value
    *** Where: i
    ```

