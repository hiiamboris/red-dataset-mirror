# How do I access serial port in RED?

**Link:**
<https://stackoverflow.com/questions/43506983/how-do-i-access-serial-port-in-red>

**Asked:** 2017-04-19 22:14:20 UTC

------------------------------------------------------------------------

I need to access some weighing machines via serial port. How could I
red/write data from/to it using the RED Programming language ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

Serial port and most of I/O are not yet implemented in Red.

Please have a look at the Red [Trello
board](https://trello.com/b/FlQ6pzdB/red-tasks-overview){rel="nofollow noreferrer"}
to get an overview of the parts left to be done.

------------------------------------------------------------------------

### Answer (score: 0) --- by iceflow19

As DocKimbel mentioned, most IO support is not yet implemented, but that
does not mean you can\'t manually implement the functionality in
Red/System.

The following information is pertinent if you are compiling for Windows.

To keep things simple I\'d recommend following a polling approach as
described in the first half of [**this
article**](http://www.codeguru.com/cpp/i-n/network/serialcommunications/article.php/c5425/Serial-Communication-in-Windows.htm){rel="nofollow noreferrer"}.

Actually most of the functions you need are already in simple-io.reds.
Specifically, you\'ll have to use the following functions under the
simple-io context:

-   CreateFileA
-   ReadFile
-   WriteFile

You may also need DeleteFileA, and GetLastError. simple-io doesn\'t
import them (only the wide string variant on DeleteFile), so you\'ll
have to do them yourself by importing it from **kernel32.dll** in
**stdcall** mode. You\'ll also need to import
[SetCommState()](https://msdn.microsoft.com/en-us/library/windows/desktop/aa363436(v=vs.85).aspx){rel="nofollow noreferrer"}.

    BOOL WINAPI SetCommState(
      _In_ HANDLE hFile,
      _In_ LPDCB  lpDCB
    );

You will need a [DCB (Device Control
Block)](https://msdn.microsoft.com/en-us/library/windows/desktop/aa363214(v=vs.85).aspx){rel="nofollow noreferrer"}
struct for the second parameter.

Once you get it working at the Red/System level then can you wrap each
of your basic com functionalities in a routine! abstracting out some of
the low level c aspects and exposing the low-level code to your Red
code.

------------------------------------------------------------------------

## Comments on question
