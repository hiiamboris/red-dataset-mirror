
#1488: area face needs CRLF (^M^/) to go to newline, ^/ alone is not enough
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1488>

Apparently there is no "translation" of the Red newline to what Windows needs.



Comments:
--------------------------------------------------------------------------------

On 2015-12-04T13:40:26Z, dockimbel, commented:
<https://github.com/red/red/issues/1488#issuecomment-161970557>

    Another good catch.

--------------------------------------------------------------------------------

On 2016-05-07T11:47:02Z, dockimbel, commented:
<https://github.com/red/red/issues/1488#issuecomment-217631022>

    Fix for this class of issues has been pushed to branch `issue-1488`. It needs a few additional changes in the IO code before being mergable in master.

--------------------------------------------------------------------------------

On 2016-05-07T15:53:45Z, dockimbel, commented:
<https://github.com/red/red/issues/1488#issuecomment-217646571>

    Fixed by commit [a39c3edb](https://github.com/red/red/commit/dd4009baaab2ed4933dcc23e7813a4f1a39c3edb).

