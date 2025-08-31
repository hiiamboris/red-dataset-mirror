
#1006: Error when manually compiling console with binary
================================================================================
Issue is closed, was reported by PeterWAWood and has 8 comment(s).
<https://github.com/red/red/issues/1006>

When you try to compile the console manually under Windows and OS X you get compiler errors. 

Please see the comment below for details.



Comments:
--------------------------------------------------------------------------------

On 2015-01-04T00:00:09Z, qtxie, commented:
<https://github.com/red/red/issues/1006#issuecomment-68614761>

    You need to add `-c` if you want to compile the `console.red`.
    
    ```
    E:\Red>red-03jan15-6872514.exe -c environment\console\console.red
    ```

--------------------------------------------------------------------------------

On 2015-01-04T00:12:49Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1006#issuecomment-68615094>

    Thanks @qtxie 
    
    I get a different error now, I will update the description. These are the errors:
    
    Windows 7
    
    ```
    E:\Languages\Red>red-26dec14-380b0e7-c environment\console\console.red
    'red-26dec14-380b0e7-c' is not recognized as an internal or external command,
    operable program or batch file.
    
    E:\Languages\Red>red-26dec14-380b0e7 -c environment\console\console.red
    
    -=== Red Compiler 0.5.0 ===-
    
    Compiling /E/Languages/Red/environment/console/console.red ...
    ...compilation time : 625 ms
    
    Compiling to native code...
    *** Compilation Error: undefined symbol: red/string/rs-reset
    *** in file: %wcwidth.reds
    *** in function: exec/terminal/complete-line
    *** at line: 272
    *** near: [string/rs-reset line until [string/concatenate line as red-string! bl
    ock/rs-head result -1 0 true false if not num = 1 [string/append-char (as series
    -buffer! line/node/value) 32] block/rs-next result block/rs-tail? result] line/h
    ead: string/get-length line true]
    ```
    
    OS X 
    
    ```
    Schulz:Red peter$ ./red-050-darwin -c environment/console/console.red
    
    -=== Red Compiler 0.5.0 ===- 
    
    Compiling /Users/peter/VMShare/Languages/Red/environment/console/console.red ...
    ...compilation time : 580 ms
    
    Compiling to native code...
    *** Compilation Error: undefined symbol: esc 
    *** in file: %POSIX.reds 
    *** in function: exec/terminal/query-cursor
    *** at line: 340 
    *** near: [
        esc fd-read-char 100 #"[" = fd-read-char 100
    ]
    ```

--------------------------------------------------------------------------------

On 2015-01-04T00:14:49Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1006#issuecomment-68615147>

    This error could be due to me not using the latest binary (couldn't access automated build) and using latest version of console.red

--------------------------------------------------------------------------------

On 2015-01-04T04:09:29Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1006#issuecomment-68620314>

    I have successfully tested the red-04jan15-35673ec automated build on both OS X and Windows.

