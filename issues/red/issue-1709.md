
#1709: 'what' not working
================================================================================
Issue is closed, was reported by ralfwenske and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1709>

red>> about
Red 0.5.4 - 15-Mar-2016/15:39:03+10:00
red>> what
**\* Script error: symbol! has no value
**\* Where: get
red>> 

changing all get's to get/any seems to work:
`what1: func ["Lists all functions" /local w spec desc]
  [foreach w words-of system/words [if any [
    function? get/any w
    native? get/any w
    action? get/any w
    op? get/any w
    routine? get/any w]
    [prin pad form w 15 spec: spec-of get w either any [
      string? desc: spec/1
      string? desc: spec/2
      ] [print [#":" desc]] [prin lf]]]
  exit]`



Comments:
--------------------------------------------------------------------------------

On 2016-03-15T07:59:43Z, dockimbel, commented:
<https://github.com/red/red/issues/1709#issuecomment-196707897>

    Great, thanks for the report + the right fix. It is a regression caused by the recent change on `get` to error out on unset values. 
    
    We would be glad to accept a PR from you for that fix it you can make it? ;-)

--------------------------------------------------------------------------------

On 2016-03-15T16:14:35Z, dockimbel, commented:
<https://github.com/red/red/issues/1709#issuecomment-196902563>

    The issue was fixed by one of today's commit. Next time, you should send the PR directly while opening the issue. ;-) Thanks anyway.

