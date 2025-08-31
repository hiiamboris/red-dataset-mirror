
#628: mold/part object! broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/628>

red>> print mold/part context [a: "1" b: "2"] 10
make object! [
    a: ""
    b:

Output is longer than specified limit but truncates nested items.



Comments:
--------------------------------------------------------------------------------

On 2013-12-25T08:29:52Z, qtxie, commented:
<https://github.com/red/red/issues/628#issuecomment-31194689>

    What is the expect result? Like below:
    
    ```
    red>> mold context [a: "1" b: "2"]
    == {make object! [^/    a: "1"^/    b: "2"^/]}
    
    red>> print mold/part context [a: "1" b: "2"] 10
    make objec
    ```

--------------------------------------------------------------------------------

On 2013-12-25T18:28:25Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/628#issuecomment-31203317>

    Yes, according to Nenad, it limits the final string output. That's the way it's used in console.red.

--------------------------------------------------------------------------------

On 2013-12-28T17:13:28Z, dockimbel, commented:
<https://github.com/red/red/issues/628#issuecomment-31300461>

    @qtxie Yes, that's the expected output.

