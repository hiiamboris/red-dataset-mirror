
#1522: Text-list initialization/update failing
================================================================================
Issue is closed, was reported by nickantonaccio and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1522>

Neither of these examples work as expected:

mylist: ["John" "Dave" "Jane" "Bob" "Sue"]

view [text-list data mylist]

view [
    t: text-list data []
    button "Add to list" [append t/data mylist]
]



