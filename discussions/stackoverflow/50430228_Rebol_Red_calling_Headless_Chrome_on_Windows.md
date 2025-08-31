# Rebol / Red calling Headless Chrome on Windows

**Link:**
<https://stackoverflow.com/questions/50430228/rebol-red-calling-headless-chrome-on-windows>

**Asked:** 2018-05-19 23:01:44 UTC

------------------------------------------------------------------------

In Dos command to take screenshot, you can use (see
[https://developers.google.com/web/updates/2017/04/headless-chrome](https://developers.google.com/web/updates/2017/04/headless-chrome){rel="nofollow noreferrer"}):

    chrome --screenshot="C:\test\test.png" "http://google.com" --headless --disable-gpu

In Rebol, I can make it work only using powershell -command:

    call {powershell -command "chrome --screenshot='C:\\test\\test.png' 'http://google.com' --headless --disable-gpu"}

In red I cannot make it work at all, did I miss something ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

This one works with the newest build, if you use the full path

    >> call "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --screenshot=c:\test\test.png https://www.google.com --headless --disable-gpu"
    == 1932

*Comment by user310291:* hope this will be fixed in the future because
having to hard code a path is cumbersome.

*Comment by sqlab:* I guess it\'s not an issue of **Red**, but of
Windows or the installation of Chrome. I can not start chrome from the
cmd line with just **chrome**, but it works with **calc**

------------------------------------------------------------------------

## Comments on question
