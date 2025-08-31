
#785: UNION on BITSET! not working correctly
================================================================================
Issue is closed, was reported by 7hi4g0 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/785>

## Steps:
1. nd: charset [not #"0" - #"9"]
2. zero: charset #"0"
3. nd-zero: union nd zero
4. Try all **tests**
### Tests:

| Test | Expected | Result |
| :-- | :-: | :-: |
| find nd #"0" | false | false |
| find nd #"1" | false | false |
| find nd #"B" | true | true |
| find nd #"}" | true | true |
| find zero #"0" | true | true |
| find zero #"1" | false | false |
| find zero #"B" | false | false |
| find zero #"}" | false | false |
| find nd-zero #"0" | true | true |
| find nd-zero #"1" | false | false |
| find nd-zero #"B" | true | **false** |
| find nd-zero #"}" | true | **false** |
## Observed:

When searching for some symbols and letters on the union the expected result is `true` but the actual result is `false`



Comments:
--------------------------------------------------------------------------------

On 2014-04-24T07:41:54Z, qtxie, commented:
<https://github.com/red/red/issues/785#issuecomment-41252029>

    @7hi4g0 This commit https://github.com/qtxie/red/commit/d97fe154bd93637350c01a74e0fb04deaf4388cf will fix it.

--------------------------------------------------------------------------------

On 2014-04-24T15:12:44Z, dockimbel, commented:
<https://github.com/red/red/issues/785#issuecomment-41291801>

    @7hi4g0 Thanks very much for the clear report! I wish everyone would be that efficient. ;-)

