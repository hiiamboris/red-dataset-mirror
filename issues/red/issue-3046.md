
#3046: attempt to make a prototype from `reactor!` object with `is` usage breaks reactivity
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3046>

After the following snippet whole reactive framework stops to function:
```Red
>> r1: make reactor! [x: 1]
== make object! [
    x: 1
]
>> r2: make r1 [x: is [r1/x]]
*** Script Error: set-quiet does not allow set-word! for its word argument
*** Where: set-quiet
*** Stack:  
```
I checked every example from [docs](https://doc.red-lang.org/en/reactivity.html#_static_relations), none of them works.
```Red
>> what: make reactor! [ever: 'really]
== make object! [
    ever: 'really
]
>> nope: is [what/ever]
== really
>> what/ever: 'yeah
== yeah
>> nope
== really
```
However without the first snippet everything works fine
```Red
>> what: make reactor! [ever: 'really] 
== make object! [ ever: 'really ] 
>> nope: is [what/ever] 
== really 
>> what/ever: 'yeah 
== yeah 
>> nope 
== yeah
```


