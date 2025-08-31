
#3153: `drop-down` data unmodifiable
================================================================================
Issue is closed, was reported by toomasv and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3153>

### Expected behavior
`view [drop-down data ["A" "B" "C"] on-enter [append face/data copy face/text]]`
After entering "D" data should be ["A" "B" "C" "D"]
### Actual behavior
view [drop-down data ["A" "B" "C"] on-enter [append face/data copy face/text]]
; After entering "D":
*** Script Error: invalid DATA facet content ["A" "B" "C" "D"]
*** Where: on-change-facet
*** Stack: view do-events do-actor do-safe on-face-deep-change*
### Steps to reproduce the problem
Enter a value in drop-down field.
### Red version and build date, operating system with version.
```
>> probe system/build
make object! [
    date: 17-Dec-2017/13:08:32+02:00
    config: make object! [
        config-name: 'Windows
```
W10 Pro


