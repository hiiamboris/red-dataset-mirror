
#3142: replace/all & charset
================================================================================
Issue is closed, was reported by Phryxe and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3142>

### Expected behavior
Example from Win 7.
```
>> x: {Räksmörgås, Räksmörgås. Räksmörgås;}
== "Räksmörgås, Räksmörgås. Räksmörgås;"
>> replace/all x charset ",.;" ""
== "Räksmörgås Räksmörgås Räksmörgås"
```
### Actual behavior
Example from Win 7. This should probably be the same as the example above.
```
>> x: {Räksmörgås, Räksmörgås. Räksmörgås;}
== "Räksmörgås, Räksmörgås. Räksmörgås;"
>> cs: charset ",.;"
== make bitset! #{00000000000A0010}
>> replace/all x cs ""
== "Rksmrgs Rksmrgs Rksmrgs"
```
### Steps to reproduce the problem
Paste code in console.
### Red version and build date, operating system with version.
- Red for Windows version 0.6.3 built 11-Dec-2017/8:59:44+01:00
- Windows 7 x64
- Windows 10



Comments:
--------------------------------------------------------------------------------

On 2017-12-11T09:35:56Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3142#issuecomment-350670281>

    Similar, but not identical, behaviour on macOS:
    
    ```text
    >> system/build
    == make object! [
        date: 11-Dec-2017/17:29:22+08:00
        config: make object!
    >> x: {Räksmörgås, Räksmörgås. Räksmörgås;}
    == "Räksmörgås, Räksmörgås. Räksmörgås;"
    >> length? x
    == 35
    >> cs: charset ",.;"
    == make bitset! #{00000000000A0010}
    >> replace/all x cs ""
    == "Räksmrgs Räksmrgs Räksmrgs"
    >> length? x
    == 26
    ```

