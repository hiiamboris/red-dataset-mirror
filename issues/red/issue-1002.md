
#1002: red crashed in cmder console
================================================================================
Issue is closed, was reported by bitbegin and has 10 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1002>

I run red-050.exe in cmder console, and it crashed!
Here is the log,

```
λ red-050.exe                                                                 
*** Driver Internal Error: Script Error : Cannot use lesser? on date! value   
*** Where: run-console                                                        
*** Near:  [if any [                                                          
not exists? exe                                                               
(modified? exe) < modified? bin                                               
] [                                                                           
console: %environment/console/                                                
write script read-cache console/console.red                                   
write temp-dir/help.red read-cache console/help.red                           
write temp-dir/input.red read-cache console/input.red                         
opts: make system-dialect/options-class [                                     
link?: yes                                                                    
unicode?: yes                                                                 
config-name: to word! default-target                                          
build-basename: %console                                                      
build-prefix: temp-dir                                                        
red-help?: yes                                                                
]                                                                             
opts: make opts select load-targets opts/config-name                          
print "Pre-compiling Red console..."                                          
result: red/compile script opts                                               
system-dialect/compile/options/loaded script opts result/1                    
delete script                                                                 
delete temp-dir/help.red                                                      
delete temp-dir/input.red                                                     
if all [Windows? not lib?] [                                                  
print "Please run red.exe again to access the console."                       
quit/return 1                                                                 
]                                                                             
]                                                                             
exe:                                                                          
]                                                                             
```



Comments:
--------------------------------------------------------------------------------

On 2014-12-29T02:19:00Z, veincheng, commented:
<https://github.com/red/red/issues/1002#issuecomment-68227755>

    in linux and mac also have this question。

--------------------------------------------------------------------------------

On 2014-12-29T03:32:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1002#issuecomment-68230146>

    Could you give it a try using the automated builds instead of the 0.5.0 ones?

--------------------------------------------------------------------------------

On 2014-12-29T09:31:10Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1002#issuecomment-68243158>

    I have tested the latest automated build under Windows. OS X and Linux. It runs as expected:
    
    ```
    ########### WINDOWS ##############
    
    Microsoft Windows [Version 6.1.7601]
    Copyright (c) 2009 Microsoft Corporation.  All rights reserved.
    
    C:\Users\Peter>e:
    
    E:\>cd Languages/Red
    
    E:\Languages\Red>red-26dec14-380b0e7
    Pre-compiling Red console...
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> quit
    
    E:\Languages\Red>red-26dec14-380b0e7
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> quit
    
    E:\Languages\Red>c:
    
    C:\Users\Peter>e:\Languages\Red\red-26dec14-380b0e7
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>>
    
    ########## OS X ##############
    
    Schulz:Red peter$ pwd
    /Users/peter/VMShare/Languages/Red
    Schulz:Red peter$ chmod +x red-26dec14-380b0e7-darwin
    Schulz:Red peter$ ./red-26dec14-380b0e7-darwin
    Pre-compiling Red console...
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> quit
    Schulz:Red peter$ ./red-26dec14-380b0e7-darwin
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> quit
    Schulz:Red peter$ echo 'binary copied to /usr/local/bin'
    binary copied to /usr/local/bin
    Schulz:Red peter$ red-26dec14-380b0e7-darwin
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> quit
    Schulz:Red peter$ cd ~
    Schulz:~ peter$ red-26dec14-380b0e7-darwin
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> quit
    Schulz:~ peter$ ~/VMShare/Languages/Red/red-26dec14-380b0e7-darwin
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> quit
    
    ######### LINUX ##############
    peter@schulz-xubuntu:~$ cd /media/sf_VMShare/Languages/Red
    peter@schulz-xubuntu:/media/sf_VMShare/Languages/Red$ chmod +x red-26dec14-380b0e7-linux
    peter@schulz-xubuntu:/media/sf_VMShare/Languages/Red$ ./red-26dec14-380b0e7-linux
    Pre-compiling Red console...
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> quit
    peter@schulz-xubuntu:/media/sf_VMShare/Languages/Red$ ./red-26dec14-380b0e7-linux
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> quit
    peter@schulz-xubuntu:/media/sf_VMShare/Languages/Red$ cd ~
    peter@schulz-xubuntu:~$ /media/sf_VMShare/Languages/Red/red-26dec14-380b0e7-linux
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> quit
    ```

--------------------------------------------------------------------------------

On 2014-12-29T15:51:20Z, veincheng, commented:
<https://github.com/red/red/issues/1002#issuecomment-68268482>

    now auto-builded red in mac and linux is normal work

--------------------------------------------------------------------------------

On 2014-12-29T23:14:20Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1002#issuecomment-68314184>

    Thanks for the confirmation that the auto-build version is working correctly.

