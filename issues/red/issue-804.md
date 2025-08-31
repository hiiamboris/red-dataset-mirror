
#804: binary doesn't work on mac
================================================================================
Issue is closed, was reported by williammacleod and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/804>

I downloaded the mac version from  http://www.red-lang.org/p/download.html
I've tried to open it every way I can think of. I get "file doesn't exist" messages. When I double click it opens and immediately exits with "permission denied". I've tried "open" and other commands from terminal. When I run "file" on it mac says "red-42 doesn't exist" 

Thanks



Comments:
--------------------------------------------------------------------------------

On 2014-05-03T10:10:21Z, PeterWAWood, commented:
<https://github.com/red/red/issues/804#issuecomment-42101288>

    William
    
    These steps should work:
    1. Download the red binary and store it in a suitable folder. Let's say you saved it in /Users/Wiiliam/Red
    2. Open terminal and enter the following commands.
    3. Change to the directory containing the Red binary using
       
       cd /Users/William/Red
    4. Make the Red binary executable using
       
       chmod +x red-042 
    5. Run the Red binary using
       
       ./red-042
    
    You should see something similar to this:
    
    ```
    Schulz:Red peter$ chmod +x red-042-darwin
    Schulz:Red peter$ ./red-042-darwin
    Pre-compiling Red console...
    
    -=== Red Console alpha version ===-
    Type HELP for starting information.
    
    red>> 
    ```
    
    if you then enter system/version, you should see this:
    
    == "0.4.2, 2-May-2014/17:43:09+8:00"
    
    Enter quit to finish the Red session.  
    
    If you have any questions of a similar nature, please raise them in a different forum such as the Red Google Group or on StackOverflow and not by raising a bug ticket.
    
    Peter  
    
    On 3 May 2014, at 16:54, williammacleod wrote:
    
    > I downloaded the mac version from http://www.red-lang.org/p/download.html
    > I've tried to open it every way I can think of. I get "file doesn't exist" messages. When I double click it opens and immediately exits with "permission denied". I've tried "open" and other commands from terminal. When I run "file" on it mac says "red-42 doesn't exist" (Am i doing something wrong here?
    > 
    > Thanks
    > 
    > —
    > Reply to this email directly or view it on GitHub.

