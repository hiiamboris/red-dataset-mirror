
#2658: Strange algorithm for comparing objects
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2658>

On looking at `object/compare` I notice the following. For (strict) equality it is necessary that the field names are pairwise identical. For the field values it is allowed that the types are different in the following sense: both in `any-word!` (but not `refinement!`) or one `integer!` and the other `float!` (but not `percent!`).
This makes no sense for `COMP_STRICT_EQUAL` since that requires in any case that the types are equal, but for `COMP_EQUAL` it seems a rather arbitrary condition. In direct comparison between two values the options for "compatible" types are:
- char! + integer! See issue #2650
- number!
- any-word! + refinement! (note the absence of issue!)
- any-string!
- any-object! See issue #2657  — 
 


Comments:
--------------------------------------------------------------------------------

On 2019-08-15T17:16:45Z, dockimbel, commented:
<https://github.com/red/red/issues/2658#issuecomment-521722076>

    I don't understand where you see a problem (please provide a code example), it works as expected to me:
    ```
    a: object [f: 1]
    b: object [f: 1.0]
    
    a = b
    ;== true
    a == b
    ;== false
    
    a: object [f: 'a]
    b: object [f: quote :a]
    
    a = b
    ;== true
    a == b
    ;== false
    ```

--------------------------------------------------------------------------------

On 2019-08-16T12:52:32Z, meijeru, commented:
<https://github.com/red/red/issues/2658#issuecomment-521998517>

    This leaves the anomaly that `1` and `100%` are not considered equal under `=` whereas `1` and `1.0` are. Likewise `1.0` and `100%` are not considered equal. What is against including `percent!` here?

--------------------------------------------------------------------------------

On 2019-08-16T13:05:18Z, dockimbel, commented:
<https://github.com/red/red/issues/2658#issuecomment-522001978>

    ```
    >> 1 = 100%
    == true
    >> 1.0 = 100%
    == true
    >> 1.0 == 100%
    == false
    >> 1 == 100%
    == false
    ```
    Seems it was all corrected a while ago. So, I'll close this ticket.

--------------------------------------------------------------------------------

On 2019-08-16T13:07:22Z, meijeru, commented:
<https://github.com/red/red/issues/2658#issuecomment-522002509>

    No! I meant they are not equal when they are in fields of an object. That was the whole point!
    ```
    >> o1: object [a: 1]
    == make object! [
        a: 1
    ]
    >> o2: object [a: 100%]
    == make object! [
        a: 100%
    ]
    >> o1 = o2
    == false
    ```

--------------------------------------------------------------------------------

On 2019-08-16T13:27:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2658#issuecomment-522008314>

    It's fixed now.

