
#3571: clean-path takes a url! and produces a file!
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [status.reviewed] [test.written]
<https://github.com/red/red/issues/3571>

The argument to `clean-path` may be a `url!` value, but the result is always a `file!` value. It would seem that the result in this case should more usefully be a `url!` value, since by RFC3986 the `.` and `..` elements are equally applicable in such a value. What the result should be when the argument is a `string!` value is open for discussion.


Comments:
--------------------------------------------------------------------------------

On 2018-12-12T05:56:09Z, dockimbel, commented:
<https://github.com/red/red/issues/3571#issuecomment-446471943>

    `clean-path` in its current implementation is not handling URLs properly anyway:
    ```
    >> clean-path http://toto/../titi
    == %/titi
    ```
    
    Even Rebol3 does not process them entirely well:
    ```
    >> clean-path http://toto/../titi
    == http:///titi
    ```
    
    It would be worth having a proper support for `url!`.

--------------------------------------------------------------------------------

On 2018-12-12T07:01:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3571#issuecomment-446483735>

    Worth a quick design, so we know what target behavior we're after.

--------------------------------------------------------------------------------

On 2020-01-12T23:22:29Z, endo64, commented:
<https://github.com/red/red/issues/3571#issuecomment-573469369>

    It can at least return (copy of) the URL if the input is `url!` just like in R2 & R3:
    ```
    >> clean-path https://google.com
    == https://google.com
    ```

--------------------------------------------------------------------------------

On 2020-07-13T19:04:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/3571#issuecomment-657737025>

    Why `status.contribution`, I wonder?

