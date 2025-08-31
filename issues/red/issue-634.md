
#634: MAKE block! 0 leads to crash
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/634>

red>> probe append [] none
[none]
== [none]
red>> probe append  make block! 1  none
[none]
== [none]
red>> probe append  make block! 0  none

**\* Runtime Error 1: access violation
**\* at: 0808FCE5h



