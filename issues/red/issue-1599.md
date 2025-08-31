
#1599: Date or Time in header gives syntax error.
================================================================================
Issue is closed, was reported by Josh1-rtd and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1599>

red>> test: read/lines %myfile.red
== ["Red [" {^-Title: "form-date"} {^-Author: "Satish" } "^-Date: 26-A
red>> foreach line test [print line]
Red [
    Title: "form-date"
    Author: "Satish" 
    Date: 26-Apr-2007 
]

print "my first Red program"
red>> do %myfile.red
**\* Syntax error: invalid integer at {26-Apr-2007 ^/]^/^/print "my first Red pro
**\* Where: do



Comments:
--------------------------------------------------------------------------------

On 2016-02-06T18:26:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1599#issuecomment-180830095>

    Date and time datatypes are not yet implemented in Red. Please use strings for now rather to store such values. Time! datatype is scheduled for 0.6.1, date! is not scheduled yet.
    
    Example:
    
    ```
    Red [
        Title: "form-date"
        Author: "Satish"
        Date: "26-Apr-2007"
    ]
    
    print "hello"
    ```

