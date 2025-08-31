
#3116: Labels not fully rendered in Form on macOS
================================================================================
Issue is open, was reported by PeterWAWood and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3116>

The form example from the Red 0.6.0 blog does not render properly on macOS 
### Expected behavior
The label **Name** should be displayed in the form as it is on Windows:
<img width="361" alt="form on windows" src="https://user-images.githubusercontent.com/697434/33156473-024fc82e-d035-11e7-9499-ff89507c6e7e.png">
### Actual behavior
The label is displayed as **Nam**
<img width="482" alt="form on macos" src="https://user-images.githubusercontent.com/697434/33156556-d6f51818-d035-11e7-96fd-e0e152a57a81.png">
### Steps to reproduce the problem
Run the following code on macOS:
```
Red [needs: View]
digit: charset "0123456789"
    view [
        style label: text bold right 40
        style err-msg: text font-color red hidden
    
        group-box "Person" 2 [
            origin 20x20
            label "Name" name: field 150
            label "Age"  age:  field 40
            label "City" city: field 150
            err-msg "Age needs to be a number!" react later [
                face/visible?: not parse age/text [any digit]
            ]
        ]
        button "Save" [save %person.txt reduce [name/text age/text city/text]]
    ]
    set [name age city] load %person.txt
    ?? name ?? age ?? city
```
### Red version and build date, operating system with version.
```
>> system/version
== 0.6.3
>> system/build
== make object! [
    date: 23-Nov-2017/9:33:39+08:00
    config: make object!
>> system/platform
== macOS
> system/platform/version
== Not yet implemented
```
masOS 10.12.6


