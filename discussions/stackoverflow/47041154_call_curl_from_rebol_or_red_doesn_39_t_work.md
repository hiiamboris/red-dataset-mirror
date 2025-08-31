# call curl from rebol or red doesn&#39;t work

**Link:**
<https://stackoverflow.com/questions/47041154/call-curl-from-rebol-or-red-doesnt-work>

**Asked:** 2017-10-31 17:23:12 UTC

------------------------------------------------------------------------

On dos cmd this works:

    curl.exe -L https://dl.uxnr.de/build/curl/curl_winssl_msys2_mingw64_stc/curl-7.53.1/curl-7.53.1.zip > curl.zip

On red or rebol, following suggestion [Cannot read a binary file with
red from
http](https://stackoverflow.com/questions/47008894/cannot-read-a-binary-file-with-red-from-http),
I tried code below but it doesn\'t work why ?

    call {curl.exe -L https://dl.uxnr.de/build/curl/curl_winssl_msys2_mingw64_stc/curl-7.53.1/curl-7.53.1.zip > curl.zip}

I also tried call/wait, it doesn\'t work either.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by sqlab

Rebol2:

    call/output {curl.exe -L https://www.example.com} data: make string! estimated-big-enough-number

Rebol3 (Ren/C branch):

    call/shell/output {curl -L https://www.example.com} data: make binary! 0

    ;; or

    call/output [%/path/to/curl "-L" "https://www.example.com"] data: make binary! 0

    ;;or a poor mans solution as in e.g.

     call {curl -L -k https://dl.uxnr.de/build/curl/curl_winssl_msys2_mingw64_stc/curl-7.53.1/curl-7.53.1.zip  > this-I-want } data: read %this-I-want

Red:

    call/output {curl -L -k https://dl.uxnr.de/build/curl/curl_winssl_msys2_mingw64_stc/curl-7.53.1/curl-7.53.1.zip} data: make binary! 100'000

*Comment by user310291:* string ? why on earth since it\'s binary file
:)

*Comment by rgchris:* \@user310291 Can also say
**`data: make binary! ...`**

*Comment by sqlab:* I modified the answer so that it works for Red and
Rebol2

*Comment by Edoc:* My version of R3 is 2.101.0.3.1 and \'call has no
refinements for /shell or /output. It only supports /wait. Any tips on
how to get capture the data that comes back from cURL?

*Comment by sqlab:* You can try a redirect and then read it as in **call
\"ls -l \> this-I-want\" data: read %this-I-want**

------------------------------------------------------------------------

## Comments on question
