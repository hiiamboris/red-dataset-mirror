
#268: Callbacks on ARM corrupt
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/268>

```
pi@raspberrypi /boot/Red $ ./do-sql ~/archives/Red-test.fossil "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"
Row number: 1
name: attachment

...

Row number: 23
name: user

Segmentation fault
```

The callback in the SQLite binding is called for each row. Only after all callbacks have been processed and SQLite returns to Red/System does the corruption result in a crash.

`play-SDL-WAV` from the SDL binding crashes earlier.

cURL gives an access violation:

```
pi@raspberrypi /boot/Red $ ./read-web-page
cURL version: libcurl/7.26.0 OpenSSL/1.0.1c zlib/1.2.7 libidn/1.25 libssh2/1.4.1 librtmp/2.3

*** Runtime Error 1: access violation
*** at: 0000C554h
```



Comments:
--------------------------------------------------------------------------------

On 2012-10-15T01:16:56Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/268#issuecomment-9430308>

    SQLite, SDL, cURL and 0MQ work now.

