
#1701: Doesn't run on Mac OSX
================================================================================
Issue is closed, was reported by dnmurphy and has 4 comment(s).
<https://github.com/red/red/issues/1701>

Dowloaded for the web site the max osx version (0.54)  Put in a folder and tried to run it and just got a message bash:  red: command not found.  If I double click the file, it just loads int a text editor. I have downloaded Rebol in the same way and that works fine.  Its like its not packaged to be recognised as a binary by Mac.



Comments:
--------------------------------------------------------------------------------

On 2016-03-11T00:24:18Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1701#issuecomment-195114512>

    You need to add ./ in front of a program name if you are running it from the current working directory. This example should help.
    
    ``` text
    mbp:Languages peter$ red-053
    -bash: red-053: command not found
    mbp:Languages peter$ ./red-053
    --== Red 0.5.3 ==-- 
    Type HELP for starting information. 
    
    red>> 
    ```

--------------------------------------------------------------------------------

On 2016-03-11T03:05:19Z, xaduha, commented:
<https://github.com/red/red/issues/1701#issuecomment-195156829>

    @dnmurphy it's probably doesn't have +x on it, since it is downloaded from site as is, not in an archive. So, you'll need to run `chmod +x <path to red executable>`

