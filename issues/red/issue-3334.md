
#3334: [Feature request] Allow adding float! to date! as in Excel
================================================================================
Issue is closed, was reported by ifmihai and has 14 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/3334>

### Expected behavior
In Excel, we can add a float to a datetime, no problem.
I expected the following code to work:
```
now/date + 4.56
```
but it doesn't

### Actual behavior
```
now/date + 4.56
*** Script Error: float! type is not allowed here
*** Where: +
*** Stack: 
```

### Red and platform version
```
Red for Windows version 0.6.3 built 4-Feb-2018/23:09:57+02:00
```
Windows 10


Comments:
--------------------------------------------------------------------------------

On 2018-04-12T15:32:33Z, 9214, commented:
<https://github.com/red/red/issues/3334#issuecomment-380847462>

    Chat reference:
    https://gitter.im/red/red?at=5acf691d1130fe3d36cd55f8

--------------------------------------------------------------------------------

On 2018-04-12T15:49:27Z, 9214, commented:
<https://github.com/red/red/issues/3334#issuecomment-380853185>

    Perhaps it would make more sense to extend support to `number!` datatype (that is, integers, floats and percents)?

--------------------------------------------------------------------------------

On 2018-04-12T16:00:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/3334#issuecomment-380856724>

    Note that adding a float to a date results in a change of it's format, which may or may not be desirable as an implicit action:
    ```
    >> now/date
    == 12-Apr-2018
    >> now/date + 1
    == 13-Apr-2018
    >> now/date + (24:0:0 * 1.2345)
    == 13-Apr-2018/8:37:40.8+03:00
    >> now/date + (24:0:0 * 0.0)
    == 12-Apr-2018/3:00:00+03:00
    ```

--------------------------------------------------------------------------------

On 2018-04-12T16:54:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3334#issuecomment-380873738>

    1. People need to understand how actions work, given a datatype and argument(s). We can justify it in that regard.
    
    2. The add int = add days behavior came from Rebol. Why did Carl choose not to support floats as you suggest? That is, what might be the cases against this?
    
    3. (date! + float!) <> (date! + to time! float!). May be confusing, but see #1.
    
    4. You can't make/to between date! and float!. Do we need to support that as well, for this request to be more complete?
    
    5. If we do #4, it may complicate both date! and time! datatypes. Noting that, today, date! is not a single float! value, but date and time components are separate values in the type structure.
    
    6. Excel has no concept of timezone, correct? What do we do about that? Normalizing to UTC will be a lossy conversion in the simplest case, yes?

--------------------------------------------------------------------------------

On 2018-04-12T19:09:45Z, greggirwin, commented:
<https://github.com/red/red/issues/3334#issuecomment-380913437>

    @rebolek said adding integer to date isn't consistent either. My response was that I'm inclined to agree...except that we need to do date arithmetic somehow. Can we come up with something better? Do we want funcs for all date mods? I proposed a relative date! type in Ren, but still need to think more deeply about it.
    
    Days as a unit of measure is the lowest denominator, if we consider date and time as separate components. That is, if we take time out of the equation, and do date math, what unit do we operate on? It's either days or a compound, relative-date value (yyyy-mm-dd), yes?

--------------------------------------------------------------------------------

On 2018-08-15T02:43:50Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3334#issuecomment-413077396>

    This Wish should be transferred to the [Red REP repo](https://github.com/red/REP).

--------------------------------------------------------------------------------

On 2019-09-14T20:13:36Z, dockimbel, commented:
<https://github.com/red/red/issues/3334#issuecomment-531509918>

    @ifmihai You cannot say "I expected the following code to work: now/date + 4.56 but it doesn't" without explaining what is the expected result! That alone would have been a good reason for closing the ticket. After spending some time reading the linked Gitter chat in order to see what you ask for, I understand that you want the fractional part to represent the corresponding fraction of the day expressed in hh:mm:ss.
    
    FYI, you can already achieve something like that with very little effort:
    ```
    now/date + 4 + (24:0:0 * 56%)
    == 18-Sep-2019/13:26:24
    ```
    If it needs to be used often, a simple function can do the job for you:
    ```
    d+f: function [d [date!] f [float!]][d + (i: to-integer f) + (24:0:0 * to-percent f - i)]
    
    d+f now/date 4.56
    == 18-Sep-2019/13:26:24
    ```
    Given how rare it is to use fractions for date arithmetics and how easy it is to support in Red with the existing features, I don't think such feature is worth implementing into the `date!` type.
    
    If someone wants to fill a REP and make a case for it, you are welcome.

