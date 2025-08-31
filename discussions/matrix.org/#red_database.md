# Archived messages from: https://app.gitter.im/#/room/#red_database:gitter.im (https://app.gitter.im/#/room/!wXkNTvrTMPdAuvDQYu:gitter.im)

## 18-Mar-2022

[22:17:28](#K89Y9vvNs6KNidD7kYWYS3WJrXngijJrtepkkXp_LiQ) <Respectech (Respectech)>:
Hello!

[22:17:29](#b_iRNIvwJSeUZ0hNACWMpeQkNJKb6wY1jDA5Iot_PrY) <Respectech (Respectech)>:
I want Red DB support for MySQL. :-)

[23:36:33](#ker4nh2DQfXyGjDOzZ-FNA23OU2rmX982wbVajUpQtE) <GiuseppeChillemi (GiuseppeChillemi)>:
Hooray! Thank you @Respectech 

[23:36:43](#c5gVVPIByJcGgMTs3nvy7ESg8Szw0vEgIOu2oefz2go) <GiuseppeChillemi (GiuseppeChillemi)>:
* Hooray! Thank you @Respectech  and @gregg

[23:36:59](#wWY2sroX1IcCcAfEqEaPGyXtII39WdRS4HVuX2frN9I) <GiuseppeChillemi (GiuseppeChillemi)>:
* Hooray! Thank you @Respectech  and @greggirvi

[23:37:03](#5dsRz0qJqGQIR-6f9i0Tyg8noLpunpZHyx7OCNB8rL8) <GiuseppeChillemi (GiuseppeChillemi)>:
* Hooray! Thank you @Respectech  and @greggirvin

[23:37:23](#2FiQCTtxpA2zmMpvTOIYfsUTD6Fmqj7eynXsh4EzZOg) <GiuseppeChillemi (GiuseppeChillemi)>:
* Hooray! Thank you @Respectech  and @greggirwin

[23:39:39](#3AVW5HH2IZchoHgzzaAO2Dh1hJJjhLCQp1ttxe7u-Ww) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri @rebolek We are waiting for you!

## 19-Mar-2022

[0:46:27](#x7ocZERFv0wQDLfFO6C-iz970Kvlv1_xncOJrydWBx4) <gurzgri>:
Hi

[6:48:43](#Is8IJhXhN3ocBWeZhpr6NcIZE7qoCOxK96G-dhe8yj4) <rebolek (Boleslav Březovský)>:
Hello :)

[6:48:45](#vk_y7_vUNvlnWO4aLpeKLNg12dt1b54_M6fm17xbMaY) <rebolek (Boleslav Březovský)>:
https://gitlab.com/rebolek/protocols/-/blob/main/mysql/mysql-client.red

[6:49:39](#DPI-T4T7TKjvvOVtOgwZn81IHQOzlvjbnmFmNAk8jUE) <rebolek (Boleslav Březovský)>:
This is an initial commit, able to connect to DB.

[18:11:14](#NhbtIO367v59kUxmw0uwvj7tKf8gBRBLQ0HrhW_MG3o) <GiuseppeChillemi (GiuseppeChillemi)>:
We have R3 atronix  and Doc code that could be used

[22:43:40](#P-Cqj0UYYy-Qel3VwmbHEMPtaxIBp2nDtSbSYD5MtmE) <GiuseppeChillemi (GiuseppeChillemi)>:
I mean: could be used to build on your code and shorten the development time

## 20-Mar-2022

[7:29:37](#TUXuF0FoS0Ct96TDI7GjLJMUTBFcuBi3sOY3x8NlvMs) <rebolek (Boleslav Březovský)>:
I know about previous efforts, thanks. Just for reference, here are the links:

* [Doc’s MySQL (R2)](https://www.softinnov.org/rebol/mysql.shtml)
* [Atronix’ MySQL (R3)](https://github.com/zsx/mysql-r3)

[7:41:58](#_cEI85ZIzB9j5BSDU8Lygh3-1sKZCjZPSduXlPZxmB4) <gurzgri>:
https://github.com/gurzgri/red/tree/odbc should do for MySQL too, even if untested against it.

## 21-Mar-2022

[23:28:05](#KPuVXZ5AOVMCWddVgIhkHHlClSrvVQObnP6kmj58p3o) <Respectech (Respectech)>:
@rebolek Amazing!

## 29-Mar-2022

[16:52:50](#BuLpE1OsKe-z18HZ2jE8zl2nCS5o7pq3XkLjguRU22E) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri I have compiled the Red Sources but I do not find the usage documentation, could you please help?

[18:06:30](#RsAswWFEadJ11sx7hL2bqnRLyl0yINdKPtvAdph74Mg) <GiuseppeChillemi (GiuseppeChillemi)>:
Well, I have found the documentation:
https://github.com/gurzgri/red/blob/odbc/environment/schemes/odbc.md

[18:07:08](#alIH40CoFalHMWAMlhLarvvztmvm5of9kTVhak3m4Sc) <GiuseppeChillemi (GiuseppeChillemi)>:
And queried: using
```
probe system/schemes/odbc/state/sources
```

[18:07:38](#RHuPd2f5MzTW62cAnlygguImTQmiLK-JnwKWkdkh7A4) <GiuseppeChillemi (GiuseppeChillemi)>:
All my sources where 64bit so I am ging to recreate DNSes

[18:07:54](#3oI52onPOI8l0ZWgIG7OlY2p2ySKhouqZvIofZg-weI) <GiuseppeChillemi (GiuseppeChillemi)>:
* All my sources where 64bit so I am ging to create a new DNS

[18:08:00](#yAA8EB6qtsXxkZAFpYRGQwNSeMBuDCGieB88UOaFWJs) <GiuseppeChillemi (GiuseppeChillemi)>:
* All my sources where 64bit so I am ging to create a new DNS entry

[18:58:09](#CA-NBy3wIPEV9Ww-5nXWYhsueZe8yJEyOubKR9XJKi0) <GiuseppeChillemi (GiuseppeChillemi)>:
Well I have not gone far after a connection attempt. Also the console outputs driver messages like a typewriter, on char by one

[18:58:17](#vUxH9728eoz77pxcinlKhYdoR0pmeeUVruARJH88CO4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Well I have not gone far after a connection attempt. Also the console outputs driver messages like a typewriter: on char by one

[19:00:42](#k7OrECoXIo5KjoJgKCsyZp0Qt4f9Qvvye5XpRFo35Rs) <GiuseppeChillemi (GiuseppeChillemi)>:
* Well I have not gone far after some connection attempts because I have "runtime errors" and connection errors. Also the console outputs driver messages like a typewriter: on char by one
Running console.exe I was able to see the output error.

[19:00:55](#g9h8CXJBY-QYKDhhbjJa0hjGEuLZ_LsgzHML_IQT3lE) <GiuseppeChillemi (GiuseppeChillemi)>:
* Well I have not gone far after some connection attempts because I have "runtime errors" and connection errors. Also the console outputs driver messages like a typewriter: on char by one
Running console.exe I have been able to see the output error.

[19:01:00](#RcgrbbbAzG8fZThuI_AWqPCOsmC-N-8uh0JoTv4Lznc) <GiuseppeChillemi (GiuseppeChillemi)>:
* Well I have not gone far after some connection attempts because I have "runtime errors" and connection errors. Also the console outputs driver messages like a typewriter: on char by one
Running console.exe I have been able to see the output errors.

[19:02:40](#rX7nxEcvNOW0eWkzHhvq5Kmbh7cDn72zvje6hluLFRE) <GiuseppeChillemi (GiuseppeChillemi)>:
* Well I have not gone beyond some connection attempts because I have "runtime errors" and connection errors. Also the console outputs driver messages like a typewriter: on char by one
Running console.exe I have been able to see the output errors.

[19:03:16](#T9mIfylxO1_CamMXTnmHd1hZ7Ml7Cv8E4QCtZsqagjA) <GiuseppeChillemi (GiuseppeChillemi)>:
* Well I have not gone beyond some connection attempts, because I have "runtime errors" and connection errors and also console hanging. Also the console outputs driver messages like a typewriter: on char by one
Running console.exe I have been able to see the output errors.

[19:03:30](#O8v8VZBoOAVE5wCtzEOYblmq4xvA93MpLA3yeTKIRF4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Well I have not gone beyond some connection attempts, because I have "runtime errors" and connection errors and also console hanging. Also the console outputs driver messages like a typewriter: on char by one
Running `console.exe` I have been able to see the output errors.

## 30-Mar-2022

[17:34:21](#FE6CPISXSXMX0sWnthKUDpuoZX5bjuD0cFpbvn1IEYU) <gurzgri>:
@GiuseppeChillemi I might be able to provide some support for this, given you provide the full output of
```
probe system/schemes/odbc/state/drivers
```
and
```
probe system/schemes/odbc/state/sources
```
and provide the code you use to connect (via DSN and/or connection string, if DSN please accompany this with screenshots of the 32bit odbc admin pannel. Please supply the exact driver version(s) you're using) together with the output of such a failing connection attempt if run in a `console.exe` compiled in `---debug` mode.
Put all this in a gist please or post it in private channel.

[17:43:00](#-FpCcuQ7vxPwgAUFYDe9dZN0xj97YdX1Ugr7O8-8-gY) <GiuseppeChillemi (GiuseppeChillemi)>:
You already have a lot on the Ticket I have opened but I am going to add those additional info

[17:43:07](#uw0ZVOj6KpH8xH6xhsC2K1cWt6PFtlsK-SzLkHi5Ekc) <GiuseppeChillemi (GiuseppeChillemi)>:
* You already have a lot on the Ticket I have opened but I am going to add these additional info

[17:43:27](#CzXg-qTfh4amzx-imCZA8gQ2iJACIvL_LyZ0GxW0gJg) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri
You already have a lot on the Ticket I have opened but I am going to add these additional info

[18:06:06](#zu6gWellj4aSPPRSy9jk-jkYJ-AiIZwg_c1WPJUC9u4) <GiuseppeChillemi (GiuseppeChillemi)>:
Everything now there. Feel free to contact me for further questions.

[18:12:45](#wnPZkq213FOb4Hbim3lARNTzn19ZBmC2NzU8vl0K28U) <gurzgri>:
:+1: Didn't knew about that ticket up until just now, because no notification email was configured. The gui-console "typewriter mode" is interesting, I practically never ever used the GUI console for anything. I'll have a look.

[19:03:10](#M_ZjJ6GSGgdk2g2PWH9Dotg3t-BpZ_SqsIaJ7d3b_AM) <gurzgri>:
Sadly, I have no access to a SQL Server DB. Is any of the following
```
connection: open make port! [
    scheme: 'odbc
    target: "driver={SQL Server};server=192.168.x.x;port=1433;database=ADB_RD32;uid=********;pwd=********;AutoTranslate=yes"
]
```
connection: open make port! [scheme: 'odbc target: "dsn=RD32;AutoTranslate=yes"]
```
```
connection: open odbc://RD32     ;-- with AutoTranslate=Yes in configured in admin panel
```
a turn for the better? And if it is "=Yes" already, does "=No" help? Likely a ANSI<>Unicode issue, the odbc scheme is reliant upon receiving Unicode strings. Otherwise trying to treat buffers as `string!`s is bound to fail.

[19:03:46](#1dFqftcRmiHA06zfdHa8ijuqL5AOXpl4EQG0NxPbYpE) <gurzgri>:
* Sadly, I have no access to a SQL Server DB. Is any of the following
```
connection: open make port! [
    scheme: 'odbc
    target: "driver={SQL Server};server=192.168.x.x;port=1433;database=ADB_RD32;uid=********;pwd=********;AutoTranslate=yes"
]
```
```
connection: open make port! [scheme: 'odbc target: "dsn=RD32;AutoTranslate=yes"]
```
```
connection: open odbc://RD32     ;-- with AutoTranslate=Yes in configured in admin panel
```
a turn for the better? And if it is "=Yes" already, does "=No" help? Likely a ANSI<>Unicode issue, the odbc scheme is reliant upon receiving Unicode strings. Otherwise trying to treat buffers as `string!`s is bound to fail.

[19:04:23](#c_SZMsW68t1Ojc2nEPpkzDFW5i0F4geKy9p41NyHtZ0) <gurzgri>:
* Sadly, I have no access to a SQL Server DB. Is any of the following
```
connection: open make port! [
    scheme: 'odbc
    target: "driver={SQL Server};server=192.168.x.x;port=1433;database=ADB_RD32;uid=********;pwd=********;AutoTranslate=yes"
]
```
```
connection: open make port! [scheme: 'odbc target: "dsn=RD32;AutoTranslate=yes"]
```
```
connection: open odbc://RD32     ;-- with AutoTranslate=Yes configured in admin panel
```
a turn for the better? And if it is "=Yes" already, does "=No" help? Likely a ANSI<>Unicode issue, the odbc scheme is reliant upon receiving Unicode strings. Otherwise trying to treat buffers as `string!`s is bound to fail.

[20:03:53](#bn2p7Nks26b21fH5VexzxoSNNDdEElSK_fXhZ14fsEo) <GiuseppeChillemi (GiuseppeChillemi)>:
I will return at home later and I will remotely connect to the office to try it

[21:42:06](#gX583DFFAa1nP-Fu2DC0MdD3CocaB1e4NeCYsOYxRyU) <gurzgri>:
I remember having a similiar issue with the Jet Engine / Text Driver. Tthere it was `CharacterSet=Unicode` what solved it, but these connection string params differ from database to database and/or from driver to driver. For SQL Server there is no option with this name and "AutoTranslate" being the closest fit.

[22:01:03](#5gFuJd7VZ4CzMgjXa6Z1yAaKqcX1GOp2QXDmVHeHMWI) <GiuseppeChillemi (GiuseppeChillemi)>:
Non worked and everyone has returned an error, but...

[22:01:35](#hLGSWuoF3QQWmPcAgc9t1mJSzSyXM9aY70gOO5AuAG0) <GiuseppeChillemi (GiuseppeChillemi)>:
```
connection: open make port! [
    scheme: 'odbc
    target: "driver={SQL Server};server=192.168.x.x;port=1433;database=ADB_RD32;uid=********;pwd=********;AutoTranslate=yes"
]
```

This one was able to hang the console

[22:02:24](#Sj_UchHKC6VBFRxyI4xayQDAl9AQYdtZw3bfcYSY3hA) <GiuseppeChillemi (GiuseppeChillemi)>:
Also, in the Admin panel I have "translate charaters" flagged for the data source.

[22:02:40](#hP4YY2IGcRyCHc9yvaOB1AGAU-pe2n35JAjBPCImRVg) <GiuseppeChillemi (GiuseppeChillemi)>:
* No one has worked and everyone has returned an error, but...

[22:16:43](#9J4YvBUnxnR0W8tHjOixez5Y6996F7pTSWVMgsFzpgk) <gurzgri>:
Would be nice to see where it hangs/failed in a —debug compiled (CLI) console 

[22:17:12](#K-rYAw2AOyqcMwVrYdME-ZMg_J2sSnUR4ya031KbD_0) <GiuseppeChillemi (GiuseppeChillemi)>:
One of the most interesting result come from these commands:
```
[
c [connection: open make port! [scheme: 'odbc target: "dsn=RD32;AutoTranslate=yes"]]

d [connection: open odbc://RD32]     ;-- with AutoTranslate=Yes configured in admin panel
]

>> switch 'c con
28000 18456 [Microsoft][ODBC SQL Server Driver][SQL Server]Accesso non riuscito
per l'utente ''.
*** Script Error: ODBC error: ["28000" 18456 {[Microsoft][ODBC SQL Server Driver
][SQL Server]Accesso non riusc
*** Where: ctx||440~open-connection
*** Near : "dsn=RD32;AutoTranslate=yes"
*** Stack:

>> switch 'd con
28000 18456 [Microsoft][ODBC SQL Server Driver][SQL Server]Accesso non riuscito
per l'utente ''.
*** Script Error: ODBC error: ["28000" 18456 {[Microsoft][ODBC SQL Server Driver
][SQL Server]Accesso non riusc
*** Where: ctx||440~open-connection
*** Near : entity/spec/host
*** Stack:
```

I can see the context near "where" 

[22:17:53](#YdLcey_FS3kT6khuB_hDwileCAM7E8SoNcFpVbHuadI) <GiuseppeChillemi (GiuseppeChillemi)>:
I can try to compile it with debug on.

[22:33:57](#IA3uEZ1hCMH1l5aEmPV88OA2sPkFCX5U4zMoCEzK9Ng) <gurzgri>:
I can try to compile it with debug on.

[22:38:48](#DO4CAHfLPWeCsZP0YTD-2TWFTzvPWIq62iHVPgs41h8) <gurzgri>:
These two error message look like totally legit connections errors due to some misconfiguration re: the user auth method. See e.g. https://dba.stackexchange.com/questions/29992/odbc-data-source-sql-server-connection-login-failed-for-user , that seems to be an recurring ODBC issue with SQL Server, but not so much odbc:// scheme related.  

[22:39:42](#bPJvAvvqxvsVTBmKqdsZn8jyBeYzUe0XzTAr45JnOZA) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri 

The console hangs at this point but continues after 10 seconds:

```
actor/open: connection
init-odbc
OPEN-ENVIRONMENT [
        SQLAllocHandle 0
        SQLSetEnvAttr 0
]
OPEN-CONNECTION [
        SQLAllocHandle 0
        SQLDriverConnect 65535
```

[22:39:48](#me3kWCjRQclY-JyukkF5DSO6_jEYEv15DnVk5G0jVbY) <GiuseppeChillemi (GiuseppeChillemi)>:
But!....

[22:40:49](#PpSjU7XE2cr2Q1RFAFWrkGIX8nJ8VmmOhdhqie3Z7pk) <GiuseppeChillemi (GiuseppeChillemi)>:
Please take a look at the line before the last:


```
DIAGNOSE-ERROR [
        allocate state, 12 bytes @ 03C161E8
        allocate message, 4096 bytes @ 03C18020
        SQLGetDiagRec 0
08001
08001 17 [Microsoft][ODBC SQL Server Driver][DBNETLIB]Server SQL inesistente o a
ccesso negato.
        SQLGetDiagRec 0
01000
01000 2 [Microsoft][ODBC SQL Server Driver][DBNETLIB]ConnectionOpen (Connect()).

        SQLGetDiagRec 100
        free state @ 03C161E8
        free message @ 03C18020
]
*** Script Error: ODBC error: ["08001" 17 {[Microsoft][ODBC SQL Server Driver][D
BNETLIB]Server SQL inesistente
*** Where: select-key*
*** Near : {driver={SQL Server};server=192.168.0.5;d}
*** Stack:
```

[22:42:03](#kviPZLGwI_UvTBv1CKt-B7_gKXzEtSjeh2suHWT3wCA) <GiuseppeChillemi (GiuseppeChillemi)>:
```
....server=192.168.0.5;d}
```


[22:42:50](#ygyQJOf9BIOJAtvtxWePYm6uQjFr903nvFBweJ3aqkg) <GiuseppeChillemi (GiuseppeChillemi)>:
Why does the server string has `d` as last char?

[22:42:53](#3tU3oNquRQMR9WrmsBDyCF_0YXqS0CoVmxsuqrFziSg) <gurzgri>:
afaik `*** Near` only cites so much from your code. 

[22:44:01](#E1amcm6qhIo79Co9UDrOrZrrIr5wjanx48FmraFpScI) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, so it is not a parsing problem

[22:47:06](#xoXVZLIptVRIohhyig_7GmvYjcyv0lOjNNdpjrzVFgU) <gurzgri>:
And `select-key*` isn't a function belonging to the scheme.

[22:48:42](#1okhJvsc8DknJSvucBS5-7a1dMq-iwTUT2IrcslCC_s) <GiuseppeChillemi (GiuseppeChillemi)>:
I don know where to search it but I remember such naming comes from Red source, so it could be a Port code Bug.

[22:49:06](#OYGFzRnt0HDiKpcGY9PRu7gA4s_HP0xvm7tOovsfJd4) <gurzgri>:
No, no parsing there. The connection string or the alternatively the DSN ist just passed as is to the driver. He handles all the parsing. What happens here is the odbc:// correctly advises the driver to connect, but the criver can't connect, so it fails. The scheme errors out with the error message it recieves from the driver.

[22:50:02](#JQWRyBLze84-rLMNWWRWoR9cC-mUQrkTA6n8M7u9cnw) <gurzgri>:
I do not assume a bug in nether Red nor the scheme's code given these error messages.

[22:50:14](#T1DrziDQDka-8l58jv513_65ui4GxX3nJny5plsq4oU) <gurzgri>:
*neither

[22:50:48](#1j0pFIUII3IuPrwIXJdU47uQFA3mwrSqZyrJ1BRl9gs) <GiuseppeChillemi (GiuseppeChillemi)>:
"Non-existant SQL Server", has led me to think it could be an erroneous string.

[22:51:22](#YEReEgqgald5BAkBKFV3t9plzoVh1rWrUbbzf08HljY) <GiuseppeChillemi (GiuseppeChillemi)>:
* "Non-existant SQL Server", has led me to think it could be an erroneous server string damaged somewhere by the code.

[22:57:23](#9Wpxq492y3MG4JMnEA2loh9KyVbMufQe6riLlDzt-Uw) <gurzgri>:
As per the system/schemes/odbc/state/sources you posted, you have two `DSN`ames `RD32` and `RD32B`. You sure that these can connect when you connection-test them in the 32bit odbc admin panell?

[23:15:44](#UqWOY5Q9cFl5ZQaJz8W64tTcnF-m4eeA3xiNXFuSSD4) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, I can connect.

[23:15:58](#jUIL929EuVVaZ3cxLH8ffoen5XGzwRYxpAjiqpK3ad0) <GiuseppeChillemi (GiuseppeChillemi)>:
However, I was able to have a Red error:


[23:16:41](#xBDzBjYS7yRyuyRY1rNeY0ugOKiSdV6UpkfDa_mmLIo) <GiuseppeChillemi (GiuseppeChillemi)>:
```
>> switch 'b con
actor/open: connection
init-odbc
OPEN-ENVIRONMENT [
        SQLAllocHandle 0
        SQLSetEnvAttr 0
]
OPEN-CONNECTION [
        SQLAllocHandle 0
        SQLDriverConnect 1
DIAGNOSE-ERROR [
        allocate state, 12 bytes @ 03206270
        allocate message, 4096 bytes @ 0320A110
        SQLGetDiagRec 0
01000
01000 5701 [Microsoft][ODBC SQL Server Driver][SQL Server]Il contesto di databas
e è stato sostituito con 'ADB_RD'.
        SQLGetDiagRec 0
01000
01000 5703 [Microsoft][ODBC SQL Server Driver][SQL Server]L'impostazione della l
ingua è stata sostituita con Italiano.
        SQLGetDiagRec 100
        free state @ 03206270
        free message @ 0320A110
]
]
about-connection
*** Access Error: invalid UTF-8 encoding: #{C0C1C2C3}
*** Where: parse
*** Near : info
*** Stack: eval-set-path
```



[23:18:03](#aamYreVfh9H-PfKhtu9vvwjlHkONNg9GsDjAW1KtHYY) <GiuseppeChillemi (GiuseppeChillemi)>:
1) Removed `port=1433`
2) Changes 'server=192.160.0.x` to `server\sqservername` 

[23:18:11](#QMc0lBpyY3KKQ-xbuZcgSnurlyzaJxVKK_Y6ompswDk) <GiuseppeChillemi (GiuseppeChillemi)>:
* 1) Removed `port=1433`
2) Change 'server=192.160.0.x` to `server\sqservername` 

[23:18:31](#MvaaBv5YxsoeaWiYFBG0BU5mfJ7FlkXfmxE6u8WIzv8) <GiuseppeChillemi (GiuseppeChillemi)>:
It seems you cannot use the IP address but a full name.

[23:18:49](#YuxpTKgfKIBOudYMDTlFjD4VrrNtFlqVSaT19gYvCxs) <GiuseppeChillemi (GiuseppeChillemi)>:
Also `port` is not recognized as attribute.

[23:19:18](#aoC4pz2lGF08LGb8vTnfPPIlm_6GEhKhmNfpmxmIcus) <GiuseppeChillemi (GiuseppeChillemi)>:
So, as you can se, we have just a: `invalid UTF-8 encoding: #{C0C1C2C3}`

[23:21:32](#FHB71oi3iwQsmBAYtJrwGkJPy9qrfxiMxRtbLVyUs5U) <GiuseppeChillemi (GiuseppeChillemi)>:
I have the same error when I load an ASCII source in Red but with accented character which are ASCII > 128

[23:23:26](#7eyl-0fxJtx6qZ6YbGVt1FkIQK6mMtBTnmTk7Tu7nI4) <gurzgri>:
That‘s the ANSI<>Unicode thing from above. But at least the connection is there, we can from there. But need to get some sleep now.

[23:30:48](#CP0iUMy0CO80_HYYxxD1fFG6avgTz8jRchSvpreoJsY) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, it's very late here. See you tomorrow. 

## 31-Mar-2022

[17:46:57](#IF5quIvMtALK1LIWB_zbGH1afljHADxMagi3i4T3JvU) <greggirwin (Gregg Irwin)>:
Thanks for pushing on this @GiuseppeChillemi and @gurzgri. :+1:

[19:33:00](#jjlr1rzvITIA3OP3jGdr_F0HM8VxTOUxt9rG0QmtOjw) <gurzgri>:
@GiuseppeChillemi I pushed a commit providing more verbose debugging output whilst collecting connection information once the connection has been established. Please pull again an repeat your last successfull `switch 'b con` in a --debug CLI console (because the GUI won't provide debug information printed on R/S level).

And for the sake of completeness: What is this `switch 'b con` connection method looking like? You posted only the code for `'c` and `'d`.

Finally, regarding the GUI "typewriter" mode (I like that metaphor): I don't suffer from this here. It's not as fast as the CLI, but is not slow, not "typewriter slow", far from.

[19:33:30](#MqqHwUoWI_4mGB9PPTvDM6Op4ozjc18zAmMZ2L9jVZA) <gurzgri>:
* @GiuseppeChillemi I pushed a commit providing more verbose debugging output whilst collecting connection information once the connection has been established. Please pull again and repeat your last successfull `switch 'b con` in a --debug CLI console (because the GUI won't provide debug information printed on R/S level).

And for the sake of completeness: What is this `switch 'b con` connection method looking like? You posted only the code for `'c` and `'d`.

Finally, regarding the GUI "typewriter" mode (I like that metaphor): I don't suffer from this here. It's not as fast as the CLI, but is not slow, not "typewriter slow", far from.

[22:00:34](#xxS8GLYPunT5rr0YWOiKrs_HROFi65tf-CasBjMoWqU) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri I have tried but console debug output is too long. How could I redirect it to text file?

[22:07:29](#KRIN44mjYicMCEnzX4EFWfAy4VSoWwvQ7r0PjaefYxY) <GiuseppeChillemi (GiuseppeChillemi)>:
`b` is the following:
```
b-ok [
	connection: open make port! [
	    scheme: 'odbc
	    target: "driver={SQL Server};server=DIBI2012\SQL2014;database=ADB_RAVIOL_DORO;uid=*********;pwd=********;AutoTranslate=yes"
	]
]
```

[22:15:21](#WBWHwGPaTMSHqvyYjBrvZ6-dOjT7yH2qWsSU-cZzAd8) <GiuseppeChillemi (GiuseppeChillemi)>:
This is typewriter mode:

https://i.imgur.com/s25sMqi.gif

[22:15:55](#jgvpOyDACjNrk092E0X9nCguJzDqxqAdMX2FLkewIao) <GiuseppeChillemi (GiuseppeChillemi)>:
(Note the sudden crash at the end)

[22:41:22](#wUvTQAyGdR6j8EL6tm7fbcgB7lt4jzpAvZ7gCYoKcus) <GiuseppeChillemi (GiuseppeChillemi)>:
Using copy&past I have captured the following: https://gist.github.com/GiuseppeChillemi/7072a84f997b9092e93601bc6056a6ad

[22:41:28](#t6CH9_fWZE2C42dgt4jpzYGPNl8BXSRGcCTJjLlnLz8) <GiuseppeChillemi (GiuseppeChillemi)>:
* Using copy&paste I have captured the following: https://gist.github.com/GiuseppeChillemi/7072a84f997b9092e93601bc6056a6ad

[22:41:50](#D8W6WqI1aotp-47UFWCWSHAyZ52VkAfoBjUhriDVe9Y) <GiuseppeChillemi (GiuseppeChillemi)>:
* Using copy&paste I have captured the following: https://gist.github.com/GiuseppeChillemi/7072a84f997b9092e93601bc6056a6ad , more when I will know how to redirect the output of the console to a file.

## 1-Apr-2022

[4:23:25](#qlZy-r25jGQs3iJ13AfGS_2EdG9yfgB_yeIKJb8WLjY) <toomasv>:
Conversion problem. Codes should be converted to integers first:
```
>> to-char to-integer #{c0}
== #"À"
```

[12:51:40](#bca5ANYsxnCYqDMDDUfzp6L_Ujl8Fq8XkFsHFyyormo) <gurzgri>:
@toomasv Kind of.

[12:56:04](#-7o14Wa3lBlYOLnxDQ1j1sNsV_14P4Y9o92yO-S1nQI) <gurzgri>:
I erroneously wasn't using the unicode SQLGetInfoW in favour of SQLGetInfo. With the wide version no conversion is needed on Red's side, it can just `string/load` from UTF-16LE encoded buffer.

[12:59:17](#U1nMDzlcrJl2xiOvEaJ087hqscuXco05miQ0zNy4nWU) <gurzgri>:
@GiuseppeChillemi Pushed a fix for that. Would be great if you can test it with and without AutoTranslate to see if makes a difference (it shouldn't, I'm attempted to say) and report back if this gets you over the "about-connection" step.

[13:00:18](#cRV4e4vOZToRgexzT6rwkfVk-uquXx8oBaXfw-EQvOg) <gurzgri>:
* I erroneously wasn't using the unicode SQLGetInfoW in favour of SQLGetInfo. With the wide version no conversion is needed on Red/System's side, it can just `string/load` from UTF-16LE encoded buffer.

[13:02:37](#yodvPQoufXYy3XRmB5BiY-DmEBuDnqc5Ibb9564Xf38) <gurzgri>:
* I erroneously wasn't using the unicode SQLGetInfoW in favour of SQLGetInfo. With the wide version no conversion is needed on Red/System's side, it can just `string/load` from UTF-16LE encoded buffer. Thanks anyway!

[16:38:06](#3OrO1v1xN5ILDAQ3B_mHhbJXUqc9TAZ6zok2Wc-4MLg) <GiuseppeChillemi (GiuseppeChillemi)>:
It seems the connection has been established. Now I will compile the console with no `--debug`. Typewriter mode is still there, so I can't use the GUI.

[16:38:22](#QZt4Z2e26snTQ7tvqoj4ez_cd77rf7F5oMzEBAxBqGc) <GiuseppeChillemi (GiuseppeChillemi)>:
* It seems the connection has been established. Now I will compile the console with no `--debug` and try some queries. Typewriter mode is still there, so I can't use the GUI.

[16:43:02](#3iqQJqcHi9q4VOJvkJCA56JO-kIaPRBeHMaGTPs7afQ) <gurzgri>:
:+1: You might even want to rename a --debug enabled console, than you can try in both versions easily if you run into problems again.

[16:43:28](#7yoWseRhu288EZ4eriI-CLwBGe71tlNh37TLpF8URu0) <GiuseppeChillemi (GiuseppeChillemi)>:
Already did it

[16:43:46](#xALYOikVuXWl273rKBVulg63lRfwYTlaPIDUFf91AnE) <gurzgri>:
clever ������

[16:44:44](#Ake21SoaZGco90nHRW7iaY9fqrSEahDZhnU3AygaR4Q) <gurzgri>:
"typewriter mode" I haven't addressed yet, but I might have an idea what's causing it.

[16:48:39](#dpwmHhmxtaOjv1P4AU0aGefUWnaejn7gVDWwgy1zNhs) <GiuseppeChillemi (GiuseppeChillemi)>:
Is a statement an object with connection as a proto? I see they have the same words

[16:49:00](#CyGPlEcUpTl5jI2chk64yAV9MgBtT_TEt48zop51GMQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* Is a statement an object made with connection as a proto? I see they have the same words

[16:50:26](#INCVsO3X12DtqTbjlqRqw6OCADc2mPHYpyzPMSQsMOA) <gurzgri>:
no. statements are statements, connections are connections. but they are both ports, that's the common denominator.

[16:55:41](#4ywIp31ug7PRIcJ62AEpsoO8GolfyWfCjH2MGyP3H9o) <GiuseppeChillemi (GiuseppeChillemi)>:
I have the first result

[16:55:45](#yo4VD6CRmsXQl4zMWA82V3zZ0XT-hGo_iGcpgj96M8I) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have the first results

[16:58:54](#ZoC4Gg0RMhESqHz2rF3XuiT1_N7dS0-ouAlx4uaOU8E) <gurzgri>:
������ Congratulations!

[16:59:06](#CiVi-zfQ5Q7U_FYMKF55co_gK9-sVAggnF0iZG8-vYI) <GiuseppeChillemi (GiuseppeChillemi)>:
Please add to the following part of the documentation that "inserting a statement" you receive the column names as result and to get rows you have to use copy ������

```
## Inserting Statements, Retrieving Results
The following example should give you an (informal) idea on how SQL statements are
executed.

You execute a SQL statement with `insert`:

----
insert statement "INSERT INTO Languages (Name) VALUES ('Red')"
== 1
---

```

[16:59:47](#nE4pmrF1xUug9BBJuKyDwrNDyF6P6AzkNTYPp6xcLQY) <gurzgri>:
that's there already

[17:00:04](#Dm2pbjYzhtLM8KR8rp3BlZjIq8vM2xYC6QLl6ccHIgA) <GiuseppeChillemi (GiuseppeChillemi)>:
I have thought that I was in front of another bug when looking at the columns, then  have moved on in the documentation!

[17:00:09](#FkhdGaWSy3OrqRpTABAYxbCq7nQGXpQFnvnPm6r0wg0) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes but later.

[17:00:25](#mU-h527bMIl8y4lDOwY9BRazAn-ZGaNBpXtzClf23xs) <gurzgri>:
Yes but later. Sometimes reading comes first.

[17:01:03](#43IjQs8RomxR4Mps0cplgsG7I5Axdabk-SvP8IH5mbA) <GiuseppeChillemi (GiuseppeChillemi)>:
When you insert a query you expect to receive the query results!

> Yes but later. Sometimes reading comes first. 

������

[17:01:40](#wX-zB0vFBGvD1qJ5V1L6CkiyGJo8x3_PjwEtg6Bu4dk) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, let's start with a massive task: "select * from table" (100K rows)

[17:05:34](#M_RNbYiuqWWnooJrXcZs0x6l7FyIJd9LM95SgpbHxU8) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri 

>> insert st "select * from dotes" probe length? copy st
HY090 0 [Microsoft][Driver Manager ODBC] Lunghezza della stringa o del buffer no
n valida.

Translated: "Invalid length of the string  or buffer"

[17:08:40](#qvZLF-FxAR8NU_Tu2PsvWmKtmqXdSXBoyYWG82OzLS4) <gurzgri>:
for 100K rows, `statement/state/window` and `statement/state/flat?` will be usefull.

[17:10:25](#1YnU51dCEd-hn0PSTVUWQFoCp0jyBhqFzqpmBfM8F1M) <gurzgri>:
Try to figure out which column is causing this error and post `probe statement/state/columns`.

[17:12:32](#e6EaLZ6BE-SXqCORkrm2QDI-KIJ0pBf_tFq9BLWQdhA) <GiuseppeChillemi (GiuseppeChillemi)>:
`../window  -> 10`
`../flat= -> none`

[17:12:56](#VDj-zdBn11kXDvh0B--5DkOScE7dyT1XieubnIJbHOY) <gurzgri>:
consult the documentation please

[17:14:29](#bO0PMUZsZkqwgN7gtn_fiQTALHob_x96QBpRwtZmKQY) <gurzgri>:
And don't try to work with BLOB columns and such.

[17:21:00](#xMeCUym3n9Ljqc3JppiGLKB2-yj-IWDj63nG51uvvjU) <gurzgri>:
The HY900 error _might_ origin in column to large for 32bit Red, resulting in a negative length.

[17:21:21](#nyFHa1uCIX7EcUGyGsE7EryZTcbVnb-Su87NdLdcMUc) <gurzgri>:
* The HY900 error _might_ origin in column to large for 32bit Red, resulting in a negative buffer length.

[17:22:54](#ArQmTsTBwyl7UQu-CMnPgMlPPkt0pQGZ3ADmnKvtQAc) <GiuseppeChillemi (GiuseppeChillemi)>:
I have queried the table columns of the company ERP, they are 108. 

[17:23:28](#X5v5YspTUEbm8FnE8gxDY1N_5wndZ6kFmZlrM2AyCjY) <GiuseppeChillemi (GiuseppeChillemi)>:
I wll try to find which is failing

[17:23:50](#uqcFXajAu3pljzzf_R8llFTCrDI1mlobLSwaMIkVaUQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have queried the document table columns of the company ERP, they are 108. 

[17:25:31](#0jdfW4YQ6ahgpfU5CGxmUxkAKJlmWldZKEVX3qec3rc) <gurzgri>:
Start small with things working and move forward from there.

[17:35:32](#3dXD-RSlCoDy6MARKETK-Ixo_DtooXUm2z68-4S2M4E) <GiuseppeChillemi (GiuseppeChillemi)>:
I am using a small table with fewer column. Getting data with `copy`, I receive: 
```
"01004 0 [Microsoft][ODBC SQL Server Driver]Troncamento a destra della stringa di dati."
```
Translation: Right trunction of the data string



[17:36:05](#QYh2YBDpu4eABdM6P99UhGYjk5YCo1XHOzAyMwFPuCY) <GiuseppeChillemi (GiuseppeChillemi)>:
> Start small with things working and move forward from there.

Yes, I will do this

[17:45:08](#CviAGYKSZDL60tKjxauYERWYc-1vLg9wyT3YzVeNYnk) <GiuseppeChillemi (GiuseppeChillemi)>:
Please, if you know how to output the debug console text to a file, let me know;:it would be really useful.

[17:45:18](#uy90E1SK5I7S0ZRTW8fcaJ7OKmgVe0M0tGIRVyB6vY4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Please, if you know how to output the debug console text to a file, let me know: it would be really useful.

[18:08:08](#GUEXreC94OGZwL8xX1fF9uA2vX4IQm2PSdwJFQamjrM) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri 
This is the failing column:

[18:08:19](#-g2dk08nL5cObWXIToCrw3NQpMM5I-1OFdxfifLmEKI) <GiuseppeChillemi (GiuseppeChillemi)>:
[![image.png](https://files.gitter.im/6234feab6da037398492a62a/9MJg/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/9MJg/image.png)

[18:08:45](#G3QC-IdN1GiLgt41cath0SSWMhXyyzhCQJqis9kSwLs) <GiuseppeChillemi (GiuseppeChillemi)>:
It is an XML datatype

[18:22:26](#dRzcttkLwQU5cxwxHBpJCXQRUMWDOmMv9CTS22o3zJ8) <gurzgri>:
Length -1. The SQL Server XML datatype might be up to 2 GB big. Negative column widths, I don't cater for this. Can the column be casted to varchar of a length Red can handle? 

[18:30:40](#yfbZQ0wFS9DIpMFvNCWamUPFdwFvk8hubXkzhu_Mru4) <gurzgri>:
I don't know of a way to log console session into a file. I'm using Powershell 7.2.x in Windows Terminal which is nice improvement over the old cmd.exe, copying all text in a buffer of adjustable size there is done with some double clicks + Shift key. 

[18:32:21](#_cDuL0yuBRwwgkQdFsJCrY22eoFpAKNkYUKc6dpIvb0) <GiuseppeChillemi (GiuseppeChillemi)>:
This works
` cast(NoteXML as nvarchar(4000)) `

[18:33:15](#_EaR66l9A2Hq6DSGX-QgTZMjOmywRRCtca7V3dR92Uc) <gurzgri>:
Sth. like `select cast(NotesXML as varchar(128000)) from ...` or whatever syntax SQL Server requires.

[18:33:31](#M_xkK665nStdyo_elx5JrjhudAGAJ9tcQeBzrrt4P80) <gurzgri>:
Same idea :)

[18:33:42](#Y0HBzvwXvKu5WmB7nki3KKuxttvwl93wtBYq1HBkIec) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes :)

[18:36:37](#5WjXBQm9jn8R_f_xCJxOuVemMguMiswel3dU9H396uc) <GiuseppeChillemi (GiuseppeChillemi)>:
Using this:
`cast(NoteXML as varchar(8000))` 

I get `invalid utf encoding` again

[18:36:57](#ZOkTVE9CFK_MLZzz6zMJoiH3OUv3Xv_1KtG59bxSTGw) <GiuseppeChillemi (GiuseppeChillemi)>:
* Using this:
`cast(NoteXML as varchar(8000))` 

I get `invalid UTF encoding` again

[18:49:03](#zuf28Fx1ULi0aFpOv9XPPyRAM_ira7-IjbtX2GT51xk) <gurzgri>:
Cool. Then invalid UTF encoding is to be considered an improvement here. Do you get this with sth. simple as in
```
> stmt: open conn: open odbc://whatever
> insert stmt "select cast(NoteXML as varchar(2000)) limit 3"
> probe copy stmt
```
and how do the column buffers look like in --debug mode (the hex dump debugging output) look like?
"Normal" italien text columns (varchar) are ok?

[19:00:30](#DZfOdVoAbjzgNN6COlmDPrnZ4ovQhgWx9pZ7HcstPvA) <GiuseppeChillemi (GiuseppeChillemi)>:
"sth" stands for?

[19:00:41](#QTw9W98pfGT0LTE0-__mRCMPYTdElffr3xfBB98Ukmw) <GiuseppeChillemi (GiuseppeChillemi)>:
* "sth" stands for..?

[19:06:51](#PFKlidqE5Apws5OCHVyE3jwP2aiX4eYa2bLjnrqLJbM) <gurzgri>:
for ... "something"

[19:07:49](#OVdvu6iLiy74JDe1Uf5PNSMgr1IyYAdPJ5mhr3m3d78) <gurzgri>:
https://dictionary.cambridge.org/de/worterbuch/englisch/sth

[19:12:13](#ba7BKKcliARy2YgV9bOvcJuWZwC3kZBBSCih96Yvh-k) <GiuseppeChillemi (GiuseppeChillemi)>:
https://gist.github.com/GiuseppeChillemi/67e337ff745c96b7975c733df7079abf

[19:12:44](#6BWVhj6Z8_gnqrYYfLagqYF5DZ9jO2BRokZp6OMARIM) <GiuseppeChillemi (GiuseppeChillemi)>:
Here is the result of the query:

`select cast(notexml as varchar(8000)) as n from dotes where notexml is not null`

[19:13:02](#Yzroq5bhZKSnApUW1xA1V0Cxm-bOmvi9Lkb5ja9VckU) <GiuseppeChillemi (GiuseppeChillemi)>:
(As n not needed, forgot to delete it)

[19:13:13](#23lCZGViLlmFMjjQIWS9QtKOCkzCXxxW3e3bIlsLJ1M) <GiuseppeChillemi (GiuseppeChillemi)>:
* (`As n` not needed, forgot to delete it)

[19:13:23](#ZAisE82bvzyB18YEBjXjnr0u85lBQhXXWFjxibRjsVE) <GiuseppeChillemi (GiuseppeChillemi)>:
* (`as n` not needed, forgot to delete it)

[19:15:30](#F2yMqQU6_9I2eRwy8o0tsg4bRGjk2T4pHQe5gvWSRLE) <GiuseppeChillemi (GiuseppeChillemi)>:
> I don't know of a way to log console session into a file. I'm using Powershell 7.2.x in Windows Terminal which is nice improvement over the old cmd.exe, copying all text in a buffer of adjustable size there is done with some double clicks + Shift key. 

So you run Red debug console in powershell? If yes, how can I do this?

[19:22:39](#kS1w7_iQ7F6kpDbcEK1dS1N8EMpu6ydJU3e19ckOLcs) <gurzgri>:
[![image.png](https://files.gitter.im/6234feab6da037398492a62a/379B/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/379B/image.png)

[19:23:10](#Th-Dz2GZdezkI5YTZ8Vl7Gl6R49SFOZz0Eeki_jdHh4) <gurzgri>:
[![image.png](https://files.gitter.im/6234feab6da037398492a62a/379B/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/379B/image.png)

[19:24:19](#3RTNDcUqOg-3Qqj7JgwTgExA7GX1epFH4ujVLcoLIjE) <gurzgri>:
https://www.microsoft.com/de-de/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab

[19:24:30](#xF_zr2nrsKZOr2_RaOS5tkTmrq3Rtajy1fmNV0TAD8s) <GiuseppeChillemi (GiuseppeChillemi)>:
I have also found way to crash the debug console:

Running this script multiple times, the console crashes

```
do %script.red

  cn: switch 'b-ok con
  st: open cn
  st/state/window: 100000
  insert st rejoin ["select cast(notexml as varchar(8000)) as n from dotes where notexml is not null"]  copy st

```
(Note: every run ends with the odbc error)

[19:24:46](#A8inSDF1FVqz7h_j3aboroxZJqyA3VH1xd4ANADB-EQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have also found way to crash the debug console:

Running this script multiple times, the console crashes

```
do %script.red

  cn: switch 'b-ok con
  st: open cn
  st/state/window: 100000
  insert st "select cast(notexml as varchar(8000)) as n from dotes where notexml is not null"  copy st

```
(Note: every run ends with the odbc error)

[19:25:15](#WQhwTsbOB5TwIvtL50QCwGGYhFyQQyFejX612al_xNg) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have also found way to crash the debug console:

Running this script multiple times, the console crashes

```
do %script.red

  cn: switch 'b-ok con
  st: open cn
  st/state/window: 100000
  insert st "select cast(notexml as varchar(8000)) as n from dotes where notexml is not null"  
  copy st

```
(Note: every run ends with the odbc error)

[19:25:42](#CG43wEwdCkJ6EHdxPlH5VuQO0uAF9vBh-ltHBcNaPbY) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have also found way to crash the debug console:

Running this script multiple times, the console crashes at about forth or fifth

```
do %script.red

  cn: switch 'b-ok con
  st: open cn
  st/state/window: 100000
  insert st "select cast(notexml as varchar(8000)) as n from dotes where notexml is not null"  
  copy st

```
(Note: every run ends with the odbc error)

[19:32:01](#wlU8kn0icTPPfzA0msnkrq-SjzlORxsCWdF9Wqy6UVQ) <gurzgri>:
re: your gist, geez, sorry, I remember having disabled the column buffer hex dumps when things started working, because they only made debugging output impractical big. For that to reactivate, you would have to uncomment the lines 2061 to 2070 in %environment/schemes/odbc.red and --debug recompile.

But do you have normal text columns and do these work?

[19:40:49](#rD3LMeVll2ptqA94vqDNeW0hBnKFgRGOHL2IgRSk_oU) <gurzgri>:
For the NoteXML column there probably happens no conversion to wide string and R/S again tries to treat no unicode data as unicode string data. Hopefully for other string/text colums that works. It does work with other databases, pesumably PostgreSQL, per my own tests and tests of @bubnenkoff  

[19:44:32](#K1VBp2p3pIC-Tv_nqnVNAFx4enPIm1joMZc5fquPdKk) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have also found way to crash the debug console:

Running this script multiple times, the console crashes at about forth or fifth

```
do %script.red

  cn: switch 'b-ok con
  st: open cn
  st/state/window: 100000
  insert st "select cast(notexml as varchar(8000)) as n from dotes where notexml is not null"  
  copy st

```
(Note: every run ends with the odbc error)

[19:44:33](#7zsmef16ETIaqRIQoLAJ-nOqJKAqpi7K58apHhYfrws) <gurzgri>:
Probably due to the errors, some housekeeping stuff might not get cleaned up. That might require stress tests on its own. I'd rather get the basic functionality right.

[20:02:51](#D677G9c5yGRfTxSHGmC3LJ2ebGdpi22VzAZ27PkpTak) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have also found way to crash the debug console:

Running this script multiple times, the console crashes at about forth or fifth

```
do %script.red

  cn: switch 'b-ok con
  st: open cn
  st/state/window: 100000
  insert st "select cast(notexml as varchar(8000)) as n from dotes where notexml is not null"  
  copy st

```
(Note: every run ends with the odbc error)

[20:02:53](#Q81BmOt0iFMFZ1AvzPw9gtZ9dBatY7_aPiKnLWLVWlo) <gurzgri>:
...  functionality right _first_.

[20:12:02](#9LEh58JTFBdO27j6en3P-KHBca-YpT9pp_mOfmTw40M) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have also found way to crash the debug console:

Running this script multiple times, the console crashes at about forth or fifth

```
do %script.red

  cn: switch 'b-ok con
  st: open cn
  st/state/window: 100000
  insert st "select cast(notexml as varchar(8000)) as n from dotes where notexml is not null"  
  copy st

```
(Note: every run ends with the odbc error)

[20:12:03](#EUT30i-2LgMMkz2xE8VXX9nKBgfiXUQ7OWalz0h_hpI) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, that was also a first stress test attempt

[20:25:57](#QURv345RtZk5wzxDF9Zd5C59xSJnw6mFWoYPUp2wdAo) <GiuseppeChillemi (GiuseppeChillemi)>:
> But do you have normal text columns and do these work?

I have just tried, they do not work

[20:43:41](#vOYfrwaZ7dIwSGfRGgYoISpOGcq90tlGhP3JOYte4cM) <GiuseppeChillemi (GiuseppeChillemi)>:
Here is the gist using a text column as output
https://gist.github.com/GiuseppeChillemi/81a15c08f9bc9b575742ee6dbe05ab30

[20:43:48](#5buion7k5H3e0hI8JJP-q_XqGwG2ICco9mELlkyFuno) <GiuseppeChillemi (GiuseppeChillemi)>:
Do you need a caste XML too?

[20:43:56](#RQ56PbyhIC521nJMR0QPBvaQ4MTE0c2G79dUkPl5iOQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* Do you need a casted XML too?

[20:46:04](#LWJYzeh4nafvDRbQGSVmPBnXLp3f4dhCQ86eEC_90MY) <GiuseppeChillemi (GiuseppeChillemi)>:
Here is the same string from the 2 sides of the coin:

"C.I.A. COSTRUZIONE S.R.L.ùàòè+ì'-.,!---" <----- From Dump
"C.I.A. COSTRUZIONE S.R.L.ùàòè+ì'-.,!---" <----- From application frontend

They seems the same to me.

[20:46:28](#Zz7ZVKm8O2jX-4jzkoHoUwDSEE8FnG1JBXBnlNt4l-g) <GiuseppeChillemi (GiuseppeChillemi)>:
* Here is the same string from the 2 sides of the coin:

"C.I.A. COSTRUZIONE S.R.L.ùàòè+ì'-.,!---" <----- From Dump
"C.I.A. COSTRUZIONE S.R.L.ùàòè+ì'-.,!---" <----- From application frontend

They seem equal to me.

## 2-Apr-2022

[9:24:56](#jdYNvnIJ-tZZmP3jcLDytKGN_p9pmH9rEoVB_5POzLg) <gurzgri>:
They _are_ equal, that's the root of the problem. In the buffer, they need to be UTF-16LE encoded, they were latin-1 encoded.

[9:30:05](#Pj2Uj4Rlr2Se4T6r2LnlhkF29pJyRCGosGnR6O0s-8o) <gurzgri>:
@GiuseppeChillemi Pushed fix [ed03b3e](https://github.com/gurzgri/red/commit/ed03b3e99de53d72502d6c3978a653f3b556c8f0) for this. That should fix your `cast(notexml as varchar(8000))` case, too.

[10:32:07](#pFgJq0mozCo9-enBNv6Dk7o2ltX2SD6gegKWC9OKbng) <GiuseppeChillemi (GiuseppeChillemi)>:
I will try and report

[10:34:20](#vG8vV1W--nDfOYOgIxeD1-UxYImc1msAKgx_x49Vo_4) <GiuseppeChillemi (GiuseppeChillemi)>:
Just a question: will you support BLOB fields? I would need them to manage pictures and documents (pdf, word) stored in the document management system.

[10:44:19](#oIpeLdS1lpoos0unE1KrUeLtknlFXJt0Y2AJGHkeyAA) <gurzgri>:
No, I won't. That doesn't fit well with Red being 32bit. It won't fill into the API as well. I can image some special means to fetch BLOBs from a given column one Red supports 64bit, but even then BLOBs won't ever be fetched together with normal columns.

[10:44:33](#2lzuY8yK2bUg9wl5E1oJROFV-Wo3KZissS_gXf9t_w0) <gurzgri>:
* No, I won't. That doesn't fit well with Red being 32bit. It won't fit into the API as well. I can image some special means to fetch BLOBs from a given column one Red supports 64bit, but even then BLOBs won't ever be fetched together with normal columns.

[10:53:23](#-5Tub1mxu65vAUggtzGWAeyeal8OuuZhFI7_vw6PtMg) <gurzgri>:
But ((long)var)binary are supported already. Maybe your documents fit into these types already if they aren't too big. You are the one using SQL Server, so you shoud know how big LONGVARBINARY can get. The 1^32-1 limit might apply here, because Red and R/S have no unsigned integers. 

[12:02:35](#8GZYcDiMwBv4zanDDNLJ9FwDCrZ5xrD8SiM8JrpNbsI) <GiuseppeChillemi (GiuseppeChillemi)>:
I know that this limitation comes from Red not being 64bit. Also, I know that in 100% of my data is below the long unsigned integers range as documents and pictures have 90MB maximum size, so are near all database installations I have met in my life in the ERP field.

[12:03:27](#BeT3kVzwhdws0z_ndtt8A13Eoe5u8acgbEAgqtBoTF8) <GiuseppeChillemi (GiuseppeChillemi)>:
*long signed

[12:05:33](#kqyafNSDsZ_Tf5bg_OoTzwhu36YEEE1aPvrTxwkiAdQ) <gurzgri>:
Then chances are the current implementation will alread work your you.

[12:05:54](#jkWo0pTa6M_1ZU3HF4I3BK7aD-e5FDshGlfc9KYbdLo) <GiuseppeChillemi (GiuseppeChillemi)>:
Would be possible to implement support for blob up to signed integer size and when it is over the maximum range return an error a conventional field value meaning "overflow"?

[12:10:43](#GwT09u-funQvwHxamyhUsSpV0BxndHOxoW8NHc2BYNA) <gurzgri>:
Commit 122d3db might fix your typewriter.

[12:12:25](#yH6ddUEdeUuRxWXtL1eyLqMLxZN8pwyqNn_UEXhV0WQ) <gurzgri>:
Of course it would be possible. It's just not a priority.

[12:18:25](#Ssqe32GrdVa4nhxPgrGZvrs2NB-FMr0rZndWFSuMXeQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Let's wait, in the meantime I'll start creating some "toys".

[12:36:14](#zt5PwB1tHJVNmQFkc-RaGr5fa8Ip-n6DRb8beh_99bs) <gurzgri>:
I can imagine returning a value of type `error!` in such a column, that could proof as a viable solution for other cases where no conversion is possible. But it wouldn't help you anyway, because given your NotesXML column, a buffer of size `statement/state/window * (2^31-1)` would have to be allocated in advance anyway if you don't limit the column size to something sufficient and more reasonable. The buffer would have to be allocated to that size before starting fetching rows into. Because before fetching the actual column values there is no way to know it's actual size in a particular row. Hence the above "it won't fit into the AP" well. What would be required here would be a way to retrieve a single BLOB without allocating a row buffer for that column. Far from impossible, but no priority and no plans for that.

## 3-Apr-2022

[21:54:51](#sprPYbchkdHoHUehnQx9VnW3QtrpKr0fJ1Yf5OtXs2o) <GiuseppeChillemi (GiuseppeChillemi)>:
Something wrong here:

```
>> do/args %red.r "-r --debug %environment/console/CLI/console.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.6.4 ===-

Compiling C:\xxxxxxxxxxxxxxxxxx\Red___ODBC\red-odbc\environment\console\CLI\console.red ...
...compilation time : 5275 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: unknown identifier in literal array: native
*** in file: %/C/xxxxxxxxxxxxxxxxxx/Red___ODBC/red-odbc/environment/schemes/odbc.reds
*** in function: exec/odbc/diagnose-error
*** at line: 2927
*** near: [[" " native " " lf]
    print-wstring as c-string! message red/platform/prin* [lf]
]
>>
```


[21:55:09](#Bd53bk7I3GbJjyJEfUri2fOGLd7FCOjAJ7CAIaAOha0) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri
Something wrong here:

```
>> do/args %red.r "-r --debug %environment/console/CLI/console.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.6.4 ===-

Compiling C:\xxxxxxxxxxxxxxxxxx\Red___ODBC\red-odbc\environment\console\CLI\console.red ...
...compilation time : 5275 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: unknown identifier in literal array: native
*** in file: %/C/xxxxxxxxxxxxxxxxxx/Red___ODBC/red-odbc/environment/schemes/odbc.reds
*** in function: exec/odbc/diagnose-error
*** at line: 2927
*** near: [[" " native " " lf]
    print-wstring as c-string! message red/platform/prin* [lf]
]
>>
```


## 4-Apr-2022

[20:41:26](#blYH1X90zA_1e3rpn-FRel5ZYcWEjvksnipFMHrenww) <gurzgri>:
@GiuseppeChillemi Thanks for pointing this out. Pushed ae47d3: FIX: fixes regression introduced with commit 122d3db.

[21:00:15](#KzrjhRYJoUbS_N4yiFcqFkXfT1_S-UvWTSuWAUJKvCg) <GiuseppeChillemi (GiuseppeChillemi)>:
I am trying it immediately.

[21:19:29](#yvxdNQchX4460Q-bkePC-ZojEMbrwjL1Qz_Jv2BX7Ik) <gurzgri>:
Note that --debug in GUI console will still typewrite. I optimised the non-debug so, that hopefully GUI console is faster.

[21:28:01](#rGyY6N57CqRTYq6oO9nV0XirGAaSgUqTgdUdcXtO0hs) <GiuseppeChillemi (GiuseppeChillemi)>:
GUI Console does not typewrite anymore

[21:28:28](#wuwfFKVO2sypIq6FAf7UB5BVRgEjJYbwh9gAjADHDJM) <GiuseppeChillemi (GiuseppeChillemi)>:
Also, the connection has worked flawlessy. I can see the text fields

[21:29:00](#eoOuYgqrFMq6vpb68YDeCHbsgErGY97WSUIEQ8fcOXg) <GiuseppeChillemi (GiuseppeChillemi)>:
`port=1433` seems to not give error anymore

[21:31:54](#9oqU88BA-Y6Win0e7wYvtqwy55kDMaMKcTe99pUMUNw) <GiuseppeChillemi (GiuseppeChillemi)>:
This: `d-DNS2 [connection: open odbc://RD32]` is now working

[21:33:25](#cxo8--2LH3EkN8I6UolnzOaYMKGG3Rale98lkeIhjoE) <GiuseppeChillemi (GiuseppeChillemi)>:
This
```
c-DNS1 [connection: open make port! [scheme: 'odbc target: "dsn=RD32;AutoTranslate=yes"]]
```
and
```
```


[21:33:47](#2CHbYxg_kCOB_2OTsC2xfj30bw_kJc7naWJ5HBsoBUc) <GiuseppeChillemi (GiuseppeChillemi)>:
* This
```
c-DNS1 [connection: open make port! [scheme: 'odbc target: "dsn=RD32;AutoTranslate=yes"]]
```
and
```
c-DNS1 [connection: open make port! [scheme: 'odbc target: "dsn=RD32"]]
```


[21:34:07](#yCrCxx-Kq3wMqLg_aaTPobP4kvQI7JUmv9fjHKLpBBk) <GiuseppeChillemi (GiuseppeChillemi)>:
* This
```
c-DNS1 [connection: open make port! [scheme: 'odbc target: "dsn=RD32;AutoTranslate=yes"]]
```
and
```
c-DNS1 [connection: open make port! [scheme: 'odbc target: "dsn=RD32"]]
```
Do not work!

[21:36:38](#e7pjaG-JO_qXZSDYzeb_jLFsY3GphK3NWCl1GxDv1bU) <GiuseppeChillemi (GiuseppeChillemi)>:
Also, I have run the script many times and the console has not crashed at all.

[21:37:46](#djiPhwAwXv3zPMIpkXU3a8KJYbEX3dWT9oMIC0-FmlE) <GiuseppeChillemi (GiuseppeChillemi)>:
* This: 
```
d-DNS2 [connection: open odbc://RD32]
``` 
is now working


[21:37:59](#lLen5e-ZGR6LXbAipKZe_c5XqKFm88C80dW1Bla3Azk) <GiuseppeChillemi (GiuseppeChillemi)>:
* This
```
c-DNS1 [connection: open make port! [scheme: 'odbc target: "dsn=RD32;AutoTranslate=yes"]]
```
and this
```
c-DNS1 [connection: open make port! [scheme: 'odbc target: "dsn=RD32"]]
```
Do not work!

[21:38:11](#yVRc53DRWHMRpzASUIruyQcfNgPfqeZHKDY9tkAl9vQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also, I have ran the script many times and the console has not crashed at all.

[21:38:26](#61cUt3D_S1SuLuNUPmca47A4MJOVnOBXElDg5OYzgXQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Great Work!

[21:44:41](#31xlW2u8jsPiVUclWzJzuQcNsnJcXXKP49FfyhmuC1o) <gurzgri>:
Thanks ������

[22:04:14](#RKOjppqNxC2a3LUC1SLvObgCzpzJxJHLVOkzgKr2uTU) <greggirwin (Gregg Irwin)>:
Indeed!

[22:04:16](#_DkBDxWxI_fi6sTaxkt-JqZx7Dp4zNMKaAQAROEiWio) <gurzgri>:
The `target: "DSN=<dsn>"` form is largely untested. I guessed it should work already, but I haven't really tried this. If you like, open a ticket for this so the info doesn't get lost.

[22:04:35](#GN0tr3LrolphQehCoVABjiv3KS_XCWAZl0tDVv2KPVc) <GiuseppeChillemi (GiuseppeChillemi)>:
```

cn: switch 'b-ok con
st: open cn
st/state/window: 100000

insert st rejoin ["select cd_cf , descrizione from cf"]  a: copy st

cn: switch 'b-ok-notranslate con
st: open cn
st/state/window: 100000

insert st rejoin ["select cd_cf , descrizione from cf"]  b: copy st

probe exclude a b 
```
Result:

```
>> do %odbc-test.red
[]
== []
```


[22:05:50](#YjU-SLLUQNajE3ofXTN9zOyFWl2Jf12NwNWrwSsdpjM) <GiuseppeChillemi (GiuseppeChillemi)>:
The same using `autotranslate=no`

[22:06:01](#fI340zZpL6CVk79UhGBpORW4KQw8FY_OrlquO2KrXPg) <GiuseppeChillemi (GiuseppeChillemi)>:
Results are equal

[22:06:03](#SEc2FmR9g8V4s3rZpJxBnUQSTEcBx3Qejto42o24s_U) <gurzgri>:
@GiuseppeChillemi That tells me nothing. `probe st/state/columns` might give some clues on the SQL types involved.

[22:06:19](#YFPlP0no2nu1BqiVtNlnAc2zvoAWa5FpHMlh0Cp7_fg) <gurzgri>:
@greggirwin Thanks ������

[22:07:44](#Hw7yluaSd2OcNCcnqYV5wYwRgrJD-W5HnPGxpkHg_ro) <GiuseppeChillemi (GiuseppeChillemi)>:
```
[
    cd-cf "cd_cf" 1 7 0 0 handle! 16 handle!
    descrizione "descrizione" 12 80 0 0 handle! 162 handle!
]
```


[22:07:53](#bR0UXVfqrWNsnFZ5oGcZwfRNrwPS5rMuu0Ql44MDMg8) <GiuseppeChillemi (GiuseppeChillemi)>:
Wait a minute

[22:20:43](#6pTWkH7qJbWL_j5mNxIBi4jTBkicRnglmrCz0TCeMf0) <GiuseppeChillemi (GiuseppeChillemi)>:
I am stressing it...

```
>> do %odbc-test.red
*** Internal Error: not enough memory
*** Where: a
*** Near : a: copy st halt cn: switch 'b-ok-notranslate
*** Stack: do-file
```


[22:21:20](#wedeQaM7g3DlVuh-zKXiOqBTm0GD5LodrmR8pFug8XA) <GiuseppeChillemi (GiuseppeChillemi)>:
```
st/state/window: 1000000
```


[22:22:57](#Uc87B3OU2kvfz3gUiXh6_UTRnZVlfSXIVdOq4-Z1uYw) <gurzgri>:
Easy fix ... buy more RAM (and wait for 64bit Red to be able to address it)

[22:23:08](#wDaPVH6aPVRLmIf41n5lns6diSPVUcSL6Z5BzFepa-g) <gurzgri>:
* Easy fix ... buy more RAM (and wait for 64bit Red to be able to address it) :D

[22:23:14](#qSjp7TD3rBHoBWaAEwuWhDRarHMZn_-jwNC8zFJ07qA) <GiuseppeChillemi (GiuseppeChillemi)>:
I can run the same big query 3 times, then it gives this error. 
By I have "recycled"

[22:23:24](#1YjpUmDQF8mdZLCUssgUIPFbpJLu2bu5HlSLovQfrsA) <GiuseppeChillemi (GiuseppeChillemi)>:
* I can run the same big query 3 times, then it gives this error. 
But I have "recycled"

[22:23:39](#lBr0w4hwZDDlvEXDk2vdMzqU-qGgssVrrh6U5gh1g0A) <GiuseppeChillemi (GiuseppeChillemi)>:
* I can run the same big query 3 times, then it gives this error. 
But I have `recycled`

[22:25:24](#DVyJvpTb7WBaYqM3KfZuJu-Dmu-wyKM6I5YpxoGDNw4) <GiuseppeChillemi (GiuseppeChillemi)>:
Also, I have again the console crash, it is easy: when you have an error on the query (mine was a wrong column name), if you restart the script the console closes.


[22:28:26](#Useu1V3JpRBpSZ4WDPCnuA2SyIOPB73l-gqjREbTmJ4) <GiuseppeChillemi (GiuseppeChillemi)>:
I have tried to run the big query in the debug console to have some output but it crashes at the third run..

[22:32:03](#a97HiHgtPv3DMAKHJ7YW4XFeUZ6UQAijfwoctw2U2sc) <gurzgri>:
An error in handling errors then. In its current (pre-)alpha state that is a somewhat expected outcome.

[22:38:39](#Y_TZVNwL6NSAb8KXfAHuPPq08i04RXEyksPCWeJe4ME) <GiuseppeChillemi (GiuseppeChillemi)>:
I have compared the two big sets, they are EQUAL:
Here you will find `st/state/columns`
https://gist.github.com/GiuseppeChillemi/f5c0304f9a3a408f78ba3a95a50ce464



[22:48:19](#3rSi8sYHqMEACaR6mcSR87F7xHGwevP6iN7ufd8UKQU) <GiuseppeChillemi (GiuseppeChillemi)>:
2 Last notes for tonight:

If I run the same query 3 times with the clause `top 1000` (same as `LIMIT 1000`) I have the `not enough memory error`

If I run the above query 1 time with `TOP 100000` (one hundred, 100 times more) it works. 

It is neither ODBC scheme nor Red being 32Bit  and neither Lack of memory. It is Red not releasing memory because of a some bug.

[22:49:52](#zwaEMPp6BPOLZldVp77YEJ3VtBpIpZwHSILZBHXoIc0) <GiuseppeChillemi (GiuseppeChillemi)>:
* 2 Last notes for tonight:

1) If I run the same query 3 times with the clause `top 1000` (same as `LIMIT 1000`) I have the `not enough memory error`

If I run the above query 1 time with `TOP 100000` (one hundred, 100 times more) it works. 

It is neither ODBC scheme nor Red being 32Bit  and neither Lack of memory. It is Red not releasing memory because of a some bug.

2) If I use `TOP 100000` and `st/state/window: 1500000` the consolle crashes while running the query, and this EACH TIME.

[22:50:23](#LbgJ9W5J1fd8Sa2NWHC7rg1s0zcwJ_KMSGQjAyTSsbI) <GiuseppeChillemi (GiuseppeChillemi)>:
So we have a repeatable behaviour for debugging.

[22:50:29](#bpIf8pGVxww4CIJcqekxIZkD7VWMKYB5bNduudOoIMk) <GiuseppeChillemi (GiuseppeChillemi)>:
Good night!

## 5-Apr-2022

[8:50:13](#GVvWX_BcwXGsJljBHGnysRAl1qy24JNOUbwdwzNm-yo) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri  What about `NULL`? Should I pass it's as (reduce) `none` ?

[8:50:21](#oaj2Q17eM9G3WvYuriSF9HM4AetwuLh7eyKBzxkDP9U) <bubnenkoff (Dmitry Bubnenkov)>:
*  What about `NULL`? Should I pass it's as (reduce) `none` ?

[8:53:23](#PLy4vJsLfpMxdsZ10_vUXxtsWLzkR1uWRaggew_6jdk) <bubnenkoff (Dmitry Bubnenkov)>:
*  What about `NULL`? Should I pass it's as (reduce) `none` ?

[11:31:30](#VgWQ34vOXaCrH0tJMho7gewpiZFElT5X3PJcMM2Kn3c) <bubnenkoff (Dmitry Bubnenkov)>:
If I need add `ON CONFLICT ... DO UPDATE` how I could done it? Simply add after prepared-values? Like:
```
insert snowwhite [
    "INSERT INTO Dwarves (Num, Name) VALUES (?, ?)"
    [1 "Dopey"] [2 "Doc"] [3 "Bashful"] [4 "Sneezy"] [5 "Happy"] [6 "Grumpy"] [7 "Sleepy"]
   "ON CONFLICT ..... "
]
``` 

[11:43:08](#teVy0o1xtfTqeG9imDYRgRGwEAwmX5_cEvNw8ueBm7g) <bubnenkoff (Dmitry Bubnenkov)>:
I tried, but got an error: `Script Error: expected block! not string!`

[12:58:49](#08VNO4diDhQp25KEQJPc4NooCDUSxvJvKx8KHrVZxzo) <gurzgri>:
```
insert snowwhite ["INSERT INTO Dwarves (Num, Name) VALUES (?, ?) ON CONFLICT ..." [1 "Dopey"] [2 "Doc"]]
```

[13:10:12](#fXvbD_-ObpJ4BJAwAmFfzylt8tZ8DmXkCbUANf0IfpE) <gurzgri>:
@GiuseppeChillemi `st/state/window: 1'000'000` memory wise is about the most inefficient way you can come up with when rerieve a million rows: This requires the scheme to allocate a huge buffer of `1'000'000 * total-row-size` and additionally Red has to allocate a block of length `1'000'000 * num-of-columns` and  `1'000'000 * num-of-columns` Red values in this block.
It would be far more efficient to sport a smaller buffer of say 1'000 rows. However, with 'copy' that would still result in a block of length `1'000'000 * num-of-columns` and  `1'000'000 * num-of-columns` Red values in this block.
That's what `next` is for, that way you can "stream" rows, handle the first row set, process that, then `next` to the next row set and so on ... See https://github.com/gurzgri/red/blob/odbc/environment/schemes/odbc.md#retrieving-rows

[13:10:28](#RzB_YRVV42X65R_bUDvP3LuV31MQKrbttWB-ZLR-n6s) <gurzgri>:
* @GiuseppeChillemi `st/state/window: 1'000'000` memory wise is about the most inefficient way you can come up with when rerieving a million rows: This requires the scheme to allocate a huge buffer of `1'000'000 * total-row-size` and additionally Red has to allocate a block of length `1'000'000 * num-of-columns` and  `1'000'000 * num-of-columns` Red values in this block.
It would be far more efficient to sport a smaller buffer of say 1'000 rows. However, with 'copy' that would still result in a block of length `1'000'000 * num-of-columns` and  `1'000'000 * num-of-columns` Red values in this block.
That's what `next` is for, that way you can "stream" rows, handle the first row set, process that, then `next` to the next row set and so on ... See https://github.com/gurzgri/red/blob/odbc/environment/schemes/odbc.md#retrieving-rows

[13:11:09](#txBqmPqcgPqHM7XSu58vOieXc4V6oZNCyN0BNHF1Fh4) <gurzgri>:
* @GiuseppeChillemi `st/state/window: 1'000'000` memory wise is about the most inefficient way you can come up with when rerieving a million rows: This requires the scheme to allocate a huge buffer of `1'000'000 * total-row-size` and additionally Red has to allocate a block of length `1'000'000 * num-of-columns` and  `1'000'000 * num-of-columns` Red values in this block.
It would be far more efficient to sport a smaller buffer of say 1'000 rows. However, with 'copy' that would still result in a Red block of length `1'000'000 * num-of-columns` and  `1'000'000 * num-of-columns` Red values in this block.
That's what `next` is for, that way you can "stream" rows, handle the first row set, process that, then `next` to the next row set and so on ... See https://github.com/gurzgri/red/blob/odbc/environment/schemes/odbc.md#retrieving-rows

[13:11:30](#nC7dYz0OvWCEiW1wpxASE7NXrlSNbI0wI8HeUuDoXQs) <gurzgri>:
* @GiuseppeChillemi `st/state/window: 1'000'000` memory wise is about the most inefficient way you can come up with when rerieving a million rows: This requires the scheme to allocate a huge buffer of `1'000'000 * total-row-size` and additionally Red has to allocate a block of length `1'000'000 * num-of-columns` and  `1'000'000 * num-of-columns` Red values in this block.
It would be far more efficient to sport a smaller buffer of say 1'000 rows. However, with 'copy' that would still result in a Red block of length `1'000'000 * num-of-columns` and  `1'000'000 * num-of-columns` Red values in this block.
That's what `next` is for, that way you can "stream" rows, handle the first row set, process that, then `next` to the next row set and so on a thousend rows a time ... See https://github.com/gurzgri/red/blob/odbc/environment/schemes/odbc.md#retrieving-rows

[13:16:05](#djyLD3i_PZVfZNTfdewxBubrmKmx40WKaOPjm5fo3L8) <gurzgri>:
@GiuseppeChillemi How exactly have you run your "same big query 3 times"? With (pseudo-code)
`loop 3 [open connection open statement execute statement copy results close connection]`
or with `open connection open statement loop 3 [execute statement copy results] close connection`?

[15:20:01](#-qMA3SGLLuj8IWbaPLrVS_DF_g2lcpJwQxbluz1sVPE) <gurzgri>:
@bubnenkoff  NULL is passed as value of type `none!`, i.e. as `#[none]` or the compose/reduce word `none`.

[15:20:18](#p38z85tcSlYx-K_9x56T3dsmW0RUP4FxGiztwZ-3WGo) <gurzgri>:
* @bubnenkoff  NULL is passed as value of type `none!`, i.e. as `#[none]` or the composed/reduced word `none`.

[17:17:17](#EjAggsz7K9CKUFgoQW0sxlm29UM8NvgsKKpQHKTla6Y) <bubnenkoff (Dmitry Bubnenkov)>:
is it possible to generate full plain text sql from prepared statement? I need to display it in UI to get user copy-paste it 

[17:29:30](#xwCNlblzz31pLIDAZlhLKmfgFVjzhd_C2odXV8EHKkg) <gurzgri>:
what have you tried already?

[17:40:32](#qL6NSjBKRU0qB1AgIGoRf1-K0kIeDKNAAQ83P9A1Yw0) <bubnenkoff (Dmitry Bubnenkov)>:
Heh, I already only tried to rewrite old plain-text sql generator (which passed sql to microservice) to your driver, but if you asking it seems that it's possible to do)

[17:47:51](#9pY8s5cSsnx33FjqHJqfT-mB3oiDCeMaS7kSFEzbOn0) <gurzgri>:
Seems like the way to go. I don't even understand where the prepared statement you want to generate full plain text from should come from I not "from you". You're not asking for a way to combine the SQL string and the params / params array to a static long SQL statement without params, are you?  

[17:48:04](#8_dUb6-VbZ0xqzbApvL5TyuH4tPpgX48bbXkUyjUaWs) <gurzgri>:
* Seems like the way to go. I don't even understand where the prepared statement you want to generate full plain text from should come from if not "from you". You're not asking for a way to combine the SQL string and the params / params array to a static long SQL statement without params, are you?  

[18:09:45](#Yme3dTf5qu3JmFnBcha-Z558U_n1aBG7hSCOST6ShEA) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri 
Questions::
* 1.000.000 is the size expressed in bytes or..?
* `Total-Row-Size` is bytes, length (num)
> `1'000'000 * num-of-columns` and `1'000'000 * num-of-columns `Red values in this block 
Havee not undestood, seems the same


[18:09:59](#UAEQj7xqAWQjBM1lfUyVKqGy8Nx6CUJShR1XtCnELUo) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri 
Questions::
* 1.000.000 is the size expressed in bytes or..?
* `Total-Row-Size` is bytes, length (num)
.
> `1'000'000 * num-of-columns` and `1'000'000 * num-of-columns `Red values in this block 
Havee not undestood, seems the same


[18:10:09](#SN2dxtoHK5Vmep5wYeG46OC5efsME7HxigT8gEUYkTE) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri 
Questions::
* 1.000.000 is the size expressed in bytes or..?
* `Total-Row-Size` is bytes, length (num)

.
.
> `1'000'000 * num-of-columns` and `1'000'000 * num-of-columns `Red values in this block 
Havee not undestood, seems the same


[18:12:21](#2NvF7ufizTmOWbH9mNlcVmxJTIEhjU2mtx2jo3k_r0w) <bubnenkoff (Dmitry Bubnenkov)>:
Yes,  I can create SQL (static long SQL statement without params) by string joins and generate insert part as " VALUES ( 'a', 'b', 'c' ) " or can pass prepared blocks like ["a" "b" "c"]
So for example I am creating prepared query, but than want to view it's as "static long SQL statement without params", and if I right understand it's possible?

[18:18:17](#oU95UM2SHQ0iDa1nxfZL5__As8nf93fW8lheN0trpwI) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri 

I do the most horrible thing possible

I repeat `do %odbc-test.red` of the following script never closing the console

```
con: [
	b-ok [
		connection: open make port! [
		    scheme: 'odbc
		    target: "driver={SQL Server};server=DIBI2012\SQL2014;database=ADB_RAVIOL_DORO;uid=*********;pwd=********;AutoTranslate=yes"
		]
	]
]

cn: switch 'b-ok con
st: open cn
st/state/window: 1500000

insert st  rejoin ["select top 100000" sql-cols " from dotes"]  data: copy st
������robe data

```

....until it crashes!

`sql-cols ` is a string with >100 cols 



[18:19:48](#R7ALgUI3sgISLU3ehtDGVQmq9pBr9ZH69EPoPGtCzjs) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri 

I do the most horrible thing possible

I repeat `do %odbc-test.red` of the following script never closing the console

```
con: [
	b-ok [
		connection: open make port! [
		    scheme: 'odbc
		    target: "driver={SQL Server};server=DIBI2012\SQL2014;database=ADB_RAVIOL_DORO;uid=*********;pwd=********;AutoTranslate=yes"
		]
	]
]

sql-cols:  {cols-list} ; (over 100, separated with ",")

cn: switch 'b-ok con
st: open cn
st/state/window: 1500000

insert st  rejoin ["select top 100000" sql-cols " from dotes"]  data: copy st
;probe data

```

....until it crashes!

`sql-cols ` is a string with >100 cols 



[18:40:55](#5pJ4cu3NGKGdlR_D50_ek0UlPFoHtUkGjl2npfAdfh4) <gurzgri>:
You get what you deserve then ������ Seriously, you're not even closing the connection. No wonder uncleared low level buffers cannot be freed, eating all your precious memory. You need to learn to well-behave ������

[18:54:04](#HLuzGm6_5BOQG9y8I3xaBT5zHMXCKXnz9vkSy3OhpLc) <GiuseppeChillemi (GiuseppeChillemi)>:
I did it on purpose. When I betatest  I work dirty so that developers have their code under the worst possible scenery ������. 

[18:54:20](#9OnKImDV3hgnVz7b8x3liuqsrFn0JRwHuwgQT2mF0wo) <GiuseppeChillemi (GiuseppeChillemi)>:
* I did it on purpose. When I betatest  I work dirty so that developers have their code tested under the worst possible scenery ;-). 

[19:39:40](#C_Z8gX8kpIGSdRrm2z2_OAzVc0JDBok0UfH06i86g0M) <GiuseppeChillemi (GiuseppeChillemi)>:
Note: I have thought that reusing St the garbage collector would close the port and reuse memory

[19:46:36](#z-_AEv0me1T0Y_G3FinDijLGROijyb1Wv7kJGYLnbDk) <gurzgri>:
You're NOT reusing `st`. You open a new statement in a new connection, losing access to the previous statement and the previous connection. Hence, these never get closed and can't release housekeeping low level buffers. You can close all statements attached to a connection by just closing the connection.

[20:04:14](#CMunINlMllAqszFZc3wvkogbXvW4h_K3_yAijTWI3Qc) <gurzgri>:
But you probably happen to know a way how to advise the GC (via callback or other means) to call such cleanup routine before really freeing dangling references? I'd be very interested if there is.

[20:13:40](#iI9NMwkKs8xYtJfbSOl-0mRs5i0AEOgdM9HTurGeMSM) <greggirwin (Gregg Irwin)>:
@qtxie or @hiiamboris can probably say.

[20:16:35](#HPuNREgRckZrZ2j36vKHkRh1o9tDEHD8CQidbXxnqiM) <gurzgri>:
@GiuseppeChillemi Yay! Obviously you hit a nerve recently and got me thinking ... And when I woke up on sunday morning, suddenly everything has fallen into place and I instantly knew how to implement BLOBs retrieval. So obvious! And it feels totally natural within the current API. Just got it working, first BLOB retrieved from PostgresSQL.
Not quite ready to hand it over yet, least of all to someone testing as mean as you ������

[20:23:48](#0SinVM2heR6t3PADHc5MWJIkS3aXbQ93vTKDI5xBOqs) <gurzgri>:
For now, it will be "all or nothing", fetch the whole BLOB, but with IO branch merged in, a "streaming" approach will be well within reach, too. Such that can a stream a BLOB directly into a file without having it in-memory as a whole in a intermediate step.

[20:23:53](#CZoMFE40lliCAwYhH5NhOE4TfQA3jjafZVpkvj8Bpdk) <hiiamboris (NOT THIS ONE)>:
> @qtxie or @hiiamboris can probably say.

I tried to implement OS resource freeing in one PR, but it never got merged and with D2D became irrelevant. No way for now.

[20:25:05](#Xb8XjbG3GaRNH2_uDg9Z1DtLxsLa6r-FEsm2g3KHX8Y) <gurzgri>:
Oh, that's sad.

[20:25:54](#nZ9ciooe_f3q5QsWitrrO2K6o5A1TeYKOkMVYdc2ezI) <hiiamboris (NOT THIS ONE)>:
Yep :) And we have images and fonts currently not collected at all.

[20:26:18](#1_Y2btTaSRgysYzUsDwdYX78vq1qN9ue9iAIJx4drCY) <gurzgri>:
Well, sometimes then ...

[20:27:24](#pRAAuh63W7xDI8H-mwQQzuUsaXkNdiz3sH97L9iH7UM) <gurzgri>:
* For now, it will be "all or nothing", fetch the whole BLOB, but with IO branch merged in, a "streaming" approach will be well within reach, too. Such that one can stream a BLOB directly into a file without having it in-memory as a whole in a intermediate step.

[20:45:08](#Y8NQjiUaVUW0uLyIkqOG7QxpngzDUunF0vs44VwbYnQ) <greggirwin (Gregg Irwin)>:
Great work @gurzgri !

[21:30:30](#bqnJTKK-_m0iW7An_6UCuyaEMtONV34JeHWyw8l55p4) <GiuseppeChillemi (GiuseppeChillemi)>:
> And when I woke up on sunday morning, suddenly everything has fallen into place and I instantly knew how to implement BLOBs retrieval. 

@gurzgri If you have found a way to easily manage BLOB columns you are ahead of a specialized tool I use to sync 2 companies' databases that do not manage BLOB columns at all. When it will be stable I will build a database sync utility. It is easy, I already know how to do it. 

[21:32:21](#pAxSupllFC5jpjilvgCy5od7QBP1fA7TzCZjPWy-_40) <GiuseppeChillemi (GiuseppeChillemi)>:
I have another only question: database Column names are mapped to `WORD`. Why don't you map it to string as there are some DB engines which accept column names like `2WORK` which is illegal in Red?

[21:32:31](#oWQ3W3wmGlsiycpKjibunaVceu3TZuUfNtYbWIK6nRg) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have another only question: database Column names are mapped to `WORD`. Why don't you map it to string as there are some DB engines which accept column names like `2WORK` which not legal in Red?

[21:32:45](#hZQi6k0WURuCpXOjKMMu6Xnt22TfySHIE6aV4NgKqLI) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have only another question: database Column names are mapped to `WORD`. Why don't you map it to string as there are some DB engines which accept column names like `2WORK` which not legal in Red?

[21:32:57](#zuKnZ0TYnUH6ca-2d5MWq5ZS37V_uyN1PZq3z5FqjaE) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have only another question: database column names are mapped to `WORD`. Why don't you map it to string as there are some DB engines which accept column names like `2WORK` which not legal in Red?

[21:38:08](#OS0aXdZ8j0kpyQd9gp-w4i0qAvdNrLgKv1GneSAfcDA) <gurzgri>:
Because words are nicer in Red to handle things with ������ You can get easily retrieve the original column name with
```
>> column-of: func [statement word] [copy select statement/state/columns] ()
>> column-of statement 'user-id
== "UserID"
```
In other words: see `statement/state/columns`

[21:46:36](#s9Ek7rcgvZ0FQncj64S4qP_wkL206tWkMFq8-FF1aX0) <gurzgri>:
And for illegal words it should fallback to the string, doesn't it? In queries I work with I like to `AS "..."` such column names so they adhere to what can be loaded as word.

[21:48:28](#WVMTg4IvGqWxgvI3uCVgbljBrCDMt_eBN1KZ7DpbTwM) <gurzgri>:
much appreciated @greggirwin 

[21:56:39](#ulKt9x8kmQxUWqt6UIITYO5FYGfnRh7xy4M8nGlO-0s) <GiuseppeChillemi (GiuseppeChillemi)>:
> And for illegal words it should fallback to the string, doesn't it? In queries I work with I like to `AS "..."` such column names so they adhere to what can be loaded as word.

I don't not whether it should fall back to a string and if could be possible. At least, the most important thing is the ability to retrieve the original column name and we have it. Some extra code is then needed when you want to handle tables without knowing their names. I will need an extra mapping table to write back the result to the original columns if you remap them automatically.

[21:57:08](#ZuXGYERVOz56fEweVgyXc8Q0PqZDuK7qyjT0A--BNl0) <GiuseppeChillemi (GiuseppeChillemi)>:
* > And for illegal words it should fallback to the string, doesn't it? In queries I work with I like to `AS "..."` such column names so they adhere to what can be loaded as word.

I don't not whether it should fall back to a string and if could be possible. At least, the most important thing is the ability to retrieve the original column name and we have it. Some extra code is then needed when you want to handle tables without knowing their names. I will need an extra mapping table to write back the result to the original columns if you renames illegal columns automatically.

[21:57:22](#FpPBSLsH9HY9WyMaODzCFT5wdsV3Hegm2tw6qSWbU5M) <GiuseppeChillemi (GiuseppeChillemi)>:
* > And for illegal words it should fallback to the string, doesn't it? In queries I work with I like to `AS "..."` such column names so they adhere to what can be loaded as word.

I don't not whether it should fall back to a string and if could be possible. At least, the most important thing is the ability to retrieve the original column name and we have it. Some extra code is then needed when you want to handle tables without knowing their names. I will need an extra mapping table to write back the result to the original columns if I rename illegal columns automatically.

[21:58:10](#MK1ND0mYAMMGKlRkdMomJNSvhgJkmnE_DgW8Iw5x4Ns) <GiuseppeChillemi (GiuseppeChillemi)>:
* > And for illegal words it should fallback to the string, doesn't it? In queries I work with I like to `AS "..."` such column names so they adhere to what can be loaded as word.

I don't not whether it should fall back to a string and if could be possible or not. At least, the most important thing is the ability to retrieve the original column name and we have it. Some extra code is then needed when you want to handle tables without knowing their names. I will need an extra mapping table to write back the result to the original columns if I rename illegal columns automatically.

[22:34:24](#3n7RV4R1-N3iQ9kG7sBERAwGi1aVr44QoQw_LJ6BowU) <gurzgri>:
It already falls back to string, that‘s how it is implemented. You need no „extra code“, you can just as well `extract/index` all strings from `stmt/state/columns` in what‘s worth half a line of code.

## 6-Apr-2022

[6:50:28](#Z0W_vWIYbzkTbqMnNcC-YGLXG1mYAzKtZifly_CZdyE) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri sorry, I did not fully understand you mean that it's possible to generate static long SQL from prepared statement, right?

[9:06:14](#K8f4Hc1QfzfyyQN2BKDIypUtHFXRrcfxyGi-DFq-9SU) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri I use the columns block to create a prototype object that rapresents the row, having also some Init function tied. Having strings does not let me create it, this is the reason I need secondary remapping and renaming illegal columns to legal ones. 

[10:12:25](#N9po0BA3s9SkQf7TCG379oul12z8db22GG2zFpm3eIM) <gurzgri>:
@bubnenkoff No, that's not what I meant. You'll need to achieve that by yourself if you want to achieve that, is what I meant (at least I don't know of a way to accomplish it).

[10:18:28](#pzXkZyulDrnMjdu_glqOa6249zAxftEi1YTw-XZKZ90) <gurzgri>:
@GiuseppeChillemi I don't get it. First you said you dislike the words, now it's strings that are in your way. Choose your way.

[10:19:26](#BdffZvC-LAdaC7Qbdf6KbBSbodVZy_5fKpWmwayxD8s) <bubnenkoff (Dmitry Bubnenkov)>:
Ah! I understood! But do you have any ideas that I can to try? 

[10:34:09](#GdH48wZds7_gcqgbL-a0WrJE5gMfs8DqeiVe9UJSxLI) <gurzgri>:
> I don't know of a way to accomplish it

[13:03:19](#Wq5rzUrF_NeNh2ohPVpPLKoCpEiSt7eRajER85139cM) <GiuseppeChillemi (GiuseppeChillemi)>:
> @GiuseppeChillemi I don't get it. First you said you dislike the words, now it's strings that are in your way. Choose your way.

Too many message, I understand I should explain better.

Having words used as column names is great but for full compatibility with any engine, strings are better. You have written that RED-ODBC automatically converts to string those "illegal" words and to me it is nice.  No more words on this topic.
My observation is towards myself. I use column names to create object prototypes in Red that contain the default values of a ROW. This because objects may have code to init them and they are perfect for initializing the ROW. So, when I create a ROW I use `make make object! [proto] [values]` where `[PROTO]` initializes the `ROW` and `[values]` sets all or part of them.  Having strings are column name, is not possible for objects, so I have observer to mayself, I need to rename the "illegal" word to a legal one and keep a map of `[orginal-name remapped-name]`. That's all, you don have to do anything, your code is pefect.


[13:04:15](#6u4J5h06UiWqnY3_uCAzE9UffL2UllFHqBEuw76yfAQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* > @GiuseppeChillemi I don't get it. First you said you dislike the words, now it's strings that are in your way. Choose your way.

Too many message, I understand I should explain better.

Having words used as column names is great but for full compatibility with any engine, strings are better. You have written that RED-ODBC automatically converts to string those "illegal" words and to me it is nice.  No more words on this topic.
My observation is towards myself. I use column names to create object prototypes in Red that contain the default values of a ROW. This because objects may have code to init them and they are perfect for initializing the ROW. So, when I create a ROW I use `make make object! [proto] [values]` where `[PROTO]` initializes the columns of the `ROW` and `[values]` sets all or part of the columns.  Having strings are column name, is not possible for objects, so I have observer to mayself, I need to rename the "illegal" word to a legal one and keep a map of `[orginal-name remapped-name]`. That's all, you don have to do anything, your code is pefect.


[13:04:27](#mMsZHLy2CGD4ZZXOS727KQRMEYWrJuyU_ESoMHWmOes) <GiuseppeChillemi (GiuseppeChillemi)>:
* > @GiuseppeChillemi I don't get it. First you said you dislike the words, now it's strings that are in your way. Choose your way.

Too many message, I understand I should explain better.

Having words used as column names is great but for full compatibility with any engine, strings are better. You have written that RED-ODBC automatically converts to string those "illegal" words and to me it is nice.  No more words on this topic.
My observation is towards myself. I use column names to create object prototypes in Red that contain the default values of a ROW. This because objects may have code to init them and they are perfect for initializing the ROW. So, when I create a ROW I use `make make object! [proto] [values]` where `[PROTO]` initializes the columns of the `ROW` and `[values]` sets all or part of them.  Having strings are column name, is not possible for objects, so I have observer to mayself, I need to rename the "illegal" word to a legal one and keep a map of `[orginal-name remapped-name]`. That's all, you don have to do anything, your code is pefect.


[13:04:36](#f2WnQzsEGK6E7yakdXrX-zasNrMISlS1HGB6A_qefO0) <GiuseppeChillemi (GiuseppeChillemi)>:
* > @GiuseppeChillemi I don't get it. First you said you dislike the words, now it's strings that are in your way. Choose your way.

Too many message, I understand I should explain better.

Having words used as column names is great but for full compatibility with any engine, strings are better. You have written that RED-ODBC automatically converts to string those "illegal" words and to me it is nice.  No more words on this topic.
My observation is towards myself. I use column names to create object prototypes in Red that contain the default values of a ROW. This because objects may have code to init them and they are perfect for initializing the ROW. So, when I create a ROW I use `make make object! [proto] [values]` where `[PROTO]` initializes the columns of the `ROW` and `[values]` sets all or part of them.  Having strings as column name, is not possible for objects, so I have observer to mayself, I need to rename the "illegal" word to a legal one and keep a map of `[orginal-name remapped-name]`. That's all, you don have to do anything, your code is pefect.


[13:04:44](#7GeXmQ_sXcEhsskmSyDeGj8XQmZWUjiQBwd_PypGBmA) <GiuseppeChillemi (GiuseppeChillemi)>:
* > @GiuseppeChillemi I don't get it. First you said you dislike the words, now it's strings that are in your way. Choose your way.

Too many message, I understand I should explain better.

Having words used as column names is great but for full compatibility with any engine, strings are better. You have written that RED-ODBC automatically converts to string those "illegal" words and to me it is nice.  No more words on this topic.
My observation is towards myself. I use column names to create object prototypes in Red that contain the default values of a ROW. This because objects may have code to init them and they are perfect for initializing the ROW. So, when I create a ROW I use `make make object! [proto] [values]` where `[PROTO]` initializes the columns of the `ROW` and `[values]` sets all or part of them.  Having strings as column name is not possible for objects, so I have observer to mayself, I need to rename the "illegal" word to a legal one and keep a map of `[orginal-name remapped-name]`. That's all, you don have to do anything, your code is pefect.


[13:05:01](#mbDGfLwR0v3F66peJR5VfZfZc29vXheneCh0yrtVfcg) <GiuseppeChillemi (GiuseppeChillemi)>:
* > @GiuseppeChillemi I don't get it. First you said you dislike the words, now it's strings that are in your way. Choose your way.

Too many message, I understand I should explain better.

Having words used as column names is great but for full compatibility with any engine, strings are better. You have written that RED-ODBC automatically converts to string those "illegal" words and to me it is nice.  No more words on this topic.
My observation is towards myself. I use column names to create object prototypes in Red that contain the default values of a ROW. This because objects may have code to init them and they are perfect for initializing the ROW. So, when I create a ROW I use `make make object! [proto] [values]` where `[PROTO]` initializes the columns of the `ROW` and `[values]` sets all or part of them.  Having strings as column name is not possible for objects, so I have observed to myself, I need to rename the "illegal" word to a legal one and keep a map of `[orginal-name remapped-name]`. That's all, you don have to do anything, your code is pefect.


[13:05:15](#-kdPMEas0IJNOXHPrMDBb5UzwNDK3VCN1EtHN3xyutk) <GiuseppeChillemi (GiuseppeChillemi)>:
* > @GiuseppeChillemi I don't get it. First you said you dislike the words, now it's strings that are in your way. Choose your way.

Too many message, I understand I should explain better.

Having words used as column names is great but for full compatibility with any engine, strings are better. You have written that RED-ODBC automatically converts to string those "illegal" words and to me it is nice.  No more words on this topic.
My observation is towards myself. I use column names to create object prototypes in Red that contain the default values of a ROW. This because objects may have code to init them and they are perfect for initializing the ROW. So, when I create a ROW I use `make make object! [proto] [values]` where `[PROTO]` initializes the columns of the `ROW` and `[values]` sets all or part of them.  Having strings as column name is not possible for objects, so I have observed to myself, I need to rename the "illegal" words to a legal ones and keep a map of `[orginal-name remapped-name]`. That's all, you don have to do anything, your code is pefect.


[16:44:24](#dhPRvpwIGniJl00elHD8qY3oLh6nwpqYbawCyRbiaJ8) <bubnenkoff (Dmitry Bubnenkov)>:
I am not sure, but possible it's a bug. I did a lot of experiments with reduce/compose `none`  and it's inserting as 1, not as null

[16:44:26](#BLeXI--o7U9c5GCkMWL0lwh2Tvlvr_PEjgu7Lp8SQ1Y) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/37H3/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/37H3/izobrazhenie.png)

[16:49:39](#Nl08R_djazqkUEtKGUyIgz8ZxdR_Kkz6nJKaLWU7rHE) <bubnenkoff (Dmitry Bubnenkov)>:
* I am not sure, but possible it's a bug. I did a lot of experiments with reduce/compose `none`  and it's inserting as 1, not as `null`
Also I tried `#[none]`

[18:12:56](#93i0jkIZ8IeYpNGEfeWV74--1--3OJHCuyOKc6MkMZg) <bubnenkoff (Dmitry Bubnenkov)>:
* I am not sure, but possible it's a bug. I did a lot of experiments with reduce/compose `none`  and it's inserting as 1, not as `null`
Also I tried `#[none]`

[18:13:12](#cdcViomn-qIAGPhrTG6TZnJ6EWiqKKXNKKBKcj9Qh40) <bubnenkoff (Dmitry Bubnenkov)>:
* I have got follow table:
```
CREATE TABLE "public"."notifications" ( 
	"purchaseNumber" Character Varying( 150 ) NOT NULL,
	"docPublishDate" Timestamp With Time Zone,
	"responsibleOrg_inn" Character Varying( 150 ),
	"responsibleOrg_kpp" Character Varying( 150 ),
	"responsibleOrg_fullName" Character Varying( 2044 ),
	"responsibleOrg_postAddress" Character Varying( 2044 ),
	"responsibleOrg_factAddress" Character Varying( 2044 ),
	"contactPerson_lastName" Character Varying( 2044 ),
	"contactPerson_firstName" Character Varying( 2044 ),
	"contactPerson_middleName" Character Varying( 2044 ),
	"responsibleInfo_contactEMail" Character Varying( 2044 ),
	"responsibleInfo_contactPhone" Character Varying( 2044 ),
	"responsibleRole" Character Varying( 2044 ),
	"placingWay_code" Character Varying( 2044 ),
	"etp_code" Character Varying( 2044 ),
	"etp_name" Character Varying( 2044 ),
	"etp_url" Character Varying( 2044 ),
	"xml_path" Character Varying( 2044 ),
	"tag" Character Varying( 2044 ),
	"is_canceled" Boolean,
	"procedureInfo_collecting_startDate" Timestamp With Time Zone,
	"procedureInfo_collecting_endDate" Timestamp With Time Zone,
	"procedureInfo_scoring_date" Timestamp With Time Zone,
	"procedureInfo_bidding_date" Timestamp With Time Zone,
	"contractCondition_maxPrice" Numeric,
	"region" Character Varying( 150 ),
	"placingWay_name" Character Varying( 2044 ),
	"procedureInfo_collecting_place" Character Varying( 2044 ),
	"specializedOrg_fullName" Character Varying( 2044 ),
	"specializedOrg_postAddress" Character Varying( 2044 ),
	"specializedOrg_factAddress" Character Varying( 2044 ),
	"specializedOrg_INN" Character Varying( 2044 ),
	"id" BigInt DEFAULT nextval('notifications_id_seq'::regclass) NOT NULL,
	"isGOZ" Boolean,
	"fz_name" Character Varying,
	"responsibleOrg_regNum" Character Varying,
	"specializedOrg_regNum" Character Varying( 50 ),
	"lotMaxPrice" Numeric,
	CONSTRAINT "unique_notice_purchaseNumber" UNIQUE( "purchaseNumber" ) );
 ;
```

When I am trying to unsert data:
```
insert data-insert-statement compose/deep [ 
    {INSERT INTO notifications ("purchaseNumber", "isGOZ", "docPublishDate", "responsibleOrg_inn", "responsibleOrg_regNum", "responsibleOrg_kpp", "responsibleOrg_fullName", "responsibleOrg_postAddress", "responsibleOrg_factAddress", "contactPerson_lastName", "contactPerson_firstName", "contactPerson_middleName", "responsibleInfo_contactEMail", "responsibleInfo_contactPhone", "specializedOrg_fullName", "specializedOrg_postAddress", "specializedOrg_factAddress", "specializedOrg_INN", "specializedOrg_regNum", "responsibleRole", "placingWay_code", "placingWay_name", "etp_code", "etp_name", "etp_url", "procedureInfo_collecting_startDate", "procedureInfo_collecting_place", "procedureInfo_collecting_endDate", "procedureInfo_scoring_date", "procedureInfo_bidding_date", "tag", "region", "xml_path", "fz_name") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}

    [["0376200000417000011" none "2017-03-21T14:41:58.534+03:00" "0105025965" "03762000004" "010501001" {SOME NAME} {FOOOO} {BAR} "AAA" "GGG" "DDDD" "arkb.torgi@mail.ru" "7-8772-524957" none none none none none "CU" "ZKP44" "Запрос котировок" none none none "2017-03-22T09:00:00+03:00" {mmmmmmm} "2017-03-30T10:00:00+03:00" none none "is_lots" "Adygeja_Resp" none "fz44"]]
    
]
```	

I am getting error:
```
07002 32 The # of IPD parameters 1 < 34 the # of parameter markers
*** Script Error: ODBC error: ["07002" 32 {The # of IPD parameters 1 < 34 the # of parameter markers}]
*** Where: ctx||610~execute-statement
*** Near : param
*** Stack: flat-data-to-prepared-insert
```

What can be wrong?

[18:13:22](#xk5XRqq4hjIpoCM0QqbriyX0I_U3S71gORaWCY74rrc) <bubnenkoff (Dmitry Bubnenkov)>:
* I have got follow table:
```
CREATE TABLE "public"."notifications" ( 
	"purchaseNumber" Character Varying( 150 ) NOT NULL,
	"docPublishDate" Timestamp With Time Zone,
	"responsibleOrg_inn" Character Varying( 150 ),
	"responsibleOrg_kpp" Character Varying( 150 ),
	"responsibleOrg_fullName" Character Varying( 2044 ),
	"responsibleOrg_postAddress" Character Varying( 2044 ),
	"responsibleOrg_factAddress" Character Varying( 2044 ),
	"contactPerson_lastName" Character Varying( 2044 ),
	"contactPerson_firstName" Character Varying( 2044 ),
	"contactPerson_middleName" Character Varying( 2044 ),
	"responsibleInfo_contactEMail" Character Varying( 2044 ),
	"responsibleInfo_contactPhone" Character Varying( 2044 ),
	"responsibleRole" Character Varying( 2044 ),
	"placingWay_code" Character Varying( 2044 ),
	"etp_code" Character Varying( 2044 ),
	"etp_name" Character Varying( 2044 ),
	"etp_url" Character Varying( 2044 ),
	"xml_path" Character Varying( 2044 ),
	"tag" Character Varying( 2044 ),
	"is_canceled" Boolean,
	"procedureInfo_collecting_startDate" Timestamp With Time Zone,
	"procedureInfo_collecting_endDate" Timestamp With Time Zone,
	"procedureInfo_scoring_date" Timestamp With Time Zone,
	"procedureInfo_bidding_date" Timestamp With Time Zone,
	"contractCondition_maxPrice" Numeric,
	"region" Character Varying( 150 ),
	"placingWay_name" Character Varying( 2044 ),
	"procedureInfo_collecting_place" Character Varying( 2044 ),
	"specializedOrg_fullName" Character Varying( 2044 ),
	"specializedOrg_postAddress" Character Varying( 2044 ),
	"specializedOrg_factAddress" Character Varying( 2044 ),
	"specializedOrg_INN" Character Varying( 2044 ),
	"id" BigInt DEFAULT nextval('notifications_id_seq'::regclass) NOT NULL,
	"isGOZ" Boolean,
	"fz_name" Character Varying,
	"responsibleOrg_regNum" Character Varying,
	"specializedOrg_regNum" Character Varying( 50 ),
	"lotMaxPrice" Numeric,
	CONSTRAINT "unique_notice_purchaseNumber" UNIQUE( "purchaseNumber" ) );
 ;
```

When I am trying to insert data:
```
insert data-insert-statement compose/deep [ 
    {INSERT INTO notifications ("purchaseNumber", "isGOZ", "docPublishDate", "responsibleOrg_inn", "responsibleOrg_regNum", "responsibleOrg_kpp", "responsibleOrg_fullName", "responsibleOrg_postAddress", "responsibleOrg_factAddress", "contactPerson_lastName", "contactPerson_firstName", "contactPerson_middleName", "responsibleInfo_contactEMail", "responsibleInfo_contactPhone", "specializedOrg_fullName", "specializedOrg_postAddress", "specializedOrg_factAddress", "specializedOrg_INN", "specializedOrg_regNum", "responsibleRole", "placingWay_code", "placingWay_name", "etp_code", "etp_name", "etp_url", "procedureInfo_collecting_startDate", "procedureInfo_collecting_place", "procedureInfo_collecting_endDate", "procedureInfo_scoring_date", "procedureInfo_bidding_date", "tag", "region", "xml_path", "fz_name") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}

    [["0376200000417000011" none "2017-03-21T14:41:58.534+03:00" "0105025965" "03762000004" "010501001" {SOME NAME} {FOOOO} {BAR} "AAA" "GGG" "DDDD" "arkb.torgi@mail.ru" "7-8772-524957" none none none none none "CU" "ZKP44" "Запрос котировок" none none none "2017-03-22T09:00:00+03:00" {mmmmmmm} "2017-03-30T10:00:00+03:00" none none "is_lots" "Adygeja_Resp" none "fz44"]]
    
]
```	

I am getting error:
```
07002 32 The # of IPD parameters 1 < 34 the # of parameter markers
*** Script Error: ODBC error: ["07002" 32 {The # of IPD parameters 1 < 34 the # of parameter markers}]
*** Where: ctx||610~execute-statement
*** Near : param
*** Stack: flat-data-to-prepared-insert
```

What can be wrong?

[18:16:45](#ihVags3wxnXiWhQeeF2M7PGPVAA5NvhbD4EFObr3b9U) <gurzgri>:
@GiuseppeChillemi I see now. So you too have chosen to go the word! way and therefore have to deal with occasional string! column names. What I wanted to point out is that with 
```
>> insert schools "select * from public.schools"
== [authority-id address-id caption city name school-id authority-key]
>> extract/index schools/state/columns 9 2
== ["authority_id" "address_id" "caption" "city" "name" "school_id" "authority_key"]
```
easily gives you the column strings. Eventually you can transform rows to map! type instead of object! type, sparing you from keeping an addtional mapping. With map! type, all column name strings would be valid keys:
```
>> proto-of: func [query] [make map! collect [foreach col extract/index query/state/columns 9 2 [keep reduce [col none]]]] ()
>> populate: func [row values] [foreach column keys-of row [row/:column: first values values: next values] row] ()
>> row: populate proto: proto-of schools first rows: copy schools 
== == #(
    "authority_id" 12
    "address_id" 377534
    "caption" "HS ******-****"
    "city" "H*****heim"
    "name" none
    "school_id" 25815
    "author...
```

[18:17:21](#kFTvCspd6ZiUPWiBU9gUKBHN9TJq9nk2lHOHY_nU-F4) <bubnenkoff (Dmitry Bubnenkov)>:
* ```
insert data-insert-statement compose/deep [ 
    {INSERT INTO notifications ("purchaseNumber", "isGOZ", "docPublishDate") VALUES (?,?,?)}

    [["0376200000417000011" none "2017-03-21T14:41:58.534+03:00"]]

]
```	

I am getting error:
```
07002 32 The # of IPD parameters 1 < 3 the # of parameter markers
*** Script Error: ODBC error: ["07002" 32 {The # of IPD parameters 1 < 3 the # of parameter markers}]
*** Where: ctx||610~execute-statement
*** Near : param
```	

[18:26:10](#jdNMKu-cJVAY9P_q92iAYtIkb-W4pD1d-v4MlfzPsG4) <gurzgri>:
@bubnenkoff Re: inserting `NULL` values with values of type `none!` - might be bug, but it may depend. PostgreSQL? What does `probe data-insert-statement/state/columns` look like? The 6th value out of 9 per column is the nullability of the column. Eventually your `currency_code` column allows no NULL values? A 0 (zero) means "no NULLs allowed". 

[18:29:10](#awuKIXudjBRFMbOnV8dO8p0S8iStXzZENvCePIzeu3A) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri sorry, I deleted message about error, I found why it's happens) I forgot breakets 

[18:29:19](#10euWCEHwE2KNE8wmZ_a-HsVlWDBwf-ev9xeCQwjWjY) <gurzgri>:
@bubnenkoff The correct form was `insert stmt ["some sql" [...] [...] [...] ...]` yesterday, it's the same today. You again have a block too much around your param values. 

[18:29:42](#hrrqYVUL2Of4TUCuAKnITfQDBzoyq2uAG92KuRUA_Ck) <gurzgri>:
Answered anyways ������

[18:29:50](#lWUhkfz4zRQdOJjk6FHXdv3tbrOdZlTg1v65x4Rixvg) <bubnenkoff (Dmitry Bubnenkov)>:
yeah) thanks)

[18:42:47](#-DhCyqrFFJk2XQqJlKmYrUJlpnlAKlyB3IMXiEWKhcM) <gurzgri>:
@bubnenkoff Can confirm: `#[none]` is inserted as `1` whether column is nullable or not. I'll address that.

[18:45:33](#LhfrRpZ7l_80N6idpYb5M_KtgyZVd5eShcutncskV8w) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/He23/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/He23/izobrazhenie.png)

[18:46:11](#IoRv7p67KA-hF03lXDR4lCZPU2H6_GvY7-RtOY4msTw) <bubnenkoff (Dmitry Bubnenkov)>:
I faced with this error. copy-paste to sample project get it's inserted cirrectly

[18:47:00](#Q0iFzq7PuUuphYJpOT92nDj0DeeGqRhiVoCvZxIJ2Io) <bubnenkoff (Dmitry Bubnenkov)>:
but in real project I am getting an error about `wrong syntax for timestamp with time zone:  "1";^/`

[18:47:54](#5ek3O8KAsOF6OqGyN7izlxuE50gcYo7_n95HD5L4J_g) <bubnenkoff (Dmitry Bubnenkov)>:
Could the cause of an error be error with `none` above?

[18:50:06](#hHRwRpXgVGKfj1CzVABu4f3Rar-cPyY_p4wYAYZzXNc) <bubnenkoff (Dmitry Bubnenkov)>:
But very strange that it's give me insert data in sample project 

[18:50:08](#e5ZXGT7-IX_QQPU8i-8DvhUnTHL8ow908HTSaUw35tc) <bubnenkoff (Dmitry Bubnenkov)>:
It's inserting correctly:
```
            insert data-insert-statement compose/deep [ 
                {INSERT INTO notifications ("purchaseNumber", "isGOZ", "docPublishDate", "responsibleOrg_inn", "responsibleOrg_regNum", "responsibleOrg_kpp", "responsibleOrg_fullName", "responsibleOrg_postAddress", "responsibleOrg_factAddress", "contactPerson_lastName", "contactPerson_firstName", "contactPerson_middleName", "responsibleInfo_contactEMail", "responsibleInfo_contactPhone", "specializedOrg_fullName", "specializedOrg_postAddress", "specializedOrg_factAddress", "specializedOrg_INN", "specializedOrg_regNum", "responsibleRole", "placingWay_code", "placingWay_name", "etp_code", "etp_name", "etp_url", "procedureInfo_collecting_startDate", "procedureInfo_collecting_place", "procedureInfo_collecting_endDate", "procedureInfo_scoring_date", "procedureInfo_bidding_date", "tag", "region", "xml_path", "fz_name") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ON CONFLICT ("purchaseNumber")
   DO UPDATE SET "purchaseNumber" = EXCLUDED."purchaseNumber", "isGOZ" = EXCLUDED."isGOZ", "docPublishDate" = EXCLUDED."docPublishDate", "responsibleOrg_inn" = EXCLUDED."responsibleOrg_inn", "responsibleOrg_regNum" = EXCLUDED."responsibleOrg_regNum", "responsibleOrg_kpp" = EXCLUDED."responsibleOrg_kpp", "responsibleOrg_fullName" = EXCLUDED."responsibleOrg_fullName", "responsibleOrg_postAddress" = EXCLUDED."responsibleOrg_postAddress", "responsibleOrg_factAddress" = EXCLUDED."responsibleOrg_factAddress", "contactPerson_lastName" = EXCLUDED."contactPerson_lastName", "contactPerson_firstName" = EXCLUDED."contactPerson_firstName", "contactPerson_middleName" = EXCLUDED."contactPerson_middleName", "responsibleInfo_contactEMail" = EXCLUDED."responsibleInfo_contactEMail", "responsibleInfo_contactPhone" = EXCLUDED."responsibleInfo_contactPhone", "specializedOrg_fullName" = EXCLUDED."specializedOrg_fullName", "specializedOrg_postAddress" = EXCLUDED."specializedOrg_postAddress", "specializedOrg_factAddress" = EXCLUDED."specializedOrg_factAddress", "specializedOrg_INN" = EXCLUDED."specializedOrg_INN", "specializedOrg_regNum" = EXCLUDED."specializedOrg_regNum", "responsibleRole" = EXCLUDED."responsibleRole", "placingWay_code" = EXCLUDED."placingWay_code", "placingWay_name" = EXCLUDED."placingWay_name", "etp_code" = EXCLUDED."etp_code", "etp_name" = EXCLUDED."etp_name", "etp_url" = EXCLUDED."etp_url", "procedureInfo_collecting_startDate" = EXCLUDED."procedureInfo_collecting_startDate", "procedureInfo_collecting_place" = EXCLUDED."procedureInfo_collecting_place", "procedureInfo_collecting_endDate" = EXCLUDED."procedureInfo_collecting_endDate", "procedureInfo_scoring_date" = EXCLUDED."procedureInfo_scoring_date", "procedureInfo_bidding_date" = EXCLUDED."procedureInfo_bidding_date", "tag" = EXCLUDED."tag", "region" = EXCLUDED."region", "xml_path" = EXCLUDED."xml_path", "fz_name" = EXCLUDED."fz_name"}
                ([["0376200000417000011" none "2017-03-21T14:41:58.534+03:00" "0105025965" "03762000004" "010501001" {ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ ЗДРАВООХРАНЕНИЯ РЕСПУБЛИКИ АДЫГЕЯ АДЫГЕЙСКАЯ РЕСПУБЛИКАНСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА} {Российская Федерация, 385000, Адыгея Респ, Майкоп г, УЛ ЖУКОВСКОГО, 4} {Российская Федерация, 385000, Адыгея Респ, Майкоп г, УЛ ЖУКОВСКОГО, 4} "Тлишева" "Мариет" "Анатольевна" "arkb.torgi@mail.ru" "7-8772-524957" none none none none none "CU" "ZKP44" "Запрос котировок" none none none "2017-03-22T09:00:00+03:00" {Республика Адыгея, г. Майкоп, ул. Жуковского, 4, каб. 15.} "2017-03-30T10:00:00+03:00" none none "is_lots" "Adygeja_Resp" none "fz44"]])
                
            ]
        ] 
```		

[18:50:20](#xex3Vdl1t43gW42nrzjQ_O6l2LVpF9fLdsp9mqBRamA) <bubnenkoff (Dmitry Bubnenkov)>:
* I faced with this error. copy-paste to sample project get it's inserted correctly

[18:50:26](#SuCwrl-Feu0ui3O2Sy-Ad1VjIWVjzat_3NTJN-WJbHY) <gurzgri>:
Think so because of the `wrong syntax ... with "1", that must be the 1 instead of NULL, and "1" is not valid timestamp.

[18:51:36](#tjNaL4TrkSWDTA-MrJUmW-A1sZMB5nGI9wz7gcp9Ud0) <bubnenkoff (Dmitry Bubnenkov)>:
But I do not see any "1" in my screenshot...

[18:53:05](#SPJ3JdIWr5Dy-JcCus-f_Laj3s20us8cjjE8pv6fAkw) <gurzgri>:
Minimal examples please. I'm not going to examine a statement like your "It's inserting correctly" sample with soo much noise.

[18:53:09](#DLg6b8i2h8is3dp2dmuwnn8Z_8hohivn6_6KvJyrfFY) <gurzgri>:
I see the 1 in your screenshot.

[18:55:53](#tFyJitZucxxuAxLP8TAQ4M5ss7eCcnRIbSGiuQgY35A) <bubnenkoff (Dmitry Bubnenkov)>:
Thanks! I will try too look deeper tomorrow. The problem that minimal example is work, but real project is not... 

[19:00:07](#n9TuFlfj4DbgtRuNkKZ81P_U2nETQ5PGVCUVUB_3yiA) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/yPyv/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/yPyv/izobrazhenie.png)

[19:00:15](#pX73YEKyVgOgQTULeZZAjEpAhCd-ddaB-EMCDiW5GUw) <bubnenkoff (Dmitry Bubnenkov)>:
Do you mean this `1` ?

[19:01:14](#BzAIbm4q4Ly5-7fScuQC3Wn1WNREPp7bzuq1YF50aNM) <bubnenkoff (Dmitry Bubnenkov)>:
is yes, it's very strange that it appears here. 

[19:02:28](#Qu9ox6vz_UJ5-Qbkl4Myz-kHqglApNGyJpb4vvCrRA8) <gurzgri>:
Yes, because in the param block at pos #2 there's the corresponding `none`.

[19:07:52](#egU4BpN8knxHEixn6AqPuFAboFMgFbdVeb43l51Q6J0) <bubnenkoff (Dmitry Bubnenkov)>:
oh, so it's error about wrong evaluation of `none`. Understand

[19:08:04](#d48VLApnj1lTrGGwFYScwVvbnZ0VKwwCeWiRcg5iddg) <bubnenkoff (Dmitry Bubnenkov)>:
* oh, so it's error about wrong evaluation of `none` to `1`. Understand

[22:55:20](#u_mO2eHdJZk-7RieVZOYxP_0NHObkBaW259uQEvcMHg) <gurzgri>:
@GiuseppeChillemi I have a ������ for you:

* commit dada87f: "FEAT: Deferred fetching of TEXT/BLOB columns (longvarchar/longvarbinary)"
* commit 33adbcb: "DOCS: documentation for PICK on TEXT/BLOB columns"

If you want to try it please follow the documentation and the code sample therein. It would be cool if you can retrieve your PDF documents or whatever it was that way. I could do so already in PostgreSQL and Intersystems Caché, binary data and text documents.

[23:05:18](#7SeRtNzLpwFRAywpfkdpJ8BwPvyrlK6erRDG1Np2kRI) <gurzgri>:
Note: you can `pick` (select), you can not `poke `(insert, update) yet.

## 7-Apr-2022

[1:17:38](#SG53BRrZd0XFEm4zTDGlPreGzBMoXUZ2XWnWJsAfmfE) <greggirwin (Gregg Irwin)>:
More great progress @gurzgri! And thanks for testing it @GiuseppeChillemi  and @bubnenkoff!

[7:23:50](#7OLJzPMHGULbU45ir16jcUtTHD7qIK9h5k88LmY93dw) <GiuseppeChillemi (GiuseppeChillemi)>:
Nice, I will try soon. How do you handle the situation where the data in the column become out of sync with the database? I mean, when it is updated or deleted. Will the scheme throw an error?

[18:00:40](#v8wieuW9YTk_jM6OM2k0jOFuDUpaUsxvnlP5KsvjDgQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Where I am wrong?

```
cn: switch 'b-ok con
st: open cn
st/state/window: 10000
st/state/cursor: 'static

columns: insert st  rejoin ["select top 10000 * from dotes where attributi is not null "] 

probe a: next st

probe a 'attributi
> none
```

Note: `attribute` is not the first blob column, but I have not retrieved the others

[18:01:07](#ut-FUNycvByEUR7_pITvSnPmPujxwQ6WgaDkcM7WVAE) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri  Where I am wrong?

```
cn: switch 'b-ok con
st: open cn
st/state/window: 10000
st/state/cursor: 'static

columns: insert st  rejoin ["select top 10000 * from dotes where attributi is not null "] 

probe a: next st

probe a 'attributi
> none
```

Note: `attribute` is not the first blob column, but I have not retrieved the others

[18:17:47](#Wph_ZZWawP1IJlZuLmhC8M0qO-mpVksxktFI7ZG9vL8) <gurzgri>:
At line `probe a 'attributi`, but that's not your fault: There is a mistake in the docs, it must be `pick st 'attributi`, I'll fix that immediatly. You pick from the statement port as you do with other port functions.

[18:21:51](#oJZ8jUCguKNEdX-jRbzAUnG6qeEyYtGPMDdizJ8WECs) <gurzgri>:
Fixed docs.

[18:26:01](#2LYVxoQVVlUmXe01aawXpSivv4--nc4k9GSoObq5Q0k) <GiuseppeChillemi (GiuseppeChillemi)>:
There is another problem:

[18:26:25](#9t9rgdGcBTFKyUhynvIa1mxqU2W-IbxV3O1eD0kuJMo) <GiuseppeChillemi (GiuseppeChillemi)>:
It seems I have to `select`, while I have used `insert`

[18:28:05](#L8WbWvs0-bHRE1HLvEAQBntoLMBHicFmS4jt2Vwy8iM) <GiuseppeChillemi (GiuseppeChillemi)>:
Also....

In the docs you are writing that I have to open 2 times:

`photos: open album: open odbc://album`

But it does not work here

```
cn: switch 'b-ok con

rw: open st: open cn
st/state/window: 10000
st/state/cursor: 'static

columns: select rw  "select top 10000 * from cf where attributi is not null "

```
`invalid id field in spec block`



[18:28:31](#D1uwOTEnt4cyYo20Obs1FWKg4QRQ3tQvrCXxC8PnHms) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also....

In the docs you are writing that I have to open 2 times:

`photos: open album: open odbc://album`

But it does not work here

```
cn: switch 'b-ok con

rw: open st: open cn
st/state/window: 10000
st/state/cursor: 'static

columns: select rw  "select top 10000 * from cf where attributi is not null "

```
`>> invalid id field in spec block`



[18:29:09](#DnZGPPx72LgL3HM9VEgng179XkWaFYeYdrepLl-HShc) <gurzgri>:
No, `insert` is correct, obviously it was too late yesterday for me ������ 

[18:31:13](#MJ0yKopjVv9Gs3ZxmQ_KHuNA5jjCa79desduFXT49sg) <gurzgri>:
You do the same thing as always, insert a statement, fetch results (here with `next`) and for TEXTs and BLOBs you get `deferred` word instead of the value. Then you `pick` the deferred columns' values.

[18:31:32](#B61AZ_3LPW74E0_PWut4InO_UiVe6uOa_oaU15kEaH4) <GiuseppeChillemi (GiuseppeChillemi)>:
It happens to mee too! In fact I have got: `Invalid port action`

[18:32:03](#MyipjislTwYc3fLE5wlISumYCvmgf98B8gtOD5DkXXU) <GiuseppeChillemi (GiuseppeChillemi)>:
But no, it is not working:

[18:34:08](#CvM_YYLVllWBupoRfgiTK3lcH_wkJ-oJ-7KUFla6cIY) <GiuseppeChillemi (GiuseppeChillemi)>:
```
cn: switch 'b-ok con

st: open cn
st/state/window: 10000
st/state/cursor: 'static

columns: insert st  "select top 10000 * from cf where attributi is not null "

b: next st

probe pick b 'attributi
```

Do you see anything wrong here?


[18:34:18](#s21qh_naWhZ8nCGvlHwYFP6_67JF6qyxN8kfP9SSjaI) <gurzgri>:
`next` must be used, because with `copy` no cursor would be open and the low level SQLGetData requires a valid cursor. 

[18:35:00](#URtiQn76LLxqL_YIcPKkvCiciia9sJ64Icf--OYHTlM) <gurzgri>:
not `pick b 'attributi`, but `pick st 'attributi`

[18:35:41](#X64KWPdwEbywqSAAc8ngG2a0QOxXws2GnwPnMDUh5Oo) <gurzgri>:
You pick from the statement port, not from the rowset fetched.

[18:37:31](#RKh7SG-8hweOV3-a5OLonw_dOep0p3JM7aN7QvcN2QQ) <GiuseppeChillemi (GiuseppeChillemi)>:
But `b: next st`, so I should be on the statement port!

[18:37:54](#0NIPvKQDFIH9ooOQrBb7jfkFKYsCF_SBLf1eWPsYu5U) <gurzgri>:
Jesus, no!

[18:39:35](#nAwW8Sw4BbR_bOubW-ZWSMIW6esltofLkJcvT2PEJMc) <GiuseppeChillemi (GiuseppeChillemi)>:
OMG!  Let`s restart from scratch: is this correct in your documentation?

```
photos: open album: open odbc://album
```

[18:41:45](#2VnVCGwKvtcgSfaDzhxxSEd2YdivhzWrIhX3bAUX008) <gurzgri>:
My last comment addressed your assumption that `next st` would return a value of type `port!`. That's totally not true. It returns a block of rows.    

[18:42:26](#kwzBOM5ECdEn4qNxaJgfAuEJO9ICootV7xKRuuDrDXs) <gurzgri>:
```
>> spec-of :next
== [
    "Returns a series at the next index"
    series [series! port!]
    return: [series! port!]
]
```
`next` takes a port and returns a series.

[18:42:57](#2n8L9V9L68qPPbWTrmpfTodMW7srcOvfNwv0Twc-ehw) <gurzgri>:
correct

[18:44:56](#1VvZCQV7F5xnsctqMjVUb51GdnGFJiAceIuNZb_YzGg) <GiuseppeChillemi (GiuseppeChillemi)>:
So why this noes not work here?

```
cn: switch 'b-ok con

data: open st: open cn
st/state/window: 10000
st/state/cursor: 'static
halt

*** Script Error: invalid id field in spec block
*** Where: make
*** Near : args
*** Stack: do-file
```

[18:47:19](#9A5hLHHy8-5E_tM5sQTPXIxkycbMOEn9iqNJSz2Je4w) <gurzgri>:
All these functions used with ports are "polymorphic functions". You shouldn't think of them as the "same" functions from "your every days Red". In fact, each and every application of such a function is dispatched to a datataype specific implementation. They are generalisations to provide a common interface.

[18:49:14](#Pqusv0KLEtU1gFrpw1F_ZCITCf-rwFAluzFWh3VZ2EI) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, I know and this confuses things because standard Red working is returned by the mind 

[18:49:31](#a0UueygsygP58Jpv0WTC9X5VOe0by_21mdwyKBavDRc) <gurzgri>:
When you apply `next` or `copy` or `insert` etc. on a `port!` value, a corresponding function `next` etc. in the port's scheme is called. That can do whatever it want and return whatever it thinks makes sense.

[18:49:54](#vzmeSMQtox9YXXeOulWySnn1L-_HA01R6lc-Kxvlc-U) <GiuseppeChillemi (GiuseppeChillemi)>:
I have written to you here:  https://gitter.im/red/database?at=624f2fe63ae95a1ec1d81498

[18:51:02](#GuyRD3S3uVxBKqsIRiSYBORuPaulfVx8Xnb6SAjfuk0) <GiuseppeChillemi (GiuseppeChillemi)>:
> When you apply `next` or `copy` or `insert` etc. on a `port!` value, a corresponding function `next` etc. in the port's scheme is called. That can do whatever it want and return whatever it thinks makes sense.

They remind me of LUA Metamethods, a partial implementation of it.

[18:51:06](#bwEVxXQdnHgAScaOiNwiVmXAjzrK3ah7oyv4mydhvWs) <gurzgri>:
Well, that's how ports worked from day 1 even in Rebol 2 times. And that's the way the ODBC scheme in commercial Rebol/Command worked. My scheme follows (mostly) what REBOL did (and goes beyond).

[18:53:25](#MUpvHwHDcx1_bKCiTERIRP84uDvei7FLFDbCdE2NBdM) <GiuseppeChillemi (GiuseppeChillemi)>:
I know, your project has born deep in past Rebol time , when no one has explained in the docs that those words works differently in ports. In the past I have become crazy trying do understand communication ports that topic. 

[18:53:37](#dvR0fr_SMD9c8m026RSgrm9K60Aqsp4S7wq8lKPZcNE) <GiuseppeChillemi (GiuseppeChillemi)>:
* I know, your project has born deep in past Rebol time , when no one has explained in the docs that those words works differently in ports. In the past I have become crazy trying do understand communication ports topic. 

[18:54:25](#C77zozpEQ2VmvwNmcCYO2otzqgVhMObzIyZ_2WOaywo) <GiuseppeChillemi (GiuseppeChillemi)>:
* > When you apply `next` or `copy` or `insert` etc. on a `port!` value, a corresponding function `next` etc. in the port's scheme is called. That can do whatever it want and return whatever it thinks makes sense.

They remind me of LUA Metamethods, a partial implementation of tehm

[18:54:32](#k96cLF_tSEWnGdw0l8EP3Mh26W17D3PE6ioyaLuu7w4) <GiuseppeChillemi (GiuseppeChillemi)>:
* > When you apply `next` or `copy` or `insert` etc. on a `port!` value, a corresponding function `next` etc. in the port's scheme is called. That can do whatever it want and return whatever it thinks makes sense.

They remind me of LUA Metamethods, a partial implementation of them

[18:54:59](#13KanFHDbiFPrK1WfzvqyXfVdmr3585JK8KEx7IYzn8) <gurzgri>:
"when no one has explained in the docs" How ports worked was well documented in REBOL 2 times and have nothing to do with my later works on REBOL 3

[18:55:56](#UpEItjRkG0NdsU4lARtnc4i-rK0fYrjxFdDrMmJxvX8) <gurzgri>:
Above, try with `st/state/window: 1`

[18:56:24](#D5WXOy1kACCP-aou-Acq_6M-AysQHTy8A4ag9x_UCIg) <gurzgri>:
What's up with that `halt` there?

[18:57:36](#AXIC6paNOX8vj2J6SPNSXsbiOKkX2bMWUR1yz0NghG0) <GiuseppeChillemi (GiuseppeChillemi)>:
Just an isolation attempt to figure out what was happening here:  `invalid id field in spec block`



[18:57:49](#57C9rrkRJoU3fi6u04xLx1P8KCUHyF63LO1FovgCu9I) <GiuseppeChillemi (GiuseppeChillemi)>:
It seems caused by `data: open st: open cn`

[18:58:47](#D1FArv__PRr4WXgWGCQ2m3mPAfJzelATSsmq-OzCzxw) <gurzgri>:
You were able to connect before. Nothing has changed with that I know of.

[18:59:52](#I6uVxspWUSuiElWqkqynw9KK-8Hoq6tqa6s5m5azkD8) <GiuseppeChillemi (GiuseppeChillemi)>:
It`s different: I am opening the connection and opening the statement: there are 2 `open`  while before I have used only one:

```cn: switch 'b-ok con

data: open st: open cn```

[19:00:13](#0W9rk5yOCx_NtSZRJryTUG8X-JU2E-Rk3ili3UqyYLE) <GiuseppeChillemi (GiuseppeChillemi)>:
* It`s different: I am opening the connection and opening the statement: there are 2 `open`  while before I have used only one:

```
cn: switch 'b-ok con

data: open st: open cn ;<\\\\\\\\\\\\\\\\\\\\\\\\\\\\
```

[19:01:04](#vouL8xdgoYJ5YO8c8F0eVc_HCtJ4_z6I7kJEDd1Td-w) <GiuseppeChillemi (GiuseppeChillemi)>:
* It s different: I am opening the connection and opening the statement: there are 2 `open`  while before I have used only one:

```
cn: switch 'b-ok con

data: open st: open cn ;<\\\\\\\\\\\\\\\\\\\\\\\\\\\\
```

[19:01:39](#LSd3r-iawJsQLyd8VJ5IT30QA2xmEi3uUq2lT37BM30) <gurzgri>:
But that is just you. You  open your connection in `cn: switch 'b-ok con` for reasons unbeknownst to me, then on `cn` you open a statement with `st: open cn`. I didn't say you should open a "something" from the statement. 

[19:02:32](#aqk7dL0Tms5wfsCKQyDTSwHzD7RoJAsUi0T3r4Gv850) <gurzgri>:
When I say `photos: open album: open odbc://album` I open a statement on a connection opend beforhand. Only two `open`s.

[19:02:44](#yoP3_H4tSw3iPyyyjfCCGBn8Xf3SCAUXWYXcPAW3TII) <gurzgri>:
* When I say `photos: open album: open odbc://album` I open a statement on a connection opened beforhand. Only two `open`s.

[19:03:29](#n0LQ_usxlN56farsIbcxuFIW_zUN_qxU3Ue4bhrkCU8) <gurzgri>:
I swear to you that in `switch 'b-ok con` you already `open` the connection.

[19:04:04](#bCMSUYyqYifsbX8c7CPwO6boQPSZRdx33FVP-gOui68) <GiuseppeChillemi (GiuseppeChillemi)>:
Pardon, you are right, the connection block  already contains an `open make port!` statement

[19:04:21](#1tDE4jKy_iM2twNeGzwd8p0OYxRkdrcjbdF8ojOayTk) <GiuseppeChillemi (GiuseppeChillemi)>:
> I swear to you that in `switch 'b-ok con` you already `open` the connection.

Right!

[19:04:30](#C7fivsjDJ8xnNLRNK5smlnDJ0VEhcAIyuXaN04ToDhg) <gurzgri>:
������

[19:09:15](#xLvaq7qSNq6PVODN6LUsXcNWtBQGcY0WPJLA-Wgm3ZQ) <GiuseppeChillemi (GiuseppeChillemi)>:
So is this correct?
```
columns: insert st  "select top 10000 * from cf where attributi is not null "


result: next st

probe pick st 'attributi
```
Because here:

```
insert photos "SELECT FileName, Image, Thumbnail FROM Photos LIMIT 1000"
== [file-name image thumbnail]
images: next photos                 ;-- retrieve first row
== [
    ["Me at the beach.jpg" deferred deferred]
]
picture: pick photos 'image
```

You perform  `next` on `photo` statement, like I do in `st` statement

[19:10:18](#X-_S9yHP7o1Q6SMDg6MPKHSGwBs-mmFAyZNyAHI_dls) <GiuseppeChillemi (GiuseppeChillemi)>:
* So is this correct?
```
columns: insert st  "select top 10000 * from cf where attributi is not null "


result: next st

probe pick result 'attributi
```
Because here:

```
insert photos "SELECT FileName, Image, Thumbnail FROM Photos LIMIT 1000"
== [file-name image thumbnail]
images: next photos                 ;-- retrieve first row
== [
    ["Me at the beach.jpg" deferred deferred]
]
picture: pick photos 'image
```

You perform  `next` on `photo` statement, like I do in `st` statement

[19:10:48](#26M_sjRZzu4ZUDTJX7m4U_yuM_z2vNSAJUCEwkYpEmQ) <gurzgri>:
✨ You've got it! 

[19:11:30](#UHAadfJQpqTCrkqyM8RHczDLD0LjKp41V0zL9G0SMMU) <gurzgri>:
Stop, no! Not again!

[19:12:21](#lluuSBfPvWFCwUFCrF9zKqa3NuPvUHiOFrNONVzmJqE) <gurzgri>:
No, no, no `pick result 'attributi`, it is `probe pick st 'attributi' please

[19:12:23](#trtxulTAw2O09M3cx61Q93LORAbyJ9FQQYVL7kzmqbg) <GiuseppeChillemi (GiuseppeChillemi)>:
One monent! Your are picking on `photos`!

[19:12:32](#IltZFi4jm3zFUHZsEL7dhvA67ltJ_QPmJqwuCKdw5LY) <GiuseppeChillemi (GiuseppeChillemi)>:
I have seen it!

[19:12:49](#CZFKTlJ7KrdGplyMZU0c-I5Zin0GZuBW5omARXValmg) <gurzgri>:
I was first!

[19:13:23](#WIanBc2nr52n-ydDE_fcTkRgSj2HuXk0RPOwN64AUeM) <GiuseppeChillemi (GiuseppeChillemi)>:
������

[19:14:26](#bbOPdW8DDhnSZw82caeLPsh00pZ3G22kYbZbN6zLFpM) <GiuseppeChillemi (GiuseppeChillemi)>:
I get `Right truncation of the string` or something similar

[19:14:31](#lrX4lif_V2VR6A1tX-7Rj9Sayt6A98ThuxQXOnwsBRA) <GiuseppeChillemi (GiuseppeChillemi)>:
No result

[19:14:50](#4t6vFObFKeOIhiotdp_VlvgdN7sN2RtnYkO5hvpn6Hs) <GiuseppeChillemi (GiuseppeChillemi)>:
* Not what I have expected

[19:17:39](#VC2y85zeCVwEGsxhkZ5_cgkigu8QGk0KmLPt6eqAzFI) <gurzgri>:
enable `--debug` and put everything in a gist. do `probe st/state/columns` too. Would be too much to post here. 

[19:22:42](#WASrPPb_PQCDi7aoOjCqZQlTKVhpmc4rB2APXAn8Fbc) <GiuseppeChillemi (GiuseppeChillemi)>:
Here it is my lord! https://gist.github.com/GiuseppeChillemi/f2499589d7ae4645f500dc1ac1f2e53c

[19:34:18](#d3PnUVmQKxq_QteF1hnKyzpKc-N2b4zZIoKohGQaHkg) <gurzgri>:
Add the lines `probe t/state/columns` and `st/state/debug?: yes` before `probe pick st 'attributi` and please rereun it a fresh session. The right truncation message is exepected, the long data is read in chunks, hence low level SQLGetDate doesn't return SQL_SUCCESS but SQL_SUCCESS_WITH_INFO and that info is, that the chunk just read isn't the whole thing already, so read another chunk ... In the end the should be SQL_SUCCESS though and no message. 

[19:34:43](#4GomS2pWh8R0PmSDDaPn6n-dEUniciPZPT22XKznADM) <gurzgri>:
* Add the lines `probe t/state/columns` and `st/state/debug?: yes` before `probe pick st 'attributi` and please rereun it a fresh session. The right truncation message is expected, the long data is read in chunks, hence low level SQLGetDate doesn't return SQL_SUCCESS but SQL_SUCCESS_WITH_INFO and that info is, that the chunk just read isn't the whole thing already, so read another chunk ... In the end the should be SQL_SUCCESS though and no message. 

[19:40:27](#rj4nPeb2pJ_A-aQm7UTrUBFmcPo6mqu0lyruWBMDaCA) <gurzgri>:
*rerun

[19:40:52](#DSVZ1a93i7Ll9dDDwSZXlbleV-FPqx92XEijD6rhqMA) <GiuseppeChillemi (GiuseppeChillemi)>:
Give me 30 minutes or less, I am having my lunch.

[19:41:11](#dDYBDZJzJmGBfQQwQYK6PhpNDVQaIGx12OaMcdR3OL4) <gurzgri>:
We're not in a hurry

[19:41:17](#Be6XsQu_2J1-f23Fkt-uDG3VyiJbx1LECayEJmhTJ7Y) <GiuseppeChillemi (GiuseppeChillemi)>:
I am just back at home from my office.

[19:41:51](#rJ5uI6xsw9h5tmnrYp5Vx97QXitKRgghL7kDk88FCms) <gurzgri>:
enjoy your lunch

[20:29:11](#r84wLBCvgpdiGtJbSeTFoVG2Cn6gRVmbmEsNPToiX34) <GiuseppeChillemi (GiuseppeChillemi)>:
Thank you, here is the requested debug information:
https://gist.github.com/GiuseppeChillemi/cee814c15ae18211fd2bdd8b0b1f806f

[20:29:52](#F_sj6wpGOZL-tkdWqjw80HEtc7KX1fMwMzPmmnsidIM) <GiuseppeChillemi (GiuseppeChillemi)>:
`Indice del descrittore non valido` = `invalid index descriptor`

[20:30:02](#ows13EPcr4vl1YIULNCi7HoA-lJHqZxk-Q90PYYOoyc) <GiuseppeChillemi (GiuseppeChillemi)>:
* `Indice del descrittore non valido` 

= 

`invalid index descriptor`

[21:23:45](#HEt8Q-sZInxTTlokillWB71Q_GSyUw1P5eZN1cTmkxg) <gurzgri>:
@bubnenkoff Pushed [odbc dbde8e71a] FIX: issue #4 (Param of type NONE! gets inserted as "1" instead of NULL).

That should allow you to insert `none` values.

[21:53:06](#vV0U-rk0JWx9MQeI4Q4EdW95m5eSCKJeSsvBBc_83LE) <gurzgri>:
@GiuseppeChillemi So `"Attributi"` is of SQL type 65526 = SQL_WLONGVARCHAR which should work and with size 1073741823 it's well in the integer! range, too. Why it's choking on the index with SQLSTATE `07009`I don't understand.

Next thing I'd like you try is a minimal example with only this column:
```
st: open cn: switch 'b-ok con
st/state/cursor: 'static
probe columns: insert/part st "select top 1 attributi from cf where attributi is not null" 1
st/state/debug?: on
probe records: next st
probe pick st 'attributi
close cn
```
The `insert/part` is just a shorthand for `st/state/window: 1`, that's not new.

[21:54:39](#de57EuE97US6xCD3ZiYLqtYDlKxAvQsBCi9LA9_Cocw) <gurzgri>:
I'll have look again with that. But not today.

[21:56:19](#jgagutEsAbIfdvd1MuAFPuxJfjhzPdHVkJYxCAcvuno) <gurzgri>:
But I noticed some (Improper column name translations)[https://github.com/gurzgri/red/issues/5) in your column, I'll address that too (cosmetics only).

[21:56:31](#6eRBleh_lrNVivFwKKqq64YxbrCfDQn9R7ZO6VrGE9s) <gurzgri>:
* But I noticed some (Improper column name translations)[https://github.com/gurzgri/red/issues/5] in your column, I'll address that too (cosmetics only).

[21:57:01](#rk0_vMTZnNRYyCylB9E7HjIbKFj-BSRd7seRznZtgUk) <gurzgri>:
* But I noticed some [improper column name translations](https://github.com/gurzgri/red/issues/5) in your column, I'll address that too (cosmetics only).

[21:58:21](#ujTW6Efi0lkziYLWHjbJuMa_CFpIy3aROtCyfWztQ9I) <gurzgri>:
* But I noticed some [improper column name translations](https://github.com/gurzgri/red/issues/5) in your columns, I'll address that too (cosmetics only).

[21:59:17](#Qi8g9QoYcWe1gkCt34FHhPUuT18jLgy7_zXISewKats) <gurzgri>:
* But I noticed some improper column name translations in your columns, opened https://github.com/gurzgri/red/issues/5 for that. I'll address that too (but that's cosmetics only).

[22:05:54](#1YWk_Kv7E37y0H3fiaIKpJBzAbjKjN1nDchhbMC3o84) <GiuseppeChillemi (GiuseppeChillemi)>:
If `SIZE` is expressed as bytes there us something strange. That colum contains attributes. which are composed of a group name, the group members and their flag. Actually max 50 members * 20 characters. Eve if they are stored as XML, I don't thing they could take 1 gigabytes.  XML is big, but not do big ������

[22:20:48](#AFOO6NXK8aEQ9vOpt5To_9O6msXWesaoO4z-xuX5H1o) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri https://gist.github.com/GiuseppeChillemi/b945ca418dff41a77812a0c8c47d4461

Here is the result. Goodnight.

## 8-Apr-2022

[15:48:51](#pxUze_ge-ENuJH-jmnmVsd2nBE5CdpXGsIzdP7kzYOo) <gurzgri>:
@GiuseppeChillemi I'm a bit out ideas - the driver complains that I'm trying to fetch the long data in the wrong column. I pushed a minor modification with a bit more debugging output. Please try that. Issue #5 is fixed.

[15:50:37](#bk1llue8o7BVnYtqKzJjPP-k5t8Ei17XxqHmmsosBUA) <gurzgri>:
1) Test with the above lines again please, and if this fails, please 2) do the same again but change `probe pick st 'attributi` to `probe pick st 1` beforehand.

[16:33:40](#PZ8Nmtp3pyzHJ5UeIxIIcJJ7Fa3xBxCprH_0brQn-mU) <gurzgri>:
Column Size is expressed in characters, 1'073'741'823 chars is exactly the maximum string length of an SQL Server NTEXT column. The actuals size in bytes is two times that length. Because (N)TEXTs and BLOBs "physically" aren't stored in the row they belong to but have their own out of line storage places in a database, restricting the length of such a column to a lesser number of characters often isn't necessary.

[17:55:20](#WL9FecxZMZLymMEnkJ7YQVVLP2YKvr0KunfYeyjriqs) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri  https://gist.github.com/GiuseppeChillemi/03c68ca837718f12eeab01f8e5ddcf93
None worked

[17:55:34](#gVqoxb9Iy-EfWxPG5bJFdd71VGrc_jcx3ZoOwKst_u8) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri  https://gist.github.com/GiuseppeChillemi/03c68ca837718f12eeab01f8e5ddcf93
None has worked

[17:57:00](#Zt9EPKUXArZ5tsqhAEH0Dr6_hOLS4tntflOz4qQJhBE) <GiuseppeChillemi (GiuseppeChillemi)>:
If you need, I could give you anydesk access to my machine.

[18:33:01](#muZJS4xuRc72KRcUVxcd8I0HlpVZGfOMzT9QrnOieJs) <gurzgri>:
For your connection `cn`, what is the value of `cn/state/info/"getdata-extensions"`? It might be limitation of SQL Server, PosrgreSQL e.g. discribes its capabilities as `[any-column any-order]` there.

[18:33:26](#IBCHI4PPOeS17sDz6Q5DnYj6PvERJVcJkyWKivLOLuU) <gurzgri>:
* For your connection `cn`, what is the value of `cn/state/info/"getdata-extensions"`? It might be limitation of SQL Server, PostgreSQL e.g. describes its capabilities as `[any-column any-order]` there.

[18:33:48](#4X9WVzQ1BdXiKyU1p3SUSImxNOpam8yeHO8rjPwJBUY) <gurzgri>:
An SQL Server might be pickier.

[18:33:59](#1xDsGvDRpA3plnprKQ9_dkwube-ifqpK4I3CmmLWFh4) <gurzgri>:
* And SQL Server might be pickier eventually.

[18:36:23](#X-VxIu6Ro4clAvPPBKcClqQfXIjoFm4o9JBDhdtP8bY) <GiuseppeChillemi (GiuseppeChillemi)>:
```
st: open cn: switch 'b-ok con
probe cn/state/info/"getdata-extensions"

>> do %odbc-test.red
[]
```




[18:43:25](#9xR9sMYSnhXqahmaSrhwrGI1aglfl7d39WiCcUlh1ug) <gurzgri>:
Then I know what‘s causing this.  Current implementation makes an assumption which is only correct when the above SQLGetData Extensions are available. That needs to be treated differently if the aren‘t.

[19:03:56](#nvR3JkdfwLJVWnRfSbwUvr4iFequZRX_Wr53sYpcQW0) <GiuseppeChillemi (GiuseppeChillemi)>:
I am here, call me when you need further testing. Database access is one of the pillars for Red professional use and as soon it goes out of alpha, (beta) as soon we could make nice business apps.

[19:07:12](#D0UdaJcvOMR5TUJaum4pIk3OT3HWoUWKv92kG_hOT-w) <GiuseppeChillemi (GiuseppeChillemi)>:
Currently, on Rebol I have a table browser with auto column size, which needs just the connection data and DB name. It needs very few changes to port to RED odbc and it will be great to create professional apps once data-grid will be here.

## 9-Apr-2022

[8:08:01](#3oXar9PIQEaZxwCYhyuCFGaUFGDWG4yDlus2EVGk_aY) <gurzgri>:
@GiuseppeChillemi You might have another take on this:
```Red
insert/part st "SELECT TOP 1 Attributi FROM cf WHERE Attributi IS NOT NULL" 1
```
should work now,
```Red
insert/part st "SELECT TOP 1 Attributi, CodiceIPA FROM cf WHERE Attributi IS NOT NULL" 1
```
expectedly doesn't work.
```Red
insert/part st "SELECT TOP 1 CodiceIPA, Attributi FROM cf WHERE Attributi IS NOT NULL" 1
```
should work.

That is because of 
> SQL_GD_ANY_COLUMN = SQLGetData can be called for any unbound column, including those before the last bound column. Note that the columns must be called in order of ascending column number unless SQL_GD_ANY_ORDER is also returned.
SQL_GD_ANY_ORDER = SQLGetData can be called for unbound columns in any order. Note that SQLGetData can be called only for columns after the last bound column unless SQL_GD_ANY_COLUMN is also returned.

(That's from the Microsoft ODBC documentation, I do not write poetry.)

The consequences for you probably are: You won't be able to simply `SELECT * FROM` with long data columns anywhere in the selected columns, you'll have to explicitly do `SELECT NormalCol1, NomalCol2, ..., NormalColN, LongData1, ... LongDataN` to put the columns holding long data at the end of the columns list.

Note that this is a restriction the database driver imposes, not the scheme implementation.

[8:19:56](#G6uQJrYj-2ilEvCmA47e8Z9cnwnAKq7m53Uryus7rBM) <GiuseppeChillemi (GiuseppeChillemi)>:
We have learnt something.

[8:20:10](#o80RL1yFUyPY86MBuvlrktJcR7C88Zuf2NWLUsX4HjA) <GiuseppeChillemi (GiuseppeChillemi)>:
I am going to try it

[10:32:13](#1G5MasdgLratLf-JBvb0JpiUUWVkU-rKQJUV6QJ4se4) <dsunanda (dsunanda)>:
SQLITE .... I've been playing with this recently. Red does not have anything as useful as Ashley's drivers for SQLite/Rebol [ http://www.dobeash.com/sqlite.html ]. But SQLite is surprisingly usable via CALL to SQLite's command line interface.
Very small example:
```
ut: copy ""
call/output {sqlite3 test.db  --csv "select * from demo order by country"} ut
load/as ut 'csv
== [["Alice" "Prof" "CA"] ["Bob" "M" "FR"] ["Eve" "Mx" "MX"]]
```
(For practical purposes it is probably better to have SQLite return JSON .... There's fewer issues when strings contain commas).

[13:41:50](#u5tR-a7WRLln2siyBH-CJFiBPLna3cgJbwJgeq8DIds) <GiuseppeChillemi (GiuseppeChillemi)>:
Thank you Sunanda. Ashley has always done a great work on Rebol. I use his Munge for everything. He has improved it over time and we are now at release 3.0.7. I have never used SQLite driver but I will take a look at using it on both Rebol and Red. Just to see different approaches.

[17:14:41](#DFF4w2ExUWLg2VN6kklsggUBtPATqWW4-7istaBpeRc) <dsunanda (dsunanda)>:
SQLite complements Red very well - it is a lightweight, zero-installation system (under Windows, just unzip a .DLL into a folder, and it'll work). Single user only - unless you take great care.
It's missing some useful parts of the latest SQL standard (I'd really like the temporal extensions right now) but it has pretty much everything else.
Lightweight GUI front end to it here: https://sqlitebrowser.org/

[17:26:01](#yELWSmHC9yUtfGFcIXLH3_TWosgaCgZF6KQZTEoRluQ) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri 
We are near: I see the attributes but I get an error: there is an if without a block somewhere!

```
02D51110:  3c00 7200 6f00 7700  7300 3e00 3c00 7200  6f00 7700 2000 6100  7400 7
400 7200 6900      <.r.o.w.s.>.<.r.o.w. .a.t.t.r.i.
02D51130:  6200 7500 7400 6f00  3d00 2200 3700 3600  2200 2f00 3e00 3c00  7200 6
f00 7700 2000      b.u.t.o.=.".7.6."./.>.<.r.o.w. .
02D51150:  6100 7400 7400 7200  6900 6200 7500 7400  6f00 3d00 2200 3100  3000 2
200 2f00 3e00      a.t.t.r.i.b.u.t.o.=.".1.0."./.>.
02D51170:  3c00 7200 6f00 7700  2000 6100 7400 7400  7200 6900 6200 7500  7400 6
f00 3d00 2200      <.r.o.w. .a.t.t.r.i.b.u.t.o.=.".
02D51190:  3400 3300 2200 2f00  3e00 3c00 7200 6f00  7700 2000 6100 7400  7400 7
200 6900 6200      4.3."./.>.<.r.o.w. .a.t.t.r.i.b.
02D511B0:  7500 7400 6f00 3d00  2200 3300 3300 2200  2f00 3e00 3c00 7200  6f00 7
700 2000 6100      u.t.o.=.".3.3."./.>.<.r.o.w. .a.
02D511D0:  7400 7400 7200 6900  6200 7500 7400 6f00  3d00 2200 3300 3400  2200 2
f00 3e00 3c00      t.t.r.i.b.u.t.o.=.".3.4."./.>.<.
02D511F0:  7200 6f00 7700 2000  6100 7400 7400 7200  6900 6200 7500 7400  6f00 3
d00 2200 3300      r.o.w. .a.t.t.r.i.b.u.t.o.=.".3.
02D51210:  3500 2200 2f00 3e00  3c00 7200 6f00 7700  2000 6100 7400 7400  7200 6
900 6200 7500      5."./.>.<.r.o.w. .a.t.t.r.i.b.u.
02D51230:  7400 6f00 3d00 2200  3100 3000 3700 2200  2f00 3e00 3c00 2f00  7200 6
f00 7700 7300      t.o.=.".1.0.7."./.>.<./.r.o.w.s.
02D51250:  3e00
                   >.
--------------------------------------------------------------------------------
---------------------------------------------------
{<rows><row attributo="76"/><row attributo="10"/><row attributo="43"/><row attri
buto="33"/><row attributo="34"/><row attributo="35"/><row attributo="107"/></row
s>}
*** Script Error: If is missing its cond argument
*** Where: close
*** Near : close cn If
*** Stack: do-file

>>
```


[17:34:10](#A89gM3HWprPEJRA-iU74ctOovXJOxIANrTDKcfzh7ek) <GiuseppeChillemi (GiuseppeChillemi)>:
Also;:
ALL 3 version works! As obvious, where:  
```insert/part st "SELECT TOP 1 CodiceIPA, Attributi FROM cf WHERE Attributi IS NOT NULL" 1``` 
I have changed :
```
pick st 1 
```
to 
```
pick st 2
```


[17:34:39](#1rAW-f13jYBV9ii2NmT372G_h8wRV0iLEBzB2RyRF3U) <GiuseppeChillemi (GiuseppeChillemi)>:
It works even:
```
probe pick st 'attributi
```

[17:34:53](#CZh5CXCFw1Q60ezBYo6FBu3GzKRjrTlPDEcDe447f5c) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also;:
ALL 3 version works! As obvious, where:  
```insert/part st "SELECT TOP 1 CodiceIPA, Attributi FROM cf WHERE Attributi IS NOT NULL" 1``` 
I have changed :
```
probe pick st 1 
```
to 
```
probe pick st 2
```


[17:36:28](#qU_Oq_20Tv9KM75N55FUFLGhT5ECjuBNgp6z0D2-IOk) <GiuseppeChillemi (GiuseppeChillemi)>:
Last note: I have also tried `pick st  1`where `select CodiceIPA , Attributi` and I confirm it CORRECTLY returns `none`.


[17:54:32](#ZtTqOuqzKhbPtS3XRwcOiFSCaZNLM4QpmvZXpxdlDj4) <GiuseppeChillemi (GiuseppeChillemi)>:
I have tried this:
```
insert/part st "SELECT TOP 10 CodiceIPA, Attributi FROM cf WHERE Attributi IS NOT NULL" 1
st/state/debug?: on
probe records: next st
probe records: next st
probe pick st 2 ;<<<<< Now it is ok ������
```

This is what I get:

```
[block]

--------------------------------------------------------------------------------
---------------------------------------------------
0035A220:  28c4 3500 c000 8f01  2000 6400 6900 2000  7300 7400 7200 6900  6e00 6
700 6100 2000      (Ä5.À... .d.i. .s.t.r.i.n.g.a. .
0035A240:  6400 6900 2000 6300  6f00 6e00 6e00 6500  7300 7300 6900 6f00  6e00 6
500 2000 6e00      d.i. .c.o.n.n.e.s.s.i.o.n.e. .n.
0035A260:  6f00 6e00 2000 7600  6100 6c00 6900 6400  6f00 2e00 0000 0000  0800 0
008 2a8b 0600      o.n. .v.a.l.i.d.o...........*...
0035A280:  789d 3500 9805 8f01  6f00 6e00 6e00 3a00  2000 3000 3400 3000  3500 3
900 3500 4200      x.5.....o.n.n.:. .0.4.0.5.9.5.B.
0035A2A0:  3800 0000 0000 0000  0200 0103
                   8...........
--------------------------------------------------------------------------------
---------------------------------------------------

--------------------------------------------------------------------------------
---------------------------------------------------
0035A2E8:

--------------------------------------------------------------------------------
---------------------------------------------------
[
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
]
[]
*** Script Error: ODBC error: ["24000" 0 {[Microsoft][Driver Manager ODBC] Stato
 del cursore non valido.}]
*** Where: ctx||440~fetch-value
*** Near : pick st 2 close cn If
*** Stack: do-file

>>
```

Here is the debug output: https://gist.github.com/GiuseppeChillemi/884b519f8367fe9096b198c548605685


[17:54:58](#_x4H2fGcZhCqbbBR3uvU4phqOcUPY5tEcgOk6fUWRR8) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have tried this:
```
insert/part st "SELECT TOP 10 CodiceIPA, Attributi FROM cf WHERE Attributi IS NOT NULL" 1
st/state/debug?: on
probe records: next st
probe records: next st
probe pick st 2 ;<<<<< Now it is ok ;-)
```

This is what I get:

```
[block]

--------------------------------------------------------------------------------
---------------------------------------------------
0035A220:  28c4 3500 c000 8f01  2000 6400 6900 2000  7300 7400 7200 6900  6e00 6
700 6100 2000      (Ä5.À... .d.i. .s.t.r.i.n.g.a. .
0035A240:  6400 6900 2000 6300  6f00 6e00 6e00 6500  7300 7300 6900 6f00  6e00 6
500 2000 6e00      d.i. .c.o.n.n.e.s.s.i.o.n.e. .n.
0035A260:  6f00 6e00 2000 7600  6100 6c00 6900 6400  6f00 2e00 0000 0000  0800 0
008 2a8b 0600      o.n. .v.a.l.i.d.o...........*...
0035A280:  789d 3500 9805 8f01  6f00 6e00 6e00 3a00  2000 3000 3400 3000  3500 3
900 3500 4200      x.5.....o.n.n.:. .0.4.0.5.9.5.B.
0035A2A0:  3800 0000 0000 0000  0200 0103
                   8...........
--------------------------------------------------------------------------------
---------------------------------------------------

--------------------------------------------------------------------------------
---------------------------------------------------
0035A2E8:

--------------------------------------------------------------------------------
---------------------------------------------------
[
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
    [none deferred]
]
[]
*** Script Error: ODBC error: ["24000" 0 {[Microsoft][Driver Manager ODBC] Stato
 del cursore non valido.}]
*** Where: ctx||440~fetch-value
*** Near : pick st 2 close cn If
*** Stack: do-file

>>
```

Here is the full debug output: https://gist.github.com/GiuseppeChillemi/884b519f8367fe9096b198c548605685


[17:56:09](#G0pWMi_42PyLmSriNPZbjqM1pNAcjzjLcn7uGtCAwAg) <GiuseppeChillemi (GiuseppeChillemi)>:
The english for the error on the buffer is "Connection string not valid".

[17:56:19](#KyZLrZ6PnRG0s3ZGdu5KlT1YvrTRb5TfHRiIwEwAjaw) <GiuseppeChillemi (GiuseppeChillemi)>:
* The english for the error on the buffer is `Connection string not valid`

[19:10:46](#Nargin15rmkCXSvIfFouZknnmQUbr9bCcPG1WI-2r_E) <gurzgri>:
1. I'm pretty confident that the `If` which is missing it's condition argument isn't mine. 2. To make sense out of the debugging output I'd be interested in your code. The full code beginning at the `cn: open ...`, not just parts. 3. If your connection string is invalid then you probably should try with a valid connection string. I thought we'd left the connection step behind us already. How it is that this comes up again I can't tell without the code.

[19:11:05](#8_dyAHSoukcUY_I5sXEzaL-28HarDGjZicBmeKcEtds) <gurzgri>:
* 1. I'm pretty confident that the `If` which is missing it's condition argument isn't mine. 
2. To make sense out of the debugging output I'd be interested in your code. The full code beginning at the `cn: open ...`, not just parts. 
3. If your connection string is invalid then you probably should try with a valid connection string. I thought we'd left the connection step behind us already. How it is that this comes up again I can't tell without the code.

[21:40:06](#nLaMiSG4g-NWDZfr6oq5uxD3bH85SMnVPFkN41wsOE0) <GiuseppeChillemi (GiuseppeChillemi)>:
```
st: open cn: switch 'b-ok con
probe cn/state/info/"getdata-extensions"
st/state/cursor: 'static
insert/part st "SELECT TOP 10 CodiceIPA, Attributi FROM cf WHERE Attributi IS NOT NULL" 1

st/state/debug?: on
probe records: next st
probe records: next st
probe pick st 2;'attributi
close cn
```

[21:40:25](#qSTG9SuLKkHL11m4zlR_7JCihYpOnbYmsUWGhKKVofg) <GiuseppeChillemi (GiuseppeChillemi)>:
Here it is

## 10-Apr-2022

[9:02:34](#eCo-esN1YxWcfckETMVNLo1CynxaHUJDFF-ae5u6poc) <gurzgri>:
Tracked it down: The code handling the `insert/part`shorthand was somehow missing, the window therefore was still defaulting to 10 rows. These where fetched with the first `next st` and for the second `next st` there were no more rows left because of `TOP 10`. Hence "invalid cursor state". Pushed fix.

[11:25:32](#IhqJzyEWt9VigL_idQafbbd-e04hHGy09kO3t6qpuG0) <gurzgri>:
And note that the design will change slightly with the next commits: You won't we forced to fetch with `insert/part ... 1` as I already have full cursor movements implemented here. After fetching a rowset of the size you like, you'll be able to move and position the cursor in the rowset whereever you want and can then `pick` the desired column from there.  

[11:25:41](#aQfDQi78lPTPuDPXkpIIyJrNgV_whfXrb2ziTqxTzUU) <gurzgri>:
* And note that the design will change slightly with the next commits: You won't be forced to fetch with `insert/part ... 1` as I already have full cursor movements implemented here. After fetching a rowset of the size you like, you'll be able to move and position the cursor in the rowset whereever you want and can then `pick` the desired column from there.  

[11:25:42](#aMa6pxVlaF8nXXvd1-9WHwA1iUsSkGVDToOyeBbea8I) <GiuseppeChillemi (GiuseppeChillemi)>:
I am feeling like being 25 years ago, sending emails to Nils Bandener of Amiga DB Fiasco, debugging his software.

[11:27:40](#BEWFuub1YBrg2qVLp3FddNwxgW36U2OvK8Ia32OmezY) <gurzgri>:
The database really was named "Fiasco"? Needs a good portion of humor to call your software so.

[11:28:20](#29Xdr3EYr_ub7vZU2kWmYj6hdf173k4fcd2_UPVhkD4) <GiuseppeChillemi (GiuseppeChillemi)>:
Cooperating, we have made a nice work and Fiasco was fully debugged. So I have adopted it in my company as the first DB to keep customers and print invoices.

[11:28:47](#4bPtJRu68LOAknMpZ9d1_xyrMJWAbvZUo2BRfXH6yUY) <gurzgri>:
Well, ODBC gets really complex fast if won't support only the most basic stuff. Lots of possibilities for bugs ...

[11:29:09](#r8TIrUwtrS9Vh0NzWGsfugl3jTyAsxVaLhO0koobApU) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes! http://nl.aminet.net/biz/dbase/Fiasco_eng_doc.readme

[11:31:03](#EnDC8v8EPFUhMpPldky9_tCLRbP0iV0v6M5CW5uMYGU) <gurzgri>:
Cool, so you only need to implement a Fiasco ODBC driver and soon you'll be able to access you records from 25 years ago with Red ... ������

[11:31:16](#Bo8vSWKe3M6FN9-SPBGZBXY0PGlELp5H3F_8z9lfUPE) <gurzgri>:
* Cool, so you only need to implement a Fiasco ODBC driver and soon you'll be able to access your records from 25 years ago with Red ... :D

[11:59:47](#brnXK3jVvodnQQEnWGm9_46U-AnzScGKjh1sDOrPfEA) <GiuseppeChillemi (GiuseppeChillemi)>:
The archive is lost but that's another story. Once my father  come to the beach during summer and told me he has put the Amiga in the town trashcan. I asked him why and he has answered "because you have told me it is broken".  It was just an Hard Drive CRC error. I have run with my car to recover it but when I have moved the pile of trash bags, I have seen it with trash liquid falling inside hit. It was impossible to recover. I still miss that Amiga 1200 with 68030, HD and 8MB. Pure nightmare for an Amiga lover. I still miss it!

[17:02:33](#Z4IoSnoj1gdrNd_HZcd-UPDY-NkxLTSfYEPXlQJmM0A) <gurzgri>:
Yeah, that sounds bad indeed. I still have my Amiga 4000 in the basement, even if it hasn't been turned on for way more than a decade, I can't decide to throw it away.  

[17:43:03](#5vAE8jOe7feY99FSD630tywjEM0XQiuWERNaMxqb_t8) <GiuseppeChillemi (GiuseppeChillemi)>:
Nooo, send it here! I have many Amiga things that are waiting a new home!

[17:47:42](#dud6RtQf9QDhfQl1_TifPkCoT00NdtiJ7tbZypH2gVU) <gurzgri>:
Sorry, but I can't decide to *give* it away, too :)

[18:13:19](#kIBhEal2V1-QikafACEaT0g1jruOeZMHGrk3v9zS5t0) <GiuseppeChillemi (GiuseppeChillemi)>:
Just check for battery leaks or your motherboard, as it could be destroyed from Varta daemon which plagues the old Amiga computers. Search on internet for Varta Amiga Battery Leaks, people have found holes when taking the machine out of basements.

[21:30:20](#4ega_M9OPHLsZ_UU0DQue5m1eAvzDWL3YafsFW8fV2I) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri 

```
info: 10025 async-notification
actor/open: statement
OPEN-STATEMENT [
        SQLAllocHandle 0
        allocate fetched, 4 bytes @ 002C0598
]
[block]
SET-STATEMENT [
        SQLSetStmtAttr 0
]
actor/insert
*** Script Error: all does not allow logic! for its conds argument
*** Where: all
*** Near : entity
*** Stack: do-file

>>
```
Full output here
https://gist.github.com/GiuseppeChillemi/db00dced4d6cd547619efebce6369c89

[21:38:00](#4uVogvYdQiE9wQIHjTyOgjBrxoZcon4oXd0fwuNxWXI) <GiuseppeChillemi (GiuseppeChillemi)>:
And I have a request: would you please add an option to let it output the debug info to a file? The consolle you have pointed it is only for Window 10

[22:08:56](#KCk2QRQoIAy6jpWyOQ8LWZkGTF1nU0KtAbtYLszgec8) <gurzgri>:
Surely I won't, it's debugging output only, I have no need to reinvent the wheel for that. If you don't like copying from the console and don't like to [increase the cmd.exe scroll buffer](https://superuser.com/questions/378313/windows-command-prompt-how-do-i-increase-my-buffer), then why not simply use Windows cmd stdout and stderr redirection as in `.\console.exe --do script.red > script.log 2>&1` instead of running the script interactively in the Red console?

[22:18:34](#_QEuTf0Dfdt-RNebplGh_0k_c0Gm9xgRoODDIbzSdLo) <gurzgri>:
Sorry, the last fix was only one line and yet I managed to commit a typo. Pushed "FIX: typo in insert/part shorthand window setting" just now.

[22:30:14](#PxGurxshdEtPFAsJExsWfEOE-zFeONX3rPJ5K5piUdA) <GiuseppeChillemi (GiuseppeChillemi)>:
Because I didn't know all those things can be done. ������

[23:17:03](#002dOi8KAxDG70xSB72-xgtxWrgWDFHwn1i5oGhJ988) <gurzgri>:
That‘s something every „modern“ OS can do. Amiga too was able to do it from day one.

[23:51:09](#WDpW1nTZPK-SmlVThSnjHpwuJ_UexdZKWoyxZhzea8I) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, but msdos console was perceived from me as older than Amiga!

## 11-Apr-2022

[0:08:55](#9YvjEo2fa1uZns_WgaHN7O8Lx7fwwq1HWnfgxDjJYFc) <GiuseppeChillemi (GiuseppeChillemi)>:
`if is missing its cond argument`
https://gist.github.com/GiuseppeChillemi/32f11f8f28496f911d26f505e7914695

[0:09:09](#ZyTtNIb0NHU3mdu_sOqvu_iWfZpgihMH6BqMl1L4A5Y) <GiuseppeChillemi (GiuseppeChillemi)>:
Its late, time to go to bed.

[0:09:16](#eecXsTSs5W6HMh_5X6eXA7KRA3bcr8h0_LTdTvDDEzU) <GiuseppeChillemi (GiuseppeChillemi)>:
* It's late, time to go to bed.

[5:42:59](#gj3YITGITim9HCCcqKPlrInBmVH0xxsQ_wA5yC8GhYQ) <gurzgri>:
According to the log it already works. The If `*** Near: close cn If` seems to come from your code?!

[7:42:36](#xW5CiGVos1r_xsI0t7LOCtQD5BYNCikk4o0x3z0nlQg) <GiuseppeChillemi (GiuseppeChillemi)>:
I will take a look, maybe it's an offscreen code problem.

[8:30:25](#GKeeHY_FZgNh_6ospIE3jm8PId2ErbPc2VbO6y2IWpM) <GiuseppeChillemi (GiuseppeChillemi)>:
[![image.png](https://files.gitter.im/6234feab6da037398492a62a/4CZV/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/4CZV/image.png)

[8:32:11](#eSn32f3LJ93DP8LuMVlRKHX4j-jvzHzcEBhwG6rEDU4) <GiuseppeChillemi (GiuseppeChillemi)>:
I apologize, there was an `IF` camouflaged near a comment with near the same color of the comment.

[8:32:47](#JBm33FO8bgL-PLoi-Lxq0402QjSF5K3F5ygMLSVMeM4) <GiuseppeChillemi (GiuseppeChillemi)>:
(And it was also too late to have full brain functionality)

[8:32:55](#czwN4jgU3Na3eN1gd0Cz0fLa9ECik0GpeC-wt7eTFRc) <GiuseppeChillemi (GiuseppeChillemi)>:
* (And it was also too late to have full brain functionality ;)

[8:33:17](#zn8yHbYwcIoO6a9B896_vOLx1eB6Z2PQUmO2Skrz-5Y) <GiuseppeChillemi (GiuseppeChillemi)>:
* (And it was also too late to have full brain functionality :-(   )

[8:33:27](#QHPxEEgduitK1iRPqG7Z2v06cts0gxHWmMeq_ZzhbQY) <GiuseppeChillemi (GiuseppeChillemi)>:
* (And it was also too late to have full brain functionality :-(  .... )

[8:33:43](#BaPaI45dLPmmU5TAkG9th1flA60s-3SRTDZJvexBU2o) <GiuseppeChillemi (GiuseppeChillemi)>:
* (And it was also too late to have full brain functionality :-(                 )

[8:33:58](#y2cjQxnjgjsAfl-Yoetq77UzTdpl_CZE0WYf1Y-an_4) <GiuseppeChillemi (GiuseppeChillemi)>:
* And it was also too late to have full brain functionality :-(                 

[9:01:50](#WA5n1f4YTWsg-NOQGnszFmS4yailOnc6g2r-fvzIcNs) <GiuseppeChillemi (GiuseppeChillemi)>:
I have just changed the script to test Red ODBC Further:

```
st: open cn: switch 'b-ok con
probe cn/state/info/"getdata-extensions"
st/state/cursor: 'static
insert/part st "SELECT TOP 15 Attributi, CodiceIPA FROM cf WHERE Attributi IS NOT NULL" 10;(1) <<<----

st/state/debug?: on
probe records: next st;<<<----- (2)
print ["First round, length: " length? records]
probe records: next st;<<<----- (3)
print ["Second round, length:" length? records]
probe records: next records;<<<---- (4)
print ["Next on RECORDS, length: " length? records]
Print "Attibruti Value:"
probe pick st 1;'attributi
close cn
```

On point 1 I ask SQL to return 15 records with a Red ODBC statement window of 10.

The returned block length was `10`, because it matched the window size. In fact, at the subsequent `NEXT` at point 3, block length was only 5. 
Using `NEXT` on block instead of a statement, I get 4.


[9:02:09](#N6EvQqEJb86mVmJLTseGesANKPvXQmwWt72GNNOPQdY) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, I have understood the working.

[9:06:29](#WGU1PbFnkyfIALMrPOBj9xjbzLs4s9y2UHAk0198pv4) <GiuseppeChillemi (GiuseppeChillemi)>:
So, if I issue another:
```
probe records: next st
```
I get `[]` as results from the statement because there are no more records

[9:08:34](#CWO6vEoTi5wG9TEz0zG94hm33cy8tqKwGxJ4ac-7Pag) <GiuseppeChillemi (GiuseppeChillemi)>:
But, is it normal that if I try to `PICK st 1` when there are no more Records, I get an `INVALID CURSOR STATE`  from the ODBC driver and not `none` or a Red `error!`

[9:08:48](#457jxxM4n3ZW5ad-pFY-H5lmjBHl8sMigf366U8rrx0) <GiuseppeChillemi (GiuseppeChillemi)>:
* But, is it normal that if I try to `PICK st 1` when there are no more Records, I get an `INVALID CURSOR STATE`  from the ODBC driver and not `none` or a Red `error!`   ?

[9:09:18](#E-O2ox3goXQKT3CXCapRb7SSkyxHqMdpOdV41iMgSqU) <GiuseppeChillemi (GiuseppeChillemi)>:
```
*** Script Error: ODBC error: ["24000" 0 {[Microsoft][Driver Manager ODBC] Stato
 del cursore non valido.}]
*** Where: ctx||440~fetch-value
*** Near : pick st 1 close cn
*** Stack: do-file
```


[9:10:08](#71Jus5LpP4tOeLj7b5x42unRJiEqLUbaqEuKhBPso2g) <GiuseppeChillemi (GiuseppeChillemi)>:
* But, is it your intended working that if the code tries to `PICK st 1` when there are no more Records, it gets an `INVALID CURSOR STATE`  from the ODBC driver and not `none` or a Red `error!`   ?

[9:10:20](#eshaWy41JZ52BFw8pMJMHBHQ0479EX0abbXmx-LBQHM) <GiuseppeChillemi (GiuseppeChillemi)>:
* But, is it your intended working that if the code tries to `PICK st 1` when there are no more Records, it gets an `INVALID CURSOR STATE`  from the ODBC driver and not `none` or a Red `error!`?

[9:55:03](#g2aIkJvKWzr6L9Rn3Cw4PVnQyKQvoayM4F2zhWIJQQ4) <bubnenkoff (Dmitry Bubnenkov)>:
Remember me please steps to get odbc-branch work. After `git pull` I run next command and got an error: 

```
>> do/args %red.r "-c -e --debug %/d/code/zakupki/parser-v2/XMLParser.red"
** Access Error: Cannot open /C/red-odbc/system/red.r
** Near: do/args %red.r {-c -e --debug %/d/code/zakupki/parser-v2/XMLParser.red}
```

[12:08:40](#sQcCCBfwdLP3xxBKxQWVZwAeVYyIumfMPMtF82wrlYM) <GiuseppeChillemi (GiuseppeChillemi)>:
Go in the `red-odbc` directory,  copy there  `Rebol` open it, and write one of these: (just one)

Console
```
do/args %red.r "-r %environment/console/CLI/console.red"
```
Debug Console
```
do/args %red.r "-r --debug %environment/console/CLI/console.red"
```
Gui console
```
do/args %red.r "-r -t Windows %environment/console/GUI/gui-console.red"
```


[12:09:05](#4ybISbgzIYltfGiERcIvm0NYOWxjfihaEbPSrml8MmA) <GiuseppeChillemi (GiuseppeChillemi)>:
* Go in the `red-odbc` directory,  copy there  `Rebol` open it, and write one of these: (just one)

*Console*
```
do/args %red.r "-r %environment/console/CLI/console.red"
```
*Debug Console*
```
do/args %red.r "-r --debug %environment/console/CLI/console.red"
```
*Gui console*
```
do/args %red.r "-r -t Windows %environment/console/GUI/gui-console.red"
```


[13:11:00](#tfKZeXqtRK1l1zDJMrYGwfmy2dhQiGN1bb42jWr0BmA) <bubnenkoff (Dmitry Bubnenkov)>:
thanks!

[13:49:14](#aOhl2bLNH55XdAC6EKA8DxH3B2L6pExD28k5hTauhPg) <GiuseppeChillemi (GiuseppeChillemi)>:
You are welcome

[16:22:21](#O1-SW9Ml1pSvC-iA67-k_YpebJqiLBbVzLsvuVst17g) <bubnenkoff (Dmitry Bubnenkov)>:
I rewrote my code to prepared statements .But now on big file (long time to parsing) I am getting error:
```
*** Script Error: ODBC error: ["HY000" 1 {server closed the connection unexpectedly^/^-This probably means the
*** Where: ctx||610~execute-statement
*** Near : 'any-string!
```

[16:22:26](#Am49qb4hcG3zDbFMdvtDnljS6Q4Z--w1yMgqHOHdVi0) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/K6oA/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/K6oA/izobrazhenie.png)

[19:16:14](#Z_eXbIum-ztjSozBacnlpYXnfzxiyB6KMabhn0TLHi0) <gurzgri>:
@bubnenkoff No idea. I don't know what it means that you rewrote to "prepared statements". With odbc://, all statements get prepared, I never SQLExecDirect. So, only two hints: First, the `/deep` refinement as used in your screen shot is superfluous. Second, insert values of type `unset!` aren't (and probably won't ever be) supported, I can't image a matching SQL type.

[19:17:38](#jxHYaBHjecBDIsTwmj9FD9EGurlhiEf-C71tHCgb3bM) <gurzgri>:
At minimum I gave you two times the tip to `probe` more, yet you always come with code `print`ing things.

[19:21:39](#INyhqDmEziQfz-u9emtWvtLd8iPJF284x1EWX6a5xxw) <gurzgri>:
@GiuseppeChillemi Polishing things now would be throw away work before design and functionality haven't settled.

[20:51:01](#0IiaT_-kv1C5stonhOs45ohzWOF4C_AFl8WBksxZtwQ) <GiuseppeChillemi (GiuseppeChillemi)>:
So, no definitive answer for `pick` on "out of range" record. Not a problem, I will wait for thing that will stabilize. 

[20:51:15](#yqRtcBZC70EcaWReK9S1DDyce2tDyt-lFdOihVqNdvA) <GiuseppeChillemi (GiuseppeChillemi)>:
* So, no definitive answer for the error on `pick` on "out of range" record. Not a problem, I will wait for thing that will stabilize. 

[20:51:24](#Ur_49fi1fvnLerai7Q8KAlR2gQVcgsBDcBH0oHCyIOU) <GiuseppeChillemi (GiuseppeChillemi)>:
* So, no definitive answer for the error on `pick` "out of range" record. Not a problem, I will wait for thing that will stabilize. 

[20:51:41](#F0oVKhdU6Po24l2u6_Xdo-8cKANNszuMIcpl-Xat4vM) <GiuseppeChillemi (GiuseppeChillemi)>:
* So, no definitive answer for the error on `pick` "no record". It's not a problem, I will wait for thing that will stabilize. 

[20:51:58](#gJ8B5YTnwja_AzhiAhVZENkoT9Wmbx-Jhi9NEIa690U) <GiuseppeChillemi (GiuseppeChillemi)>:
* So, no definitive answer for the error of `pick` on "no record". It's not a problem, I will wait for thing that will stabilize. 

[20:52:05](#whRN8K1jWsxxaWZWp3wJK-sENPF-fmXtDp1As7f4VlQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* So, no definitive answer for the error of `pick` on "no record". It's not a problem, I will waits for thing that will stabilize. 

[20:52:34](#jtgolZzXAduRskqZs1EgjUA_YBZx62-EPZEnpmwk6PU) <GiuseppeChillemi (GiuseppeChillemi)>:
* So, no definitive answer for the error of `pick` on "no record". It's not a problem, I will wait for thing that will stabilize. 

[20:52:40](#KStQeBmUaMebVktX1KSdQD7tAVKieId_KBi3czaJB1A) <GiuseppeChillemi (GiuseppeChillemi)>:
* So, no definitive answer for the error of `pick` on "no record". It's not a problem, I will wait for things that will stabilize. 

[20:52:58](#6ObJIaN2Sb_1tFVPoKeDTx7xUPZTRNyWMNQVKAqsfag) <GiuseppeChillemi (GiuseppeChillemi)>:
* So, no definitive answer for the error of `pick` on "no record". It's not a problem, I will wait for the time when things will stabilize. 

[20:59:12](#diQoMC4v83B3zavcPDtiF07vR458SMlTrJT_3CeSUho) <gurzgri>:
Well, if you think it thru then you should see that returning a value of type `none!` is not an option, as it would be indistinguishable from a `NULL` value in a column, because these are returned as `none`. The remaing question is: What difference do you see between the current `Script error` and a Red `error!`? There is none.

[21:03:03](#czNs-tChmD7lvWS-05y3A1lzjt6nprHdHfqEFxueuuw) <gurzgri>:
BTW: You're `pick`ing by number. Meanwhile, have you tried `pick`ing by column number, too? It should work equally well and make your code more readable.

[21:06:52](#IyFqx-30k-i4Rdo1nR3BBbTFSWsnkS28AaVXjAaQuiY) <GiuseppeChillemi (GiuseppeChillemi)>:
I have kept using pick just because you have initially suggested using it, so I have "obeyed" and on all the following tests I have used `pick`, when there was the need to debug.  I prefer too using column name.

[21:09:15](#mnNFvzs1pziJUPCLZvaj0q8dKMirJjL6Egn1ZI4H_Zs) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have kept using `pick` just because you have initially suggested using it, so I have "obeyed" and on all the following tests I have used `pick`, when there was the need to debug.  I prefer too using column name.

[21:09:46](#fSpA31ofCuoxNgKtMuSqjhs4mt68vxDRzdy8mSGpaZI) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have kept using `pick` just because you have initially suggested using it, so I have "obeyed" and on all the following tests I have used `pick`, when there was the need to debug.  But, I prefer too using column name!

[21:09:57](#glXYTSG0b8eJQfArhj15KrSm5N8Xqk3SyckIdA0iNeg) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have kept using `pick` just because you have initially suggested using it, so I have "obeyed" and on all the following tests I have used `pick`, when there was the need to debug.  But, I prefer using column name too!

[21:17:49](#uMNK82tC_s6-H_ZWYHAtse-Hkvaup1SE0XU43RTEbSY) <gurzgri>:
That was suggested only to check if "by number" makes a difference over "by column word" for you. As soon as it became clear that none of them worked, that reasoning has gone. Readability is so important, you just can't overestimate it when writing.

[21:18:26](#V_lMjZFkqKM3S5luMPvj-6fo6_6Z_ACpesThf9wdLes) <GiuseppeChillemi (GiuseppeChillemi)>:
In fact, I don't like the number option. 

[21:22:20](#z2bEOTM4aGMLyG9FAnKBE42FRX-qSK51TyjmAXqYOIY) <GiuseppeChillemi (GiuseppeChillemi)>:
About this: 
> What difference do you see between the current Script error and a Red error!? There is none.
I was unsure you were handling the ODBC error as Red error. It could be an unhandled one that crashed whole Red. Red error on `Pick` is a good option, but if coders use `attempt` to pick a column, they end in the same `none` return value.

[21:22:28](#89ANQ7Ux_pj3E2K9nRmylApbRmKmZUTEpb7yhkvtSCY) <GiuseppeChillemi (GiuseppeChillemi)>:
* About this: 
> What difference do you see between the current Script error and a Red error!? There is none.

I was unsure you were handling the ODBC error as Red error. It could be an unhandled one that crashed whole Red. Red error on `Pick` is a good option, but if coders use `attempt` to pick a column, they end in the same `none` return value.

[21:22:39](#u1YRuJRatlToJyBnXmzzKjUEWzX0dZRocOCdFsYZVHU) <GiuseppeChillemi (GiuseppeChillemi)>:
* About this: 
> What difference do you see between the current Script error and a Red error!? There is none.

I was unsure you were handling the ODBC error as aRed error. It could be an unhandled one that crashed whole Red. Red error on `Pick` is a good option, but if coders use `attempt` to pick a column, they end in the same `none` return value.

[21:22:51](#e5MrVj67mOVCnwI2MGPmQv3l7v6nN31-ZUtZK377cFw) <GiuseppeChillemi (GiuseppeChillemi)>:
* About this: 
> What difference do you see between the current Script error and a Red error!? There is none.

I was unsure you were handling the ODBC error as aRed error. It could be an unhandled one that crashed  the whole Red. Red error on `Pick` is a good option, but if coders use `attempt` to pick a column, they end in the same `none` return value.

[21:24:42](#KTtqpFxYZraFU6pjB6K1mZ1eqUUBiex7sYifqsWg4JE) <gurzgri>:
If coders `attempt` to pick column, they would obfuscate the error no matter how it is thrown, now you're contradicting youself, aren't  you?

[21:27:25](#5sYnsf7gYYGNu_ExzxNJ88eZa-jheXfhLR3jnIqlu6c) <GiuseppeChillemi (GiuseppeChillemi)>:
I am telling exactly the same thing. They have to handle it a different way, even if `attempt` is the most used shortcut check about possible errors. But...

[21:27:36](#FGi6Sl6CeqExxSEZp-ZX0A2Rt1-1wGuSkXEJt2vXFh8) <GiuseppeChillemi (GiuseppeChillemi)>:
Have you seen this difference?

[21:28:38](#ZG8fwm1Kznyti4WhJbayGQjGulGBvZhPRZEsfJ3ixdE) <GiuseppeChillemi (GiuseppeChillemi)>:
```
>> y: [none none!]
== [none none!]
>> type? tail y
== block!
>> type? pick tail y 1
== none!
>> type? pick y 1
==  Word!
>> type? pick y 2
==  Word!
```



[21:29:19](#8h-OkDET9jZUa7Z1TCYxf0mLYlcWOQlLKKNt-OVTII4) <gurzgri>:
`attempt` is not a shortcut to check for possibly errors, `try` with `error?` is. `attempt` is a means to hide errors where not interested in failure reasons.

[21:29:29](#wWYvr6NL7IolAXkRVOK86ghJRjduqg9UO1DT1mLs9iw) <gurzgri>:
* `attempt` is not a shortcut to check for possible errors, `try` with `error?` is. `attempt` is a means to hide errors where not interested in failure reasons.

[21:30:48](#UjR0uVp3lsyPi7Y0JyxtDQxI-xQ3ohceWCaouTMd84o) <GiuseppeChillemi (GiuseppeChillemi)>:
You can distinguish from `none!` as block content than `none!` returned by `pick` on `tail`

[21:31:07](#uxVrOxL5XwMpnu3TK9J8H47PJC_ZQVySI7azYB3uRKE) <GiuseppeChillemi (GiuseppeChillemi)>:
One is `word!` the other is `none!`

[21:31:39](#2rKZJWWcWSMECy0oFLvfE6Ng7TbijviUoLTKrHmxIwk) <gurzgri>:
These samples are Red 101. Both `none` and `none!` are just words your picking. Picking after tail returns a value of type `none!`. 

[21:33:02](#0YG_4caDEX2WnNx4c4KnNnNOxhbixvHRKpOtamV9hrY) <GiuseppeChillemi (GiuseppeChillemi)>:
In fact, what does `pick` return on Red ODBC on `none` column? Isn't it `word!`?

[21:33:03](#4R6XhMjumQCZ15CF01EVWtCCzG2yP_PnETJUg-vsVVs) <gurzgri>:
```Red
y: reduce [none none!]
type? pick y 1 ;== none!
type? pick y 2;== datatype!
type? pick y 3;== none!
```

[21:33:52](#kflCKdpO-Hr1Bzf7tL86aRj4XUE7GOMCdMORVq_9MAg) <gurzgri>:
`odbc://` returns values of type `none!`, everything else would drive anyone nuts.

[21:37:54](#2gqaNr0_eDjHTl53sbtA5U5NU4GYhHhU2_wz2ZUGRsM) <gurzgri>:
If a word `none` of type `word!` would be returned, you wouldn't be able to test a column result for `none?`. 

[21:37:58](#mBjM6uihK0qP2ZdtHiiAhPIMwWBai5EsoXN5IycvTSc) <GiuseppeChillemi (GiuseppeChillemi)>:
But my example is on `y: [none none!]` if you keep it working as Red does, where they are both `word!`, and past tail `pick ` is `none` you have a perfect match on the way Red handles block contenet and past tail picking. 

[21:38:13](#xUGVomq8gjI_5UsIAFb9saVJ53E--UUwHI_iumsVjqU) <GiuseppeChillemi (GiuseppeChillemi)>:
* But my example is on `y: [none none!]` if you keep it working as Red does, where they are both `word!`, and past tail `pick ` is `none!` type you have a perfect match on the way Red handles block contenet and past tail picking. 

[21:38:19](#4MCAZblAhNDfzHVQ9Jb43rTN2YrF5V1kD9QklQwlACg) <GiuseppeChillemi (GiuseppeChillemi)>:
* But my example is on `y: [none none!]` if you keep it working as Red does, where they are both `word!`, and past tail `pick ` is `none!` type, you have a perfect match on the way Red handles block contenet and past tail picking. 

[21:38:33](#nYSaAwXN8Hx964NOlNk2M-XO9JFiMaIq6h_Fsr8jFVo) <GiuseppeChillemi (GiuseppeChillemi)>:
* But my example is on `y: [none none!]` if you keep it working as Red does, where they are both `word!`, and past tail `pick ` is `none!` type, you have a perfect match on the way Red handles block content and past tail picking. 

[21:39:59](#KLlj7fbJxj4sFMhCjYfvhF6PpqSwZuMtocbELB5uKKg) <GiuseppeChillemi (GiuseppeChillemi)>:
* But my example is on `y: [none none!]` if you keep it working as Red does, where they are both `word!`, and past tail `pick ` is `none!` type, you have a perfect 1:1 match on the way Red handles block content and past tail picking. 

[21:40:47](#OlM_c7m7OSiEcmOXTcnsZcWFx7cZjxZpCAplqa1yxBk) <gurzgri>:
Just no, this leads nowhere. I'm not doing that, I gave the reasons. It wouldn't be "working as Red does" in my book.

[21:43:08](#U0MhgtJ442_AVd9_X34fIhkLjwUCpbqHyxtIfGdoQU8) <gurzgri>:
That there are no rows to pick from after `empty? rows: copy st` and you're still picking, you can't blame `pick`. 

[21:45:40](#0mDsrKuhGQigQGi3gtBix6r7o8k2md5frUFrLXDesqw) <GiuseppeChillemi (GiuseppeChillemi)>:
I do not blame `pick`. I am just telling that under Red logic it returns `none!` of type `none!` witch differs from  `none!` inside a block which which is of type `word!` if you `pick` it. So you can distinguish `end of rows` from column content.  

[21:46:05](#NRR1iuVYlaN2DNEhhu4wwQsF7bdhtb7tdZQ61VNQ13s) <GiuseppeChillemi (GiuseppeChillemi)>:
* I do not blame `pick`. I am just telling that under Red logic it returns `none!` of type `none!` at tail, witch differs from  `none!` inside a block which which is of type `word!` if you `pick` it. So you can distinguish `end of rows` from column content.  

[21:46:20](#vAcbv2X44ZsqKiQxKroSR2vwEXWPOpsohL2kVI3M004) <GiuseppeChillemi (GiuseppeChillemi)>:
* I do not blame `pick`. I am just telling that under Red logic it returns `none!` of type `none!` at tail, which differs from  `none!` inside a block which which is of type `word!` if you `pick` it. So you can distinguish `end of rows` from column content.  

[21:46:58](#lel_YJmP9eicnndQk3--39KVTgNnEle1Oqe5Tjazbn0) <GiuseppeChillemi (GiuseppeChillemi)>:
* I do not blame `pick`. I am just telling that under Red logic it returns `none!` of type `none!` at tail, which differs from  `none!` inside a block which is off type `word!` if you `pick` it. So you can distinguish `end of rows` from column content.  

[21:47:37](#4iV5Su-i8l_27a_ylQrXVgEjEKrbbDS2NfKy5pMKAJw) <GiuseppeChillemi (GiuseppeChillemi)>:
* I do not blame `pick`. I am just telling that under Red logic it returns `none!` of type `none!` at tail, which differs from  `none!` inside a block which is of type `word!` if you `pick` it. So you can distinguish `end of rows` from column content.  

[21:49:36](#NgNFUNnPgd1AMO8yUAAzV9xkjC9fZOKXlZJX4tPm6HM) <GiuseppeChillemi (GiuseppeChillemi)>:
* I do not blame `pick`. I am just telling that under Red logic it returns `none!` of type `none!` at tail, which differs from  `none!` inside a block which is of type `word!` if you `pick` it. So you can distinguish `end of rows` from column content, just using `type?`|

[21:49:43](#6XYYxVZRXGw6zw1NYm9atokqghlgaOoxAssspRIvBY0) <GiuseppeChillemi (GiuseppeChillemi)>:
* I do not blame `pick`. I am just telling that under Red logic it returns `none!` of type `none!` at tail, which differs from  `none!` inside a block which is of type `word!` if you `pick` it. So you can distinguish `end of rows` from column content, just using `type?`!

[21:51:38](#Qt4n4g_L_pqKZZICebB4neHCIqaZlUusCaemx9phZ08) <gurzgri>:
Like it or not, it will stay the `none? none ;== true` way ������

[21:52:41](#cs5kmivZZlnuYa2b4hikhFxO8K-1j390_JHuUpesvUI) <GiuseppeChillemi (GiuseppeChillemi)>:
It's you code and your freedom ������ 


[21:54:50](#F2Tw4tcNvZPNL2EfkkU_6VD7giB1EDUBZXZK0WsYn74) <GiuseppeChillemi (GiuseppeChillemi)>:
But...
```
>> y: [none none!]
== [none none!]
>> none? pick y 1
== false ;<<------
```
It is outside Red standard. 

[21:55:44](#flZ4rsz-t93jkpYFRL8JyFLKIiFYoSNlcHNJnk2MAT8) <GiuseppeChillemi (GiuseppeChillemi)>:
* It's your code and your freedom ;-) 


[21:57:35](#0mnVATs0VacTu4YOeScvxKpBZGf2IFvpDDa9A5-fjQA) <gurzgri>:
That's what I was saying: 
> If a word none of type word! would be returned, you wouldn't be able to test a column result for none?
That is a major argument for my point of view, seconded by means to test for no more rows with `empty? rows: next st`.

[21:58:03](#9cUISW8jadm2jg9k3UIFa_JhHbmwGBkU4CZe9uPrZHM) <gurzgri>:
* That's what I was saying: 
> If a word none of type word! would be returned, you wouldn't be able to test a column result for none?

That is a major argument for my point of view, seconded by means to test for no more rows with `empty? rows: next st`.

[22:09:03](#V2J-I9fZp4nrYBP29r-RjkGfo23_CgsMpgBT4Jrvkz0) <GiuseppeChillemi (GiuseppeChillemi)>:
I fully understand your first POV. 

[22:09:49](#pYfr2-dPjuxbrylmZ_OMf7D14qQk-2AX7Gd1lDHyA-E) <GiuseppeChillemi (GiuseppeChillemi)>:
But you can test, it is just lengthier:
```
>> y: [none none!]
== [none none!]
>> if all [word? c: pick y 1 object? context? c none? get c]  [print "Yes, I am NONE! type!"]
Yes, I am NONE! type!
>>  
```

[22:14:20](#trBoWRE4BL_nbmalL7XmQniQA6D2jLSKrqs3ofoy7lA) <GiuseppeChillemi (GiuseppeChillemi)>:
(Ok, it is not perfect, I have to better review it ������   )

[22:18:07](#GQr9OyAkTgWmG7bUAQ017Rt8FgR57vRZQ0Ij2TvzWE0) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, it is the correct way of testing it:
```
>> all [(first [none]) = (c: pick y 1) none? get c]
== true
>> 
```


[22:19:17](#oJvF0ultOG1u0fQN3yIxQNCGe9NbJiri62MnrrcJcoY) <GiuseppeChillemi (GiuseppeChillemi)>:
* Ok, this is the correct way of testing it:
```
>> all [(first [none]) = (c: pick y 1) none? get c]
== true
>> 
```


[22:20:02](#nt756pHErHzEUyYtQEFiaVnQTElGcqUkY-vBHJlUq64) <gurzgri>:
You're kidding, are you? :) `'none = pick y 1`

[22:21:46](#aGzBcUQaffmSo5I_mhVpl32nBkf_idL7wkk1-64eEvE) <GiuseppeChillemi (GiuseppeChillemi)>:
I have written elsewhere, I just didn't know about `'none = pick y 1` but if you know this,, why you keep writing: 
>> If a word none of type word! would be returned, you wouldn't be able to test a column result for none?
������

[22:21:55](#4ED8P0bskVre6RTaAtG-36lapu5B2JHUOa8MKi5KnOw) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have written elsewhere, I just didn't know about `'none = pick y 1` but if you know this,, why you keep writing: 
> If a word none of type word! would be returned, you wouldn't be able to test a column result for none?

;-)

[22:22:18](#CQa4Xoyc0o3b0C0HEtGY-GkRiEv5FhES0MaxRJLRyU8) <GiuseppeChillemi (GiuseppeChillemi)>:
* As I  have written elsewhere, I just didn't know about `'none = pick y 1` but if you know this,, why you keep writing: 
> If a word none of type word! would be returned, you wouldn't be able to test a column result for none?

There is a way to test it and it is super easy!
;-)

[22:22:32](#9dwbs4Gq8fNdaezbaqSOCZPJR3JwMusIeL6CvyZA4C0) <GiuseppeChillemi (GiuseppeChillemi)>:
* As I  have written elsewhere, I just didn't know about `'none = pick y 1` but if you know this, why you keep writing: 
> If a word none of type word! would be returned, you wouldn't be able to test a column result for none?

There is a way to test it and it is super easy!
;-)

[22:50:40](#fsUYUEbyzxVyrEgBjrvLfIT_sHXGDX4DL-x9Ci96I4s) <gurzgri>:
Because you can‘t test for `'none` with `none?`.

[22:51:32](#8Ty2VEy95RsMaUGfBhr3rbyds66Q1mHKOoEG6GGXSGk) <GiuseppeChillemi (GiuseppeChillemi)>:
It's too late Christian, see you tomorrow and good nigth!

[22:51:55](#VPLxxRTdZQPSH0yUWq7qU_Of-paYdsUD0hGE89x-MkI) <GiuseppeChillemi (GiuseppeChillemi)>:
* I don't have the power to think, It's too late Christian, see you tomorrow and good nigth!

[22:52:07](#S308we4GodbjtY8O8cQiED4xIA8aPhD2qh7KGHjdZ5Q) <GiuseppeChillemi (GiuseppeChillemi)>:
* I don't have the power to think! It's too late Christian, see you tomorrow and good nigth!

[22:52:22](#4jfwxmVgFumqL8lbqBNeYzCKh33F8cnnYcAZFGOVg2k) <GiuseppeChillemi (GiuseppeChillemi)>:
* I don't have the energy needed to think! It's too late Christian, see you tomorrow and good nigth!

[22:55:23](#QpjGBqcqw6dE6_-apEszIZ-qkekOA0l5yBrwDGXVSYU) <GiuseppeChillemi (GiuseppeChillemi)>:
* I don't have the energy needed to think! It's too late Christian, see you tomorrow and good night!

## 12-Apr-2022

[9:58:13](#goCHfGjBarvuPgAGmIDDLO8PbXUygecUyAbZHb5rLok) <bubnenkoff (Dmitry Bubnenkov)>:
> I don't know what it means that you rewrote to "prepared statements"

I mean that before I used plain text SQL.

I tried again, and every few minutes I am getting `Runtime Error 1: access violation`

[9:58:20](#Lr4Ly2gSmlwDU9oLrSHc4SPY_82-6R1VhPqwLlM5J-g) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/qkQP/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/qkQP/izobrazhenie.png)

[10:09:40](#JYL5c0laUYB3opCjhLt42VzOpC9aQLWa9XOm715NYCs) <bubnenkoff (Dmitry Bubnenkov)>:
prepared: 
```
insert data-insert-statement compose [ 
  (insert-part) ; insert part
  (prepared-values-part) ; values
]
```
not prepared:
```
insert data-insert-statement compose [ 
  (insert-part) ; insert part with values in one query
]
```
Or I am wrong in naming?

[10:11:20](#8MsMHz3j4tds1ZM5_gRqEWscf9QMUdjgkBY1WlPLzco) <bubnenkoff (Dmitry Bubnenkov)>:
And by the error: `Runtime Error 1: access violation` is's possible that it's GC issue, but I am not sure.

[10:13:18](#NFSf_MGjuUVHMPYAgvfaEFPLBbBquodYWieHI6Um84w) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/NnbD/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/NnbD/izobrazhenie.png)

[10:34:38](#C1Me9-7yGYEeFJWTPUD9oOd7HiXMssVOLyKauFnVgU0) <bubnenkoff (Dmitry Bubnenkov)>:
Sometimes it give me to process few files, sometimes it crush immediately

[11:00:02](#372Vu17G_3JU6tpOYuGLw2iukdAJpD3iA0M9QwFjHPk) <gurzgri>:
"Parametrized" vs. "unparametrized" statements. The access violation looks like a memory issue, it fails at the buffer allocation step with `allocate` (which essentially is a call to `malloc`). For now, I don't check for success on `allocate`, as it is often to be seen in the Red runtime codebase. Can you split your data into smaller chunks and in between sometimes `recycle` some memory?

[11:41:18](#n77Pp0ijvS_0p6_bvTjpW7k8GVlWWZVWHUMMyTdJnmk) <bubnenkoff (Dmitry Bubnenkov)>:
> "Parametrized" vs. "unparametrized" statements
Will know! 

> Can you split your data into smaller chunks and in between sometimes recycle some memory?
Good idea! I've added `recycle` between generation each statements and it's seems that it works. At least not crush every time, but I will continue testing....


[11:41:24](#hPWiATy2hwZ7toPNJSfJt8ceV31nOm1tYVtKpFsMSbw) <bubnenkoff (Dmitry Bubnenkov)>:
* > "Parametrized" vs. "unparametrized" statements

Will know! 

> Can you split your data into smaller chunks and in between sometimes recycle some memory?

Good idea! I've added `recycle` between generation each statements and it's seems that it works. At least not crush every time, but I will continue testing....


[12:59:57](#4CC46rH3d27wmZaKnCi-3OaNU87cJCcd3Zd7HISghKc) <bubnenkoff (Dmitry Bubnenkov)>:
Small inserts works. I tried to run big parameterized insert requests and it's failed 

[13:00:07](#PLFEM6vZpqZpiBKgJIGAZeugLh5nEfBmGbTqZxu77Vo) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/fwyd/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/fwyd/izobrazhenie.png)

[13:02:16](#zoXldNR3ZSGibEneVqDQkpZdepgnl3Ei13tRTa9gbwE) <bubnenkoff (Dmitry Bubnenkov)>:
> At minimum I gave you two times the tip to `probe` more, yet you always come with code `print`ing things.

Ok. I will try to add more `probe`

[14:02:47](#HkrkrkxF_06ccA4USpj0i8UwV7jlK3v-OZ_98sU7g7E) <gurzgri>:
But the error message is right there, have you considered reading it? ������

[14:42:55](#ooXq9jxkvdaBaQ-U_mBMipmWrpVr00hCRWrEi0qwvSg) <gurzgri>:
Joking aside: Tell me what you think is going wrong and how you try to debug it. I do not think it's directly odbc:// scheme related. The error message  is giving away two reasons why the statement fails and I do expect content over size being the reason for failure. Hopefully that's cryptic enough? :J

[16:45:25](#FGscHYM3TJ4M3adP6EY0IjCSouz0xlLsNHl5LPl_kk8) <bubnenkoff (Dmitry Bubnenkov)>:
> But the error message is right there, have you considered reading it? ������

"before or while processing the request" I did dump of prepared and insert SQL part before crush, and tried to run them in tiny project. Work fine, but crush during processing in real app...

## 13-Apr-2022

[9:09:16](#11M6IAZUgwvD65Xo91d17L6OfRRTFWdqa2Zzlyz4LRU) <bubnenkoff (Dmitry Bubnenkov)>:
I turned on full logging in PG and found next message: `Р’РђР–РќРћ:  Р·Р°РєСЂС‹С‚РёРµ РїРѕРґРєР»СЋС‡РµРЅРёСЏ РёР·-Р·Р° С‚Р°Р№Рј-Р°СѓС‚Р° РїСЂРѕСЃС‚РѕСЏ СЃРµР°РЅСЃР` after decoding I got "connection timeout. connection was closed"

[9:11:33](#lmWd5O-jhtdY-cZjuEaEhxZ8R3XxPXsDgQoZqVENXtk) <bubnenkoff (Dmitry Bubnenkov)>:
I remember that when I installed PG I did some settings tuning. I will check it. Also I googled about this error, and there some issue in python drivers. The solution - driver should recreate connection if it's closed 

[9:19:00](#jPvKpeUWl0DUSS3VOcnHN2X-WWuPxMYB247BA7JOTM8) <bubnenkoff (Dmitry Bubnenkov)>:
Strange. The settings is ok. I revert all of them to defaults few month ago

[10:35:53](#kfv7ZgbpphII5SCh6TemxsKGfEx8CUi-Pem68AWEnYk) <gurzgri>:
That it’s the server who closed the connection is no news, that right there in your screenshot already

[10:37:50](#O5voQUSN8eyJUNGpYpT_zz48OPDISQ-sHr-njkdNXKg) <gurzgri>:
That it’s the server who closed the connection is no news, that right there in your screenshot already

[10:40:47](#CuSeUUrkxPX9K31DlhNHhUa0xcGFeO3cedTGQnghWGs) <gurzgri>:
* 

[10:41:10](#Cjv77s_SdZZAWjU47GXWNxfJUH0-U5GGdrIVo841fDM) <gurzgri>:
* That it’s the server who closed the connection is no news, that's right there in your screenshot already

[11:54:54](#pRblOtNJNUHPffbpQshQr2VxY8eelxpwHnN0BV68X0U) <bubnenkoff (Dmitry Bubnenkov)>:
I just realized it, I thought it wrong request, but it seems that connection is closing before any requests. Or you think it's problem in request? 

[22:42:00](#fvUiTcjb5iGxd4hEzr1VGko-PIplf_EUIjeg-Cp9Qkc) <gurzgri>:
Don't know. Either try to narrow it down to a problematic param-set/param or pull again and try with statement without a query timeout or query timeout long enough (not sure if it will make a difference):
```Red
open statement: open connection odbc://my-dsn
change statement [timeout: 2:00]           ;-- timeout after 2 hours
insert statement ["INSTERT INTO ..." [...] [...] [...] [...] ...  [...]]
```

## 14-Apr-2022

[7:20:45](#OsVIhn4Zh1C_0FxlfEpnL2-B5gq62MYYsE85FvS8Wbs) <bubnenkoff (Dmitry Bubnenkov)>:
Don't know. Either try to narrow it down to a problematic param-set/param or pull again and try with statement without a query timeout or query timeout long enough (not sure if it will make a difference):
```Red
open statement: open connection odbc://my-dsn
change statement [timeout: 2:00]           ;-- timeout after 2 hours
insert statement ["INSTERT INTO ..." [...] [...] [...] [...] ...  [...]]
```

[7:26:58](#VmvGfgjLdRbmyqH9mfehX9-2gT8_0KcOP3tEBJgySRU) <bubnenkoff (Dmitry Bubnenkov)>:
Don't know. Either try to narrow it down to a problematic param-set/param or pull again and try with statement without a query timeout or query timeout long enough (not sure if it will make a difference):
```Red
open statement: open connection odbc://my-dsn
change statement [timeout: 2:00]           ;-- timeout after 2 hours
insert statement ["INSTERT INTO ..." [...] [...] [...] [...] ...  [...]]
```

[9:01:52](#wJgxJnkMdFYT7hPF7Z-SJJWfl3nY8Ir7U-tmVH_BKU4) <bubnenkoff (Dmitry Bubnenkov)>:
Don't know. Either try to narrow it down to a problematic param-set/param or pull again and try with statement without a query timeout or query timeout long enough (not sure if it will make a difference):
```Red
open statement: open connection odbc://my-dsn
change statement [timeout: 2:00]           ;-- timeout after 2 hours
insert statement ["INSTERT INTO ..." [...] [...] [...] [...] ...  [...]]
```

[9:01:59](#IBX-zptEXNqIB3uwb4L7SCwgJQOUENvabvrO7yVIhXI) <bubnenkoff (Dmitry Bubnenkov)>:
* Hm... I have add wait for 70 minutes in simple project, that do single insert. Before `wait` it worked fine, now it crushed with same error.
I will try add some timeouts (I tested it without them)

[9:42:41](#LxX8siQpZsYRFp4NLJsSXHtYvH9uE5xNoHnsIcBgwhQ) <bubnenkoff (Dmitry Bubnenkov)>:
* Hm... I have add wait for 70 minutes in simple project, that do single insert. Before `wait` it worked fine, now it crushed with same error.
I will try add some timeouts (I tested it without them)

[9:44:20](#AoSDZggG5WK4fhbyFq0nVBVG5cr160H4PlIcR_qSWvI) <bubnenkoff (Dmitry Bubnenkov)>:
* Hm... I have add wait for 70 minutes in simple project, that do single insert. Before `wait` it worked fine, now it crushed with same error.
I will try add some timeouts (I tested it without them)

[10:22:45](#o-plUqMg8yBOag2S-Cj8tI4k0MZ9dAV2I5E0EfaPv1A) <bubnenkoff (Dmitry Bubnenkov)>:
* Hm... I have add wait for 70 minutes in simple project, that do single insert. Before `wait` it worked fine, now it crushed with same error.
I will try add some timeouts (I tested it without them)

[10:30:53](#JMNwrfRH-gIc0Qz5ESgaPrtZKey7r6qZwnNpf5Ly1qI) <bubnenkoff (Dmitry Bubnenkov)>:
Yeah!! It's seems that I have found problem. There was settings: `idle_session_timeout = 120000`

[10:34:15](#VoPKpJxSVsrl3wHHD6pnbcDnxf2SlK4A-OaQXUTxrso) <bubnenkoff (Dmitry Bubnenkov)>:
* Yeah!! It's seems that I have found problem. There was settings: `idle_session_timeout = 120000`. But I need test more, it worked only with tiny example

[16:14:07](#ZDJl6KuWrhBr9iRgSDnWsP0JMjC6khkK2yx9PWf2dPg) <gurzgri>:
But wasn‘t that commented out in the pg.conf you‘ve showed?

[16:38:11](#slsfQiykYH5IbZVHumGoJmw20QjNkI0RXDRLRpqV4lI) <bubnenkoff (Dmitry Bubnenkov)>:
It was my error, I have two instance and looked at wrong config. Btw I do not know why, maybe because it's debug build and too many logs on screen, but inserting of 20K of VALUES still not finished. It already 3 hours. If It will not end in next 2 hours I will try to run not debug build, possible it would work faster 

[16:48:41](#TIV4AEiAG1nDvVS_q8JH8_kQPXYCzRlgpj33loaH_8o) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/xJE5/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/xJE5/izobrazhenie.png)

[16:48:47](#4Tws_0bDcUc9oCsLLnDp64cop5Ec3IFb5MZ_teWo6eA) <bubnenkoff (Dmitry Bubnenkov)>:
Currently output ^

[17:31:26](#ys4xXkbYw8EeB2J956RrrlPZ3WIIXC2vVV5_AdrA_R4) <gurzgri>:
Can you give some impression of the data you want to insert? How many rows with how many values per row (param array n x m), what datatypes? What are the column you insert into? NULL values in between? How long are values, long strings and such? What is the code you execut? You can post in private channel and obfuscate sensible data. 

## 15-Apr-2022

[7:13:45](#wyczRznJ4gqwRElTFYDKJ7F5Yr9iZTBKGYnLaiPRSjE) <bubnenkoff (Dmitry Bubnenkov)>:
I will, 
1. I just found bug with `unique`and report about it. 
2. I need to do more testing to be sure that problem in driver, not in DB

[8:27:40](#jltFqqToqXx0G-syRP_vVnvmg-MCA1W0b-QdvHj42jY) <GiuseppeChillemi (GiuseppeChillemi)>:
Red has also `UNIQUE`, so I don't understand whether you ar talking about Red `unique` or no.

[8:38:18](#IpS_m_yVxP5OgQrIwUWRV9Ht6osnBJLjDNTpmVv7XZQ) <bubnenkoff (Dmitry Bubnenkov)>:
Second meaning is `UNIQUE` in context of SQL query argument? 
Yes, I found a but in Red. My app is crush because of him. (I used them to delete dups from parameters)
Now I am doing some tests, and it seems that multiple values are inserted successfully. I will write when I am done 

[11:18:56](#o_svY-9iAJyAkP97i5xGurkZkYv7fTlZkUkhctdVVKw) <GiuseppeChillemi (GiuseppeChillemi)>:
I still don't understand.

[11:19:35](#QyWHTBOVj3YsdGB3dxrR_mhL7VfOZa3ipfQ6hAeD01k) <GiuseppeChillemi (GiuseppeChillemi)>:
Have you requested data and used `UNiQUE` in Red and it crashed?

[11:21:11](#L3Np-RG3_2R0CI8Wqj1QwNHu0g7BdeZ2UWGF583OJV4) <bubnenkoff (Dmitry Bubnenkov)>:
Yes, exactly!

[11:22:17](#2Aqb8KyMp9KXT5GSlWCwYc3SUo6_GpW9pesRmv7ss7k) <GiuseppeChillemi (GiuseppeChillemi)>:
So, it's a Red Problem. If you can reproduce the bug, write a bug report in a ticked.

[11:22:20](#Xg9Fuk9g4yFEK4UcLYVzC94A8MiDES24qM0lY8uFY5c) <GiuseppeChillemi (GiuseppeChillemi)>:
Ticket

[11:23:18](#cSILl5VTO8LvVlPoGCeb4X9N7dU1JiqIYKZYY9v3wYY) <bubnenkoff (Dmitry Bubnenkov)>:
Yes, I already did it in bug chat group and here https://github.com/red/red/issues/5123

[11:23:38](#72L4XkaQb8jmRUtiLbUCBo4N1COXteg7x6jwUIHIRqk) <GiuseppeChillemi (GiuseppeChillemi)>:
Perfect!

[16:14:19](#oRx0Ag1KjqrLvFp31s7lO9dELy92A-pvkJRGKjgUPLg) <bubnenkoff (Dmitry Bubnenkov)>:
After some inserts code fail with an error:
```
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```
The error occurs before execution prepared statements. I will try to look maybe debug build will show more info

[16:36:49](#7LaHQooBs1ljSqSKisF06laQ8IXyHXtVhKkWXa7kpMw) <bubnenkoff (Dmitry Bubnenkov)>:
hm... obviously it's GC issue, but it crush at random place

[16:41:55](#3OwYkMZ_w48gnh0cvFKzTr0fJ_ZpePpm76drLEerBG8) <bubnenkoff (Dmitry Bubnenkov)>:
https://gist.github.com/bubnenkoff/5b2c0d00e8e3a96fe4bde7a0fa983605#file-app-red-L51

Here is my code. I tried to turn GC on\off - it did not helped. App do not crush only if I use not parameterized statement 

[17:23:59](#_7_JNwAU3tz-dWa8BHUj-g4B1h021i7O1p7MPUvxs3c) <bubnenkoff (Dmitry Bubnenkov)>:
40 minutes passed not parameterized statements insets works fine

[17:51:15](#qEFraF-VGpQDPi-2Q5tsOgrCkUOjta3bUyS8RuEFGmc) <GiuseppeChillemi (GiuseppeChillemi)>:
I have not understood. Does it work or it does not work?

[17:57:11](#a0p_tivCfG7kPb13_WgtuLWdh-jhwD1YWpkzuWG7JxQ) <bubnenkoff (Dmitry Bubnenkov)>:
It work only not-parametrized statements. With parameterized it crush  with `access violation` in random places. Sometimes it process few files before crush, sometimes it crush on first

[17:58:11](#88N8Zx5BXzyt8qQI_GpIGGUEH0bZmes9GTRFFOzgoS4) <bubnenkoff (Dmitry Bubnenkov)>:
* It works only with not-parametrized statements. With parameterized it crush  with `access violation` in random places. Sometimes it process few files before crush, sometimes it crush on first.
But I can't use not-parameterized statements, because the have size limit

[18:46:57](#XJzmcUzxUshS6jvoob8lJNo0rCEvcFm7CJdvHWkuRlg) <gurzgri>:
Show me the output of `probe compose [ (insert-part) (prepared-values-part) ]`.

## 16-Apr-2022

[6:23:21](#Id920roTwBw6UElJR3C4yhut50_6YtX2JegpBby_DSI) <bubnenkoff (Dmitry Bubnenkov)>:
code:
```
print ["-------> " only-name]
resfile: to-red-file rejoin ["d:/code/samples/" only-name]
write/lines/append resfile reduce [insert-part lf prepared-values-part]            

insert data-insert-statement compose [ 
    (insert-part)
    (prepared-values-part)
]
print "ccc111"    
```            
error:
```
------->  fcsNotificationEA44_0173200002520000030_24857441.xml
ccc111

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

The sample data in next archive:

[6:23:37](#qLs-OfolXQq9z9H39r707Zo_MFc4feO2Mtn8ZwTODEI) <bubnenkoff (Dmitry Bubnenkov)>:
[samples_data.zip](https://files.gitter.im/6234feab6da037398492a62a/SX2B/samples_data.zip)

[8:57:38](#4odT0saKWrb9iKR1v3sf1sRwpT8ZCSzkAKhJ4SKBDI4) <gurzgri>:
The data you provided doesn't match the required format in so many ways, that I don't even know where to start. That is so obvious from the sample data that I cannot help but think that you haven't even had a look into that data by yourself. The only two recommendation I give is: 1) put a single parametrized statement together and  if you can insert this 2) comment out the `insert data-insert-statement ...` statement and instead probe the data to the screen until you see for sure that you've got the format right before throwing it at the database.

[9:04:20](#AR7CRrZuuNvM9bVXXoKr-vUwR3LYVrOlrCf1nfQtwKo) <gurzgri>:
```Red
insert snowwhite [
    "INSERT INTO Dwarves (Num, Name) VALUES (?, ?)"
    [1 "Dopey"] [2 "Doc"] [3 "Bashful"] [4 "Sneezy"] [5 "Happy"] [6 "Grumpy"] [7 "Sleepy"]
]
```

[9:04:33](#JsQ3gtfoCbmf9VnpCfGg2-mKq08KJDt_R04nb7aCIRQ) <gurzgri>:
is the format

[9:06:19](#HRL7Q7hPfbjhV8B_ElTi9oO_5zwrEzyxWQDewe0ZQ7A) <bubnenkoff (Dmitry Bubnenkov)>:
Ok, I will try tomorrow evening 

[9:13:20](#S-fNSY2mwhA11mcq0OouSW_mJE2neaTxNsuDK01zXVc) <bubnenkoff (Dmitry Bubnenkov)>:
I was in a hurry when I was preparing the data. I had to leave. I'll check them again tomorrow or Monday.

## 18-Apr-2022

[9:26:43](#KOMJnNlvZYr_4DZrBti3wzbvl47aOyJElVA0RWCN_lU) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri good news! I was able to create minimal app to reproduce an error:
```
insert data-insert-statement compose [ 
    {INSERT INTO objects ("lotNumber", "purchaseNumber", "object_code", "object_name", "quantity", "isMedicalProduct", "quantity_undeffined", "price") VALUES (?,?,?,?,?,?,?,?)}
    ([[0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 75.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 75.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 152.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "50.00" none none 122.67] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 257.33] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 236.67] [0 "0376200006316000009" "22.29.29.000" "Изделия пластмассовые прочие" "1000.00" none none 23.65] [0 "0376200006316000009" "23.19.23.110" "Посуда для лабораторных целей стеклянная" "10.00" none none 98.67] [0 "0376200006316000009" "23.19.26.000" {Изделия из стекла, не включенные в другие группировки} "1000.00" none none 4.63] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 1213.33] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "1.00" none none 19349.0]])  
]            

print "insert done"
```

The follow code behaves randomly. Sometimes it's works. Fine sometimes crash with errors:

```*** Script Error: ODBC error: []
*** Where: ctx||610~execute-statement
*** Near : param
*** Stack:
```

```
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

The most popular error is ODBC error, but 1 times from 10 I am getting `access violation`


[9:26:52](#f0N3g7qLa_07lfIgB13RWcoRP36YZC7cWY7bGebjlN4) <bubnenkoff (Dmitry Bubnenkov)>:
* @gurzgri good news! I was able to create minimal app to reproduce an error:
```
insert data-insert-statement compose [ 
    {INSERT INTO objects ("lotNumber", "purchaseNumber", "object_code", "object_name", "quantity", "isMedicalProduct", "quantity_undeffined", "price") VALUES (?,?,?,?,?,?,?,?)}
    ([[0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 75.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 75.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 152.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "50.00" none none 122.67] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 257.33] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 236.67] [0 "0376200006316000009" "22.29.29.000" "Изделия пластмассовые прочие" "1000.00" none none 23.65] [0 "0376200006316000009" "23.19.23.110" "Посуда для лабораторных целей стеклянная" "10.00" none none 98.67] [0 "0376200006316000009" "23.19.26.000" {Изделия из стекла, не включенные в другие группировки} "1000.00" none none 4.63] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 1213.33] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "1.00" none none 19349.0]])  
]            

print "insert done"
```

The follow code behaves randomly. Sometimes it's works. Fine sometimes crash with errors:

```
*** Script Error: ODBC error: []
*** Where: ctx||610~execute-statement
*** Near : param
*** Stack:
```

```
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

The most popular error is ODBC error, but 1 times from 10 I am getting `access violation`


[9:27:24](#jK1af4NW2_p4XQZEx59fVCM4a6XFWQQCkjYMHobAC2I) <bubnenkoff (Dmitry Bubnenkov)>:
* @gurzgri good news! I was able to create minimal app to reproduce an error:
```
insert data-insert-statement compose [ 
    {INSERT INTO objects ("lotNumber", "purchaseNumber", "object_code", "object_name", "quantity", "isMedicalProduct", "quantity_undeffined", "price") VALUES (?,?,?,?,?,?,?,?)}
    ([[0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 75.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 75.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 152.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "50.00" none none 122.67] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 257.33] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 236.67] [0 "0376200006316000009" "22.29.29.000" "Изделия пластмассовые прочие" "1000.00" none none 23.65] [0 "0376200006316000009" "23.19.23.110" "Посуда для лабораторных целей стеклянная" "10.00" none none 98.67] [0 "0376200006316000009" "23.19.26.000" {Изделия из стекла, не включенные в другие группировки} "1000.00" none none 4.63] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 1213.33] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "1.00" none none 19349.0]])  
]            

print "insert done"
```

The follow code behaves randomly. Sometimes it works. Fine sometimes crash with errors:

```
*** Script Error: ODBC error: []
*** Where: ctx||610~execute-statement
*** Near : param
*** Stack:
```

```
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

The most popular error is ODBC error, but 1 times from 10 I am getting `access violation`


[9:27:37](#0J_BZVA3ryIF7FDhFhSmaa9LSnzYgH8GSZelbogtHb4) <bubnenkoff (Dmitry Bubnenkov)>:
* @gurzgri good news! I was able to create minimal app to reproduce an error:
```
insert data-insert-statement compose [ 
    {INSERT INTO objects ("lotNumber", "purchaseNumber", "object_code", "object_name", "quantity", "isMedicalProduct", "quantity_undeffined", "price") VALUES (?,?,?,?,?,?,?,?)}
    ([[0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 75.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 75.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 152.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "50.00" none none 122.67] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 257.33] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 236.67] [0 "0376200006316000009" "22.29.29.000" "Изделия пластмассовые прочие" "1000.00" none none 23.65] [0 "0376200006316000009" "23.19.23.110" "Посуда для лабораторных целей стеклянная" "10.00" none none 98.67] [0 "0376200006316000009" "23.19.26.000" {Изделия из стекла, не включенные в другие группировки} "1000.00" none none 4.63] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 1213.33] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "1.00" none none 19349.0]])  
]            

print "insert done"
```

The follow code behaves randomly. Sometimes it works fine. sometimes crash with errors:

```
*** Script Error: ODBC error: []
*** Where: ctx||610~execute-statement
*** Near : param
*** Stack:
```

```
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

The most popular error is ODBC error, but 1 times from 10 I am getting `access violation`


[9:45:29](#KOHwFJitGrkH4Jc0ZR270MAmtYfV9Y_LQasUdI0PcKw) <gurzgri>:
For further testing purposes, change the line
```Red
insert data-insert-statement compose [{INSERT ...} ([[0 "0376200006316000009" ...]])]
```

to
```Red
argument: compose [{INSERT ...} ([[0 "0376200006316000009" ...]])]
probe new-line/skip collect [foreach row next argument [foreach param row [keep type?/word param]]] on length? second argument
insert datat-insert-statement argument
```

What's the output of the `probe`?

[9:51:18](#tRvKG9Zp0OcNe0ga7h9pywkynENFLmwyCvRm3zCsnZg) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/C1xf/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/C1xf/izobrazhenie.png)

[9:51:23](#XLxlg3rc7EDkGOQ909TBbtHJ7EzHwbOjTBO0MwdjxHo) <bubnenkoff (Dmitry Bubnenkov)>:
first run

[9:52:00](#E744cbBBIe9XTeHwr_2jDmNNUy3SmC3iLPWJfpXr5FI) <bubnenkoff (Dmitry Bubnenkov)>:
others attempts five same result

[10:00:33](#nFd3nlEnTlcd-k56cTK4TP3TvlNdRDGsqMINqIpUQ1Q) <gurzgri>:
Expected. Parameters of type `word!` aren't supported as per documentation. Admittedly, the scheme could fail more gracefully in such a case, but that's polishing. The problem is with the params provided. 

[10:03:59](#GKEMDAtc76mCZBlZTpzWmRgXPNMuvamkB8XLAgubYwo) <bubnenkoff (Dmitry Bubnenkov)>:
So you `none` in my params is not `none!` but is a word?! 

[10:04:48](#wUcmSBYPaY9pcetWnPtZQHTUnHMwj02N3HybN5n-yZE) <gurzgri>:
Literally ������

[10:06:13](#VHmiMS97HmE4gtXoiifSpYKzngEyLefG-a6gEMlHBfw) <gurzgri>:
The param blocks need to be reduced. The scheme only reduces the `value` argument of `insert`, not inner param blocks.

[10:07:39](#_LK9q7J6k_gVZa4vsWBpKwe0at9YeRYXP1Dr8HqDZxs) <bubnenkoff (Dmitry Bubnenkov)>:
Is it possible to reduce here?
```
            insert data-insert-statement compose [ 
                (insert-part)
                (prepared-values-part)
            ]
```

[10:07:52](#nMj4JXU9n61KVyBGc9rCQ44zu9z9Cfk4IaZyGJ-FJvc) <gurzgri>:
No.

[10:07:57](#h2WerI2X_KI4X2oQReA-GZBrjBoFtKoPOF_p7ucyR9I) <bubnenkoff (Dmitry Bubnenkov)>:
* Is it possible to reduce here?
```
        insert data-insert-statement compose [ 
             (insert-part)
             (prepared-values-part)
        ]
```

[10:08:45](#IqHUcb8V9ZOw3NAbJ6GN-mrqeH9IIKSZzxvylc5YSWE) <gurzgri>:
`prepared-values-part` has to reduce each block it returns in the outer block.

[10:14:09](#s0HS_xCXGXm7RqTvWuIaEO31BvTNilN7HxgruAP8MfA) <bubnenkoff (Dmitry Bubnenkov)>:
That's very strange. I am generate values in next way:
```
append/only flat-data/(parent-table-name)/values reduce values-of words-in-block 
```

So my `prepared-values-part` is reduced

I checked how it should work:
```
>> type? second reduce values-of #(a: 1 b: none )
== none! ; so it should be reduced correctly
```

[10:17:06](#h0YkKSGfih9dNhTmY6g3_8aEMJ_DxJulci_jhVwtZBA) <bubnenkoff (Dmitry Bubnenkov)>:
```
x: []
append x second reduce values-of #(a: 1 b: none )
probe x
print type? x/1
```
What `x/1` here? I can't figure out


[10:17:28](#Jw1OCOa2ncFETDXOJYVthyuu83ODGXtUl7WoLx_-M6w) <bubnenkoff (Dmitry Bubnenkov)>:
* ```
x: []
append x second reduce values-of #(a: 1 b: none )
probe x
print type? x/1
none
```
What `x/1` here? I can't figure out


[10:24:18](#feaXx0duynvDPGwlVf96vovkLEyqH8n2AlAe8u-q27c) <gurzgri>:
Well, at least in the above literal example the blocks weren't reduced, but maybe `prepared-values-part` *does* reduce. Test with
```Red
argument: compose [(insert-part) (prepared-values-part)]
probe new-line/skip collect [foreach row next argument [foreach param row [keep type?/word param]]] on length? second argument
```
and you'll see.

[10:26:12](#wi4ftBfLWuvPEgWBZURrb_zBM8CPFu0HrOqe_rF5biY) <bubnenkoff (Dmitry Bubnenkov)>:
One moment. I will test. I tried:
```
                ; reduce нужен чтобы слово true было оценено в тип logic 
                append/only flat-data/(parent-table-name)/values reduce values-of words-in-block 

                xxx: values-of words-in-block 
                foreach x xxx [
                    probe x
                    print type? x
                ]
```
And yes, none here is `word`

[10:26:18](#otK4VdThGGaP_KvOOBrKGZtJbo5jzQtTb0M7X9e4-vI) <bubnenkoff (Dmitry Bubnenkov)>:
* One moment. I will test. I tried:
```
                append/only flat-data/(parent-table-name)/values reduce values-of words-in-block 

                xxx: values-of words-in-block 
                foreach x xxx [
                    probe x
                    print type? x
                ]
```
And yes, none here is `word`

[10:26:37](#CG4vCbdlxRHUsDgNtH9ge8B5jJo1qzH2esWWFtu5BwQ) <bubnenkoff (Dmitry Bubnenkov)>:
* One moment. I will test. I tried:
```
 append/only flat-data/(parent-table-name)/values reduce values-of words-in-block 

xxx: values-of words-in-block 
foreach x xxx [
    probe x
    print type? x
 ]
```
And yes, none here is `word`

[10:32:30](#CgiJYR9pXc5YAscd_f7XlsvbCAzw5eKMenEHAr9obHc) <bubnenkoff (Dmitry Bubnenkov)>:
```
insert-part: {INSERT INTO objects ("lotNumber", "purchaseNumber", "object_code", "object_name", "quantity", "isMedicalProduct", "quantity_undeffined", "price") VALUES (?,?,?,?,?,?,?,?)}
prepared-values-part: [[0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 75.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 75.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "100.00" none none 152.0] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "50.00" none none 122.67] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 257.33] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 236.67] [0 "0376200006316000009" "22.29.29.000" "Изделия пластмассовые прочие" "1000.00" none none 23.65] [0 "0376200006316000009" "23.19.23.110" "Посуда для лабораторных целей стеклянная" "10.00" none none 98.67] [0 "0376200006316000009" "23.19.26.000" {Изделия из стекла, не включенные в другие группировки} "1000.00" none none 4.63] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "2.00" none none 1213.33] [0 "0376200006316000009" "20.59.52.190" {Реагенты сложные диагностические или лабораторные, не включенные в другие группировки} "1.00" none none 19349.0]]

argument: compose [(insert-part) (prepared-values-part)]
probe new-line/skip collect [foreach row next argument [foreach param row [keep type?/word param]]] on length? second argument
```

output:
```
[
    integer! string! string! string! string! word! word! float!
    integer! string! string! string! string! word! word! float!
    integer! string! string! string! string! word! word! float!
    integer! string! string! string! string! word! word! float!
    integer! string! string! string! string! word! word! float!
    integer! string! string! string! string! word! word! float!
    integer! string! string! string! string! word! word! float!
    integer! string! string! string! string! word! word! float!
    integer! string! string! string! string! word! word! float!
    integer! string! string! string! string! word! word! float!
    integer! string! string! string! string! word! word! float!
]
```


[10:40:42](#G1ByXUxUJYovyf9eLJXr4ZUY9U5RVAWMkqxv_Nqa4Ls) <gurzgri>:
Now you're running in circles. Test with the real `prepared-values-part`, not a literal one. With a literal one, what else do you expect than literal values?

[10:49:14](#JI8Wm6u9TDDMr0p4GrouXf3TXVA5q3_SLVnjcGKRg2E) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/Sf3C/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/Sf3C/izobrazhenie.png)

[11:01:45](#kWlSMN1m6TYyc6KLvXDNX9P8FZZVV4BX9gbDr_K6fqM) <gurzgri>:
Why is this a block with 25 * 8 = 200 values? It must be 20 blocks of 8 values. At least for the SQL statement cited above, which only lists 8 columns and 8 parameter markers? 

[11:13:27](#l5EGhOlmk0z86lzeUdgwn3BPbUzN8cQuk1gM5hS-aUo) <gurzgri>:
sorry, that's only the debuggig output, my mistake.

[11:17:11](#4kI9WgwpJvG18crYVZllygump5SrpyprYgetHEg58Qo) <bubnenkoff (Dmitry Bubnenkov)>:
do sure? I thought it's mine) I am not sure if I run right copy of app

[11:18:50](#vftAVWEqaqeC-NYAoLSv-fD1Jd5YmpUq50IQVDSPbGU) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/oz5b/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/oz5b/izobrazhenie.png)

[11:18:57](#3JPB5NSwULHh00HtPb090AnnKoXupMTCiXNGwipTMRs) <bubnenkoff (Dmitry Bubnenkov)>:
* do you sure? I thought it's mine) I am not sure if I run right copy of app

[11:19:27](#CXyDJfudo57Ku8ooX5Ore8lJ7Oa8TghSlJuFI1fmWAw) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/dz2I/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/dz2I/izobrazhenie.png)

[11:30:11](#I0oWhZCV-qKjnjggO9XqYKKwd3XCbFdCS8VQWtK1olA) <bubnenkoff (Dmitry Bubnenkov)>:
* The above output is with another data in probe

[11:31:10](#0tBVii0QcMezY-MeqTlVBv-nxdhN2ChcHpWMLnofeiY) <bubnenkoff (Dmitry Bubnenkov)>:
* *The above output is with another data in probe

[11:40:27](#_T29FxNUWid2D_bl3C3KIcL55DQmZrI6MY88-w2WD-0) <bubnenkoff (Dmitry Bubnenkov)>:
that's very strange that if I re-run my app it sometimes work and process several files. Look at ouput:


[11:40:29](#l9V3rpKBqXN1ezmFLA0BeBf82uLOR33A0qTT7D2J4BY) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/nz4R/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/nz4R/izobrazhenie.png)

[12:35:07](#eJcXua6IhseOFHBTJjCOuYHSErHlexQaAj5EXIB_Hgw) <bubnenkoff (Dmitry Bubnenkov)>:
Also I have got question, how correctly to wrap connection in try-catch?
```
    connection: open make port! [
            scheme: 'odbc
            target: "driver={PostgreSQL Unicode};server=127.0.0.1;port=5432;database=fz44;uid=postgres;pwd=123"
        ]
```
I cant print if connection status is ok, or write about error.

I have only one idea to do like: `either  not error? connection [...] [ ... ]`
But maybe there oe better approach? 

[12:35:17](#wBMUbvXfkUaVuxm_meoGmOjn6YsIXhED60MXvs9yI60) <bubnenkoff (Dmitry Bubnenkov)>:
* Also I have got question, how correctly to wrap connection in try-catch?
```
    connection: open make port! [
            scheme: 'odbc
            target: "driver={PostgreSQL Unicode};server=127.0.0.1;port=5432;database=dbname;uid=postgres;pwd=123"
        ]
```
I cant print if connection status is ok, or write about error.

I have only one idea to do like: `either  not error? connection [...] [ ... ]`
But maybe there oe better approach? 

[12:39:38](#FB2bEqwIpaPhXdZ4kQ1r4_vD24ASYDu5smq7IPm5QAU) <gurzgri>:
`help "error"`

[12:40:28](#U0z9Vdmo95rv4KuOOK1fOOWBheW0sEKo3byhGOOTyfU) <gurzgri>:
How do check if the result of `1 / 0` is a error?

[12:43:24](#W61pxvtzS7gq19ufgx85XX6F8QLydYV8HdKP7d0L-XI) <gurzgri>:
* How do you check if the result of `1 / 0` is a error?

[12:43:47](#-6ENJL4XzFwPI6emr97VvJgHCn_kb9aw01Ugpc4zoeo) <gurzgri>:
* How do you check if `1 / 0` results in an error?

[12:46:10](#V2xHjyR7pEHNKZ9_ejOmOXEzQ9ZeTsPN6lb4gNN6m5w) <bubnenkoff (Dmitry Bubnenkov)>:
I get confused every time if Red have same behavior of try-catch with another languages.
```
if error? try [1 / 0] [print "errror" ]
```
Here `try`  work in another manner, it's just try to evaluate block and  return result or errror

[12:56:15](#m2UzZKLwFcptDE7bRpaNuyPX59B_1CHiD1ZiyC9seFw) <bubnenkoff (Dmitry Bubnenkov)>:
```
either not error? try [
    connection: open make port! [
     ; ....
    ]

     print "good connection"
  ] [
      print "bad connection"
 ]
```
It seems that it's not correct

[13:18:34](#plTza-F0QquDL11WoUmGpTjKSk8BGcIEGrb-2IE2Tds) <gurzgri>:
What's wrong with `either error? connection: try [open make port! [handle error] [do something with connection]`?

[13:18:55](#Se7GUyi8N4zH1kbwEJAi-_-bosSHaFoGnyuH0lC-MUI) <gurzgri>:
* What's wrong with `either error? connection: try [open make port! [...]] [handle error] [do something with connection]`?

[13:25:38](#MixwC1fepVKFrvIL0VhNyCoAHX4PHpDb3uOYOBbsZAk) <bubnenkoff (Dmitry Bubnenkov)>:
I made a syntax mistake, thanks

[13:48:35](#kf1lDdN_OexnutJzPshlbws1dCiYQuD6OUMrGIESXFs) <GiuseppeChillemi (GiuseppeChillemi)>:
Just a note about column name like `2data`: I have seen that in Rebol they can be created with `to word` but in Red give error. It would be nice addition on Red 

[13:48:48](#XlPvO3YjXFg3z0rUbR0GECaW2a0MZ3NHasFURpmOmYQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* Just a note about column names like `2data`: I have seen that in Rebol they can be created with `to word` but in Red give error. It would be nice addition on Red 

[19:09:32](#x5KBPspj96zgxVvJjTSAdJT_U6waeFADgfOMGEIlRyE) <gurzgri>:
* Just a note about column names like `2data`: I have seen that in Rebol they can be created with `to word` but in Red give error. It would be nice addition on Red 

[19:10:14](#UojvvuzJ1-qTltXHyhJ3LnIckp60Y7l6K8hKyNUNURs) <gurzgri>:
* What happens when you insert each set of params one after another? Does each one fail? Do some succeed?
```Red
SKIPPED: 0
foreach [key value] flat-data [
	sql: rejoin [{INSERT INTO } key " " block-to-quoted-round-brackets/double value/keys " VALUES "  generate-values-placeholder length? value/keys  ]
    unique?: no 
    foreach el db-uniq-keys-constraints-rules/(parser-state/current-section) [
        if ((to-lit-word el/1) = key) [
    		unique?: yes 
            append insert-part rejoin [{ ON CONFLICT } block-to-quoted-round-brackets/double el/2 (generate-do-update-part value/keys)]
    ]   ]
    params: either unique? [unique value/values] [value/values]
	probe sql
	data-insert-statement/state/debug?: yes
	foreach row skip params SKIPPED [
		types: collect [forall row [keep type? first row]]
		probe row probe types
		if error? result: try [insert data-insert-statement [sql row]] [
			probe result
]   ]   ]
```

(If it crashes for a given set of params with an access violation, increase SKIPPED accordingly an rerun to test with the next one.)

## 19-Apr-2022

[5:28:34](#2vT-A3-m6IpXuFtu_bo4YLZh9-ZLiZiZNLrvhXsNIFY) <gurzgri>:
What happens when you insert each set of params one after another? Does each one fail? Do some succeed?

```Red
SKIPPED: 0
foreach [key value] flat-data [
    sql: rejoin [{INSERT INTO } key " " block-to-quoted-round-brackets/double value/keys " VALUES "  generate-values-placeholder length? value/keys  ]
    unique?: no 
    foreach el db-uniq-keys-constraints-rules/(parser-state/current-section) [
        if ((to-lit-word el/1) = key) [
            unique?: yes 
            append sql rejoin [{ ON CONFLICT } block-to-quoted-round-brackets/double el/2 (generate-do-update-part value/keys)]
    ]   ]
    params: either unique? [unique value/values] [value/values]
    probe sql
    data-insert-statement/state/debug?: yes
    foreach row skip params SKIPPED [
        types: collect [forall row [keep type? first row]]
        probe row probe types
        if error? result: try [insert data-insert-statement [sql row]] [
            probe result
]   ]   ]
```

(If it crashes for a given set of params with an access violation, increase SKIPPED accordingly an rerun to test with the next one.)

[6:27:22](#VF_7wf7LLzwmx5B7TIDKabrEJNagkxaR-2ZrJ1-G2SI) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/iA0C/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/iA0C/izobrazhenie.png)

[6:28:34](#ldPcLLFJd3f85Z00invn_Ql-OfoK7xgp97eKgoVMVRs) <bubnenkoff (Dmitry Bubnenkov)>:
It works already 5 minutes, no crush, but it seems that it do not insert nothing 

[12:19:07](#tBboLedosXK_XH0HfaEdoY7UimRCj_N2nVqETBXSVcU) <gurzgri>:
At which commit is this? Please update the branch with latest commits and rerun. Same errors?

[12:40:34](#Z2cvUGmsn-I1fLFrt1CjIDzIgr4nKX2mkowP8-MADyg) <bubnenkoff (Dmitry Bubnenkov)>:
At which commit is this? Please update the branch with latest commits and rerun. Same errors?

[12:48:30](#6OqiMH4xHYcgQAxp2D1TxYwlhMfC8-x3bn0QWybWt5I) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri on the last commit it seems that your code above works. at least it work already 2 minutes and I see result in DB

[12:49:46](#B7CfPid0eK6OjCOCGUgXhmDFJnl6KvwJdoYv-6stwbM) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/lA4H/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/lA4H/izobrazhenie.png)

[12:55:57](#vXFt01eMpsIlMCyd0BfNEb09REhjfwhuI8zdkCNcXG0) <bubnenkoff (Dmitry Bubnenkov)>:
I tried my old code again - it have same problem as before.
I do not fully understand what your code is doing? It done only for testing bug and then I will be able to use original insert function?

[13:42:12](#1N9dua0KLnGrCq2sWH1i-krviU2M2_Fk8TxYukpOe5Q) <gurzgri>:
> when you insert each set of params one after another

[13:43:18](#rLLfJF3_00wr2-0AqmKzlGhXyQ_01s9w2Bxci5Ov7lo) <gurzgri>:
And what's with inserting multiple param sets at once with
```Red
```Red
foreach [key value] flat-data [
    sql: rejoin [{INSERT INTO } key " " block-to-quoted-round-brackets/double value/keys " VALUES "  generate-values-placeholder length? value/keys  ]
    unique?: no 
    foreach el db-uniq-keys-constraints-rules/(parser-state/current-section) [
        if ((to-lit-word el/1) = key) [
            unique?: yes 
            append sql rejoin [{ ON CONFLICT } block-to-quoted-round-brackets/double el/2 (generate-do-update-part value/keys)]
    ]   ]
    probe sql
    params: either unique? [unique value/values] [value/values]
    types: collect [foreach row params [forall row [keep type? first row]]]
	probe new-line/all params on
	probe new-line/skip types on length? first params
    data-insert-statement/state/debug?: yes
    if error? result: try [insert data-insert-statement compose [sql (params)]] [
        probe result
]   ]
```

[16:35:22](#OOyDFbJEGcyLRDn8kOOa1NaJlwFO3htKZPCkPxy6v_4) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/R5dy/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/R5dy/izobrazhenie.png)

[16:35:42](#H_J-Xnqj2SLTu54RTdzL1qYsDQBE3rRKGCSVUFBXMdQ) <bubnenkoff (Dmitry Bubnenkov)>:
After few minutes of work I got ^ 

[16:35:52](#lJ2FIz0Qa23g2tFVoSJzIsMJwrbibzYXXzrvglH3b8c) <bubnenkoff (Dmitry Bubnenkov)>:
*  I got ^ 

[16:36:02](#fbCYZwQAYjEHikPCFSPgJa_HuXxCVrO4TzzOEcV9MMY) <bubnenkoff (Dmitry Bubnenkov)>:
*  I got next error ^ 

[19:23:24](#o6nSJLI_Ptic06qvXyv47QqJ3aX3TG-RmQwOo1WbhP8) <gurzgri>:
So we're getting closer ������ Two things come to mind: 1) it may fail with multiple rowsets in general (rather unlikely) or 2) it may fail for specific param types (a bit more likely, I have a little suspicion about floats). 

Please run my last code suggestion again in a `--debug` enabled console and redirect the full output of your script with Windows cmd stdout and stderr redirection as in `.\console.exe --do path\to\your\script.red > path\to\your\script.log 2>&1`. Please provide to log and your script as private gist, these screenshots are really sub-optimal for debugging. 

## 20-Apr-2022

[6:57:57](#rt9rhbIH_kTEonhm6-WHChKIJ-fJtM1QGRaveFcZan4) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri done https://gist.github.com/bubnenkoff/26de6da79a2bb6e7efd82d34284a5395

[21:10:18](#icVJT1U4EklpECtJEtqo6QVL_ybJHHsOWSllwjkw3eI) <gurzgri>:
Thanks for that. There really must be some kind of buffer related bug with float params — I crafted me some more tests and observe some "random" access violations with these, too.
 
As a work around, eventually you might have more luck if you convert `float!` values to `string!` values.

In the example code above, you can do that e.g. like so:

```Red
    ...
    params: either unique? [unique value/values] [value/values]
+++ parse params [some [into [some [param: change float! (form first param) | skip]]]]
    types: collect [foreach row params [forall row [keep type? first row]]]
    ...
```

Just add the line marked with `+++`, it will form every float value it comes across, leaving all other values untouched.
 

[21:12:33](#zIq2GoTwaPttEMvWLCnI2k4MQbkjrKHn8pDRZiYaab8) <gurzgri>:
Hunting down the bug and fixing it will take some time, I'll have to find some time for working on that.

## 21-Apr-2022

[7:18:06](#GMv7T6DJi6o22h61GxvbOQ1CDwdJzQF_5Yhcc16LheM) <bubnenkoff (Dmitry Bubnenkov)>:
Big thanks! And thanks for providing work around. I am going on vocation soon, and I will be back only 15 of May, so hope that you will find solution, if not -- I will try to use this work around

[18:30:45](#ffUdMg1Z5RPlQGFbojpbbo99vRHpWT-nvSOEPZ7pt9Q) <GiuseppeChillemi (GiuseppeChillemi)>:
When it will be more stable I will try it in an unconventional scenery: I will ask for a 1 month trial of Excel ODBC interface and we will use Red ODBC on it.

[18:31:25](#M_sXqUja2OZy9rVcOi8mOfTmzu2Ze4CTVRpuSGcnMuI) <GiuseppeChillemi (GiuseppeChillemi)>:
Pardon (I am on mobile) : Outlook/Exchange ODBC

[20:22:23](#U41YHuWdj7gUxTgiaRZeE7tBXTuuAcf43Zfwm0Y6mUg) <gurzgri>:
@bubnenkoff Good catch with that `float!` bug thing! Pushed a fix which should fix it already.

[20:22:38](#04DoDais8sIasP6Caklf-NlE84f4yWwzDm1g8v6XblU) <gurzgri>:
* @bubnenkoff Good catch with that `float!` bug thing! Pushed a commit which should fix it already.

[20:23:05](#C-PJg3skvqvMf2cIuXH5xEoUUYsjowzh19LQgkxXwvw) <gurzgri>:
Happy holidays!

## 22-Apr-2022

[8:11:12](#Cpciwyx5nYQlhOm1hpi1J9MYeUI00AJVbk3i9RknXKw) <bubnenkoff (Dmitry Bubnenkov)>:
Perfect! I am still here, pulling!

[12:35:31](#c_p7rzv2hR9l5IYi9_w-7bkkbXFSKRu1lzGdKCjMOzQ) <bubnenkoff (Dmitry Bubnenkov)>:
It's seems that it's works! But I will continue testing 

[19:52:45](#8LZhdOcQkecZ5-uhMXrOZxCZo8wvHGLbt75FREmE-DE) <greggirwin (Gregg Irwin)>:
Thanks, all, for continuing to work on and test this!

[22:36:01](#N-19ELQGiuMdFonguNX1LGWcRUweWV_RLifbtcDpGUs) <GiuseppeChillemi (GiuseppeChillemi)>:
It is 1 of the 4 pillars we still needs

[22:36:27](#Qt9699NgAlHQSulfJxwz5eXCcWroDF2ssjxzawJ7V3s) <GiuseppeChillemi (GiuseppeChillemi)>:
*need

## 4-May-2022

[7:39:56](#JdpbEehD540MdTGOC3JgL2B-JiEN2ymP6FF7KgCTpNk) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri Have you seen this in Gui-Branch group?

[7:40:01](#MU8oYoasa-kTpeN4wj6oZZPb0Cf6XH2g5tfRD3JkdjQ) <GiuseppeChillemi (GiuseppeChillemi)>:
https://gist.github.com/GiuseppeChillemi/049a1ae7397aef600ea30845606b46a0

[7:40:40](#obeOY1L93dVon6RFAG--iahjgqm1iyO-RMcFj31hZLs) <GiuseppeChillemi (GiuseppeChillemi)>:
It is little part of a 10000 rows query. 

[7:41:43](#UatCccWltymASMfKTbqKQk4E8L64S3xKLUuN03VUTiw) <GiuseppeChillemi (GiuseppeChillemi)>:
For some strange reason, some lines are split in multiple parts and there are CR/LF on the.

[19:25:33](#gL1N_l3gXSjD_PZKvsA8Qr_So-pDQ8HpLmQN5EOnX2M) <gurzgri>:
Never experienced this myself. I recommend using `change statement [debug?: yes]` before fetching, then examine the raw binary transmitted strings, look out for byte codes of unprintable characters and such.

## 6-May-2022

[16:17:04](#u9LAs6ydNhgcNmI422XeSjCvCuc22P_n_FdgWJFOBv8) <gurzgri>:
@GiuseppeChillemi So, not as urgent as it seemed to be then?

[18:07:04](#4bx4D1ePaKvkFzIfqBZNLfiA6zdHbzGNZa8cfEy7bfs) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri Christian, the answer is simpler, the last days have been very stressful and at night I have had just the force to make some simple coding and messaging.  Will be back on the topic tomorrow.

[18:07:11](#vlyJq15YDx0NCtOh2f1ysf40Bpjfr3bYJAVo210ETq8) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri Christian, the answer is simpler, the last days have been very stressful and at night I have had just the force to make some simple coding and messaging.  I will be back on the topic tomorrow.

[18:07:24](#xlaeKZm2l8xfP-TMaAZ45tAMAH3YMi9F3Tud_b_uLKA) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri Christian, the answer is simpler: the last days have been very stressful and at night I have had just the force to make some simple coding and messaging.  I will be back on the topic tomorrow.

[18:41:40](#cWTvWz-KWlazTavpojhgOfXMKxoq0nVQwr5uGzt6lYc) <gurzgri>:
Okay ������ So let me know if I can help. Probably not before next week, this weekend is busy for me.

## 16-May-2022

[17:03:29](#7glx7y9zsDEFal-dFZXO7T01PZbKROvfIpEPlBM4lso) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri @hiiamboris @greggirwin 

As written here https://gitter.im/red/database?at=62722dcb949ae940068db351 , I have some unexpected CR/LF  on my query result which I have visually inspected after saving it on a file.
I have done some further investigations and...

... The problem does not happen if using the DOS console but has appeared randomly on the gui-console;
I have changed the query size from 10.000 to 1.000-3000 and it has not triggered;
I have then tried to save the query result obtained in the console version of RED on `FILE-A` and the output of the query tun of the gui-console on `FILE-B`. I then I have tried `difference FA FB` in the GUI-Console  nd I have received a `stack overflow error`. 
After this, without closing the gui-console, I have tried to rerun the query and save it , every file was PERFECT, without any error!
I have then tried again obtaining a predictable result:
If you run the query and save it on the GUI-CONSOLE you have few CR/LF on the first run and MANY on the subsequent
If you have a stack overflow, than no more error of any kind


[17:03:44](#b6kb-X7nJmP3nNLNoYX-VdlVM7V3W0mgu5QqewWErRk) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri @hiiamboris @greggirwin 

As written here https://gitter.im/red/database?at=62722dcb949ae940068db351 , I have some unexpected CR/LF  on my query result which I have visually inspected after saving it on a file.
I have done some further investigations and...

... The problem does not happen when using the DOS console but has appeared randomly on the gui-console;
I have changed the query size from 10.000 to 1.000-3000 and it has not triggered;
I have then tried to save the query result obtained in the console version of RED on `FILE-A` and the output of the query tun of the gui-console on `FILE-B`. I then I have tried `difference FA FB` in the GUI-Console  nd I have received a `stack overflow error`. 
After this, without closing the gui-console, I have tried to rerun the query and save it , every file was PERFECT, without any error!
I have then tried again obtaining a predictable result:
If you run the query and save it on the GUI-CONSOLE you have few CR/LF on the first run and MANY on the subsequent
If you have a stack overflow, than no more error of any kind


[17:04:22](#pqMmobjCrfEM7DY9d-QCUJu_65ZquffsoYb6cqVzir4) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri @hiiamboris @greggirwin 

As written here https://gitter.im/red/database?at=62722dcb949ae940068db351 , I have some unexpected CR/LF  on my query result which I have visually inspected after saving it on a file.
I have done some further investigations and...

... The problem does not happen when using the DOS console but has appeared randomly on the gui-console;
I have changed the query size from 10.000 to 1.000-3000 and it has not triggered;
I have then tried to save the query result obtained in the console version of RED on `FILE-A` and the output of the query run in the gui-console on `FILE-B`. I then I have tried `difference FA FB` in the GUI-Console  nd I have received a `stack overflow error`. 
After this, without closing the gui-console, I have tried to rerun the query and save it , every file was PERFECT, without any error!
I have then tried again obtaining a predictable result:
If you run the query and save it on the GUI-CONSOLE you have few CR/LF on the first run and MANY on the subsequent
If you have a stack overflow, than no more error of any kind


[17:04:35](#XBYG3tInMTHK_EMYGoBp4wiEo0-JBxUTsjh7_JxwizI) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri @hiiamboris @greggirwin 

As written here https://gitter.im/red/database?at=62722dcb949ae940068db351 , I have some unexpected CR/LF  on my query result which I have visually inspected after saving it on a file.
I have done some further investigations and...

... The problem does not happen when using the DOS console but has appeared randomly on the gui-console;
I have changed the query size from 10.000 to 1.000-3000 and it has not triggered;
I have then tried to save the query result obtained in the console version of RED on `FILE-A` and save the output of the query run in the gui-console on `FILE-B`. I then I have tried `difference FA FB` in the GUI-Console  nd I have received a `stack overflow error`. 
After this, without closing the gui-console, I have tried to rerun the query and save it , every file was PERFECT, without any error!
I have then tried again obtaining a predictable result:
If you run the query and save it on the GUI-CONSOLE you have few CR/LF on the first run and MANY on the subsequent
If you have a stack overflow, than no more error of any kind


[17:04:57](#U5flZLAHgxkgpaP-ZagAmamBhmgbiN_bPlFGiyxICxM) <GiuseppeChillemi (GiuseppeChillemi)>:
How could I further investigate? 

[17:10:05](#Stg6M-eR7cTDzLIEqC1g0WysIYKmTZbXcmnap-LFY88) <GiuseppeChillemi (GiuseppeChillemi)>:
Guess what has happened with `recycle/off`!

[17:12:04](#OiMsesEdu996AOHT2L4zov3YebO-IDJh-Y4KBn575Bs) <hiiamboris (NOT THIS ONE)>:
Find a way for @gurzgri to reproduce it, what else is there to say

[17:13:06](#LlrWWHZn2-R3bw3JFuCUZFCMkrFaSSXNFuGAZ5xSrRE) <GiuseppeChillemi (GiuseppeChillemi)>:
I think the garbage collector does not beling to @gurzgri 

[17:13:32](#lhzk2b9deV-5ER6P8RjqD8L2r1X7heR8TvCzaopxRY0) <GiuseppeChillemi (GiuseppeChillemi)>:
But yes, he could have made changes which impact on it

[17:13:36](#VLzogMQF5X2r-_fMKDb5Ra2E5PziGzM252RdNot-6zw) <hiiamboris (NOT THIS ONE)>:
We still have `mold` producing garbage, but I've only encountered 1 garbage byte in last half a year.

[17:13:53](#zpq_6VovrQgdG6tBhmn7ci3hfEMOwIIhuRNnG4LskkU) <hiiamboris (NOT THIS ONE)>:
So most likely it's DB code.

[17:15:01](#LiOLJhGxdPsDw4B2qvq8PG5r5XraYMthYJpjiuhAR84) <hiiamboris (NOT THIS ONE)>:
Of course, since you're saving and loading big files you will hit this more often

[17:18:11](#ic-sQZoHovobHoKFN3X9bO00u-V-rgb2oL7kPUTO1b0) <hiiamboris (NOT THIS ONE)>:
You should consult @qtxie on the quirks of the GC and how to get on it's good side. He fought it a lot. 

[17:18:40](#AbBJ0H1Mq0M2mt8Witv9FNiKhpgo4eZWcWK-2LL0Vtk) <GiuseppeChillemi (GiuseppeChillemi)>:
Well, another discovery: if I do a `recycle/on` I have again garbage but it if I do a second `recycle/off` I have still garbage the first run of the query after `recycle/off` but no more garbage after on the second run an subsequent

[17:19:38](#C0WC6siv9z9kIVnRpBgArhDDvXF9rWhvdWSLHtqABoM) <GiuseppeChillemi (GiuseppeChillemi)>:
All of this is repeatable, so I have solid base for debugging.

[18:11:01](#dLB4CuzQJnmjJxBBRNeDeqk4GlksVmJgxGBoXa2ADJM) <GiuseppeChillemi (GiuseppeChillemi)>:
I have checked a couple of rows from both good and bad save. They are equal, there are only some spurious CF or LF

[19:09:14](#3d1Pk_x6muLaZ6eMkmYZfnuf0UHtWAE3ephYFwx-x4w) <greggirwin (Gregg Irwin)>:
This is not going to be a fun problem, though I hope @gurzgri can dupe it and that it can be worked around on that side. It's still important to know about *any* GC issues. 

[19:34:03](#VNLMCWP-THTxkfe3ycCck7Pn-kPbjq8HsyiUG_fc9xI) <greggirwin (Gregg Irwin)>:
Something we should do is test @toomasv's `table` style against different data sources (ODBC, SQLite, CSV, simple JSON, native blocks). I will also press for a simple native datastore later this year. One goal of alt-testing is to narrow down where bugs occur. Another is to flush them out and find real-world limits as they relate to memory use, data conversion, GC, and `table` style. The style itself will likely not be a bottleneck because it's all virtual data as far as it's concerned.

To this end, having identical test datasets will be great. If anyone wants to champion that R&D, let me know. 

[20:08:45](#aTPdX_sJjOfI_nuOklisozKFJGrGKvGTvjXEbYxQAN8) <GiuseppeChillemi (GiuseppeChillemi)>:
Is there any way to change stack limit? `DIFFERENCE` hits the ceiling and give `stack overflow`

[20:18:16](#F_PJyxOULacbI82tn9REaNfbuJ0kf1Muh93PFYmt76w) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin I have my company dataset which contains a real life dataset. When RED-ODBC will be stable I could spread and convert part of it to different destinations. Then I could use either Red and Rebol2 (maybe Rebol 3 because of Latin characters) to test everything.

[20:32:26](#Ahm1NaEQmlXuTnumj4I-gKN51UWIlukzfSesWs1fYrU) <gurzgri>:
@GiuseppeChillemi I'm really having trouble following you on your mental jump from problems with `new-line`s in the result set to stack-related problems with `difference`. Are you aware that there *is no* `difference` between `a: head new-line next [1 2] on` and `b: [1 2]`?

[20:49:38](#d9-2OM-wR1ClzrH8y0rYM3jeJM_Ka9FVD1QlAt8s23c) <hiiamboris (NOT THIS ONE)>:
> Is there any way to change stack limit? `DIFFERENCE` hits the ceiling and give `stack overflow`

you can report your finding here https://github.com/red/red/issues/5123

[22:07:58](#vp2l0SKubTMjslu64jjjtwUPEHcWN5obwrb0ehgQDbY) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri It's simpler than I have written:

My query returns 10000 blocks. On the `gui-console`, about 2% of those blocks are split with newlines, while in `DOS debug console` this does not happen

[22:09:58](#r39XX0X_8hxx17eIl7gDc7VyOBMkHY6esZAfdwLx_LM) <GiuseppeChillemi (GiuseppeChillemi)>:
If I use `difference` to compare the `DOS console` query and the `GUI-Console` query files, I have discovered I get a `stack overflow` and this event fixes the `GUI-Console` which does not split blocks on every instance of the query.

[22:10:37](#MSC078Br6WLPDkmz9DYMYA3Fj79ULt-1XBFbJxahsYQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* If I use `difference` to compare the `DOS console` query and the `GUI-Console` query `saved` files, I have discovered I get a `stack overflow` and this event fixes the `GUI-Console` which does not split blocks on every instance of the query.

[22:12:54](#Vl1eaN5hBoUQjROijSTVge3CvLl5AJWU61s-9HJXCk4) <GiuseppeChillemi (GiuseppeChillemi)>:
What I mean for splitten blocks? There are `newlines` between values but you can `LOAD` this block. 

[22:14:40](#qqgg06I0L_7Bgd8-1fP071ah5VHNQW-gCek2DAwp9SE) <GiuseppeChillemi (GiuseppeChillemi)>:
If compare it with the same ROW in the `dos version` there is no diference. Trying `DOS-BLOCK = GUI-SPLITTED-BLOCK` Red returns `TRUE`

[22:14:57](#uw0LlqKQB614grHzt7me1pFEn3Qy2e2nZipUcfYrcWE) <GiuseppeChillemi (GiuseppeChillemi)>:
* If compare it with the same ROW in the `dos version` there is no diference. Trying `DOS-BLOCK = GUI-SPLITTED-BLOCK`, Red returns `TRUE`

[22:15:40](#2V2i98EZlwW5n1Mu8vGpOU_OsYl7VXFdGYQwp2M66QE) <GiuseppeChillemi (GiuseppeChillemi)>:
* If I use `difference` to compare the `DOS console` query and the `GUI-Console` query `saved` files, I have discovered I get a `stack overflow` and this event fixes the `GUI-Console` which does not split blocks anymore on every instance of the query.

[22:16:40](#0GGlHhoon-J6RZCyGjyBArheWAh0RS4kPtszIPOONuA) <GiuseppeChillemi (GiuseppeChillemi)>:
* What I mean for splitten blocks? There are `newlines` between values but you can `LOAD` this block even if it spans 2 or 4 lines. The `newline` is not inside values but, as I said, between them.

[22:17:04](#F4KW9LBiuHN7XjyyGvV8kbNRuZza_oxRm9LNpGgk6qY) <GiuseppeChillemi (GiuseppeChillemi)>:
* What I mean for splitten blocks? There are `newlines` between values but you can `LOAD` this block even if it spans 2 or 4 lines. The `newline` are not inside values but, as I said, between them.

[22:18:07](#PfdpB7eXs5sQScew7JMOWoeiSkNIG3-QEYpMeBsCo7k) <GiuseppeChillemi (GiuseppeChillemi)>:
* If compare a slit ROW in by `gui-console` , with the same ROW in the `dos version` there is no diference. Trying `DOS-BLOCK = GUI-SPLITTED-BLOCK`, Red returns `TRUE`

[22:18:17](#yy4zew4luUlDROkpmtVZxa4ObjD8PyWi5EMXRBMyOds) <GiuseppeChillemi (GiuseppeChillemi)>:
* If compare a split ROW in by `gui-console` , with the same ROW in the `dos version` there is no diference. Trying `DOS-BLOCK = GUI-SPLITTED-BLOCK`, Red returns `TRUE`

[22:21:51](#py45dGb4VLWLnLQWNH-HxvmkKNf57hK6suPMsti3T8o) <GiuseppeChillemi (GiuseppeChillemi)>:
@greggirwin There is another important source we could use: *open data*. They have big datasets for everything

[22:25:19](#8ShzERpvxEb8lkFnbjkKUIMOqXouoaBz_qCW18Xmpgs) <GiuseppeChillemi (GiuseppeChillemi)>:
I have just tried to search for `difference` loading the two sets in `REBOL2` and the result block is empty. So the only difference are the spurious `newlines`

[22:25:45](#JKqU0K4BiOOBP0pIenjRlZZDkfjZKIP-64b6uMAmsWc) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri  I have just tried to search for `difference` loading the two sets in `REBOL2` and the result block is empty. So the only difference are the spurious `newlines`

[22:26:01](#pd0jy0e_JeB63gcbmiuhyQcKaKLCkM2uGeexMmgFC8Y) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri  I have just tried to search for `difference` loading the two sets in `REBOL2` and the result block is empty. So the only differences are the spurious `newlines`

[23:00:35](#sWbk7j8IrVaBHTy46O5ZzRwJ3WbW7YkzhpnDtmWFCn8) <greggirwin (Gregg Irwin)>:
Let's make a wiki page for data sources.

## 17-May-2022

[5:49:28](#umy0ENeu2WYl0Q64XHo_XzVcHtdnpWTFmQp-RL9tQ8w) <gurzgri>:
@GiuseppeChillemi The odbc scheme inserts a `new-line` (not a `newline`) on every row block of a result set fetched in block mode and adds a `new-line` on every value in the first column of a result set fetched in `change statement  [flat?: yes]` mode *on purpose* for improved readability in the console (whether GUI or not), but adds no `new-line`s on values in block mode. That is there since your earliest attempts and trials using the scheme, so I don‘t expect that you are talking about these?

[6:13:36](#xLHrv0gvNZ9FbkKUKoM_l3G_Gz5ZEU-7ln9cy1Ja7Dw) <GiuseppeChillemi (GiuseppeChillemi)>:
No, I am not talking about this, but this: https://gist.github.com/GiuseppeChillemi/049a1ae7397aef600ea30845606b46a0

[6:15:10](#irM1UjpnxEzeXa85j-F3Lc2tv3lXd4KIISN8huhix2w) <GiuseppeChillemi (GiuseppeChillemi)>:
As you can see, some blocks have a line feed somewhere in the middle, even multiple ones. This does not happen in dos console, or in gui console after there is a `stack overflow` which seems to fix the problem

[6:16:31](#eGoy8b5cBtn0m_rsS_yXsBSmzicycKlQqMm3qqTaVsA) <GiuseppeChillemi (GiuseppeChillemi)>:
* As you can see some blocks have a line feed somewhere in the middle, even multiple ones. This does not happen in dos console, or in gui console after there is a `stack overflow` which seems to fix the problem

[6:42:59](#NgxmGAmujOJtOekm-m8OdUrN6875b3lIEIG7RiC6fx4) <GiuseppeChillemi (GiuseppeChillemi)>:
And to I avoid any confusion: *this is not an output of the console* but a query result obtained with the following code:

```
        the-query:  "SELECT top 10000 * from dotes"
	st: open cn: switch 'b-ok con
	insert st the-query
	x: copy st
	save %direct-query.txt x
```


[6:43:33](#MbaLVbRoLsTM9vLT1ZXu4GXNUx8HOLPEZ2ofwzVggzg) <GiuseppeChillemi (GiuseppeChillemi)>:
* And to I avoid any confusion: *this is not an output of the console* but a query result obtained with the following code:

```
	the-query:  "SELECT top 10000 * from dotes"
	st: open cn: switch 'b-ok con
	insert st the-query
	x: copy st
	save %direct-query.txt x
```


[6:45:58](#515jy62JbGRwE_pmSYAeUzjI5bYIwAm-bVQJlykMeMA) <GiuseppeChillemi (GiuseppeChillemi)>:
* And to I avoid any confusion: *this is not an output of the console* but a query result obtained with the following code:

```
	the-query:  "SELECT top 10000 * from dotes"
	st: open cn: switch 'b-ok con
	insert st the-query
	x: copy st
	save %direct-query.txt x
```


[6:46:43](#DobIl7q2KGifXmcuCjQiy5HVpRH8Y4ho24f9wlxJjdw) <GiuseppeChillemi (GiuseppeChillemi)>:
* And to I avoid any confusion: *this is not an output of the console* but a query result obtained with the following code:

```
	the-query:  "SELECT top 10000 * from dotes"
	st: open cn: switch 'b-ok con
	insert st the-query
	x: copy st
	save %direct-query.txt x
```


[6:47:01](#itg0-uN5Z53zBmAnyL6ndWYXLUy1J-ipZGT8qFKivi8) <GiuseppeChillemi (GiuseppeChillemi)>:
* And you get a perfect save even if you cause a `stack overflow` before running it in the GUI Console.

[7:09:36](#M3SmWvhO71IbPveci9IdzcQGEhaaBaxRk6Wqcq_CXB4) <GiuseppeChillemi (GiuseppeChillemi)>:
If you open `%direct-query.txt` obtained running this code on the GUI console, you get the result with LF in the middle. If you run it on the debug console, you get a perfect save!

[7:10:22](#ke8P9iU8bVLUxfyKRseMYAPkZ3orzGAJUhkkUJ1wbKg) <GiuseppeChillemi (GiuseppeChillemi)>:
Also, you get a perfect save if you cause a `stack overflow` before running this code in the GUI Console.

[7:10:36](#H2-WzMI5YokAZWUEKdRI41CnUWCrNeAZadeOoTm70EE) <GiuseppeChillemi (GiuseppeChillemi)>:
* If you open in an editor `%direct-query.txt` obtained running this code on the GUI console, you get the result with LF in the middle. If you run it on the debug console, you get a perfect save!

[7:11:14](#6VHjXbDm8qu2UfNM2LjWYyT6YYc0LpX1MYe5k_E7OKQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* If you open in an editor `%direct-query.txt` obtained running this code on the GUI console, you get the result with LF in the middle. If you run this code on the debug console, you get a perfect save!

## 18-May-2022

[10:00:43](#l3j9S07_82Ur4_IpyqXEJJLPqvCYKyEUC9et3wV94NY) <GiuseppeChillemi (GiuseppeChillemi)>:
* If you open in an editor `%direct-query.txt` obtained running this code on the GUI console, you get the result with LF in the middle. If you run this code on the debug console, you get a perfect save!

[10:05:24](#SjFJCGLmZVyDub2b6UXG6ZcFlIzbWaChGd4NIu_s4m8) <GiuseppeChillemi (GiuseppeChillemi)>:
> Let's make a wiki page for data sources.

Please,  create it and I give myself volunteer fro this task.

[10:05:53](#T2drPfVp6MUXhLaC2CF0MNcpujCGzMlogEjeniiWcew) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin
> Let's make a wiki page for data sources.

Please,  create it and I give myself volunteer fro this task.

[10:06:07](#-QXkLbD_FznouxSis3cg0Oa4lesIaYD9ma1f4wyJYOM) <GiuseppeChillemi (GiuseppeChillemi)>:
* @greggirwin
> Let's make a wiki page for data sources.

Please,  create it and I give myself volunteer for this task.

[10:07:03](#z766AJgUbypvnNp-8Tz-xSERqIBOzi2iGu5dqyqrzUE) <GiuseppeChillemi (GiuseppeChillemi)>:
I will also create it on my Github to keep a local repository.

## 20-May-2022

[17:32:27](#50IFfGJB1pxBxvO1B1ZxdNWJx4Mi7yyD5OZrlQAfI9g) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri hi!
I want to wrap code to handle error if it will happen during insert. How to do it? Should I place this code it `try` block?
```
  insert data-insert-statement compose [ 
  (insert-part)
  (prepared-values-part)
]
```

[17:35:25](#Z-TdysRQybqYa4qlmFpnsq3AMBa1A5sgzux37-k12bU) <bubnenkoff (Dmitry Bubnenkov)>:
The error that I got is `Script Error: ODBC error: ["23505" 1 ERROR: repeating key value violates uniqueness restriction` I forgot set some DB restriction, but I want to handle this error and print request on with it caused it

[17:45:18](#AFmaV1tCvE06-O93ofj4-bfp_0Sn6gENZad9rEOf1Rc) <bubnenkoff (Dmitry Bubnenkov)>:
This code works, but is it's good?
```
            if error? try [
                insert data-insert-statement compose [ 
                    (insert-part)
                    (prepared-values-part)
                ] 
            ]   [
                    print insert-part ; and some error handling
                ]
```

[17:45:37](#nlgPYefc8U7x629HW2BuLAElzb74Sqo8xtsqHKXrH2Q) <bubnenkoff (Dmitry Bubnenkov)>:
* This code works, but is it's good?
```
 if error? try [
       insert data-insert-statement compose [ 
        (insert-part)
         (prepared-values-part)
     ] 
 ]   [
         print insert-part ; and some error handling
 ]
```

[19:30:56](#j9cPOqkP5vn8e2Xr8cw-ClfzertCCB8tNoJ5jqR3WOw) <greggirwin (Gregg Irwin)>:
You can capture the error as well. e.g. `if error? set/any 'res try cmd: [1 / 0] [print [mold cmd 'caused mold res]]`

## 21-May-2022

[16:37:30](#Cowcc-nSNKSWyfXlTdux3eAfD-QQSek4DmLlcKWdW7M) <gurzgri>:
Just as Gregg said, except that because of `insert` always returning a value, there's be no need for `set/any`:
```
if error? result: try [insert statement sql] [probe result]
```

will do fine.

[16:37:41](#qbDIN95fKH_MuHUPbAbyRFHkMj4n1Vah7b-1A4fseKc) <gurzgri>:
* Just as Gregg said, except that because of `insert` always returning a value, there's no need for `set/any`:
```
if error? result: try [insert statement sql] [probe result]
```

will do fine.

## 23-May-2022

[18:05:47](#nwx5pz6b-EISO3AQ_K4V5Ud_2L9f-T9hgj5wiHlhbaY) <gurzgri>:
@toomasv @GiuseppeChillemi : Retrieving deferred columns (BLOB, TEXT) is already implemented, but isn't properly  documented yet:

`pick`ing from a statement port by column word, column name string or column index number is possible, but is restricted to retrieving blobs/texts from the first row only in the current rowset. If your `statement/state/window` size is greater than 1 and the rowset is position on row *n*, with this you're not able to pick from row *n+1* and further. And setting the window size to 1 of course isn't efficent either. 

Ports to the rescue: You can 
```
cursor: open statement: open connection: odbc://dsn  
change statement [window: 1'000]
insert statement "select invoiceNr, invoicePdf from invoices"
rows: next statement
at cursor 333 pdf333: pick cursor 'invoice-pdf
at cursor 444 pdf444: pick cursor 'invoice-pdf
```

with arbitrary window sizes.

@GiuseppeChillemi : Yet another `open` level to grasp ������ Connections, statements, cursors ... all are ports. Have fun! 


[18:06:17](#ABvPWKcGq-k28pltSKMj6UFbQAsWsCYrDRI9fkH1j04) <gurzgri>:
* @toomasv @GiuseppeChillemi : Retrieving deferred columns (BLOB, TEXT) is already implemented, but isn't properly  documented yet:

`pick`ing from a statement port by column word, column name string or column index number is possible, but is restricted to retrieving blobs/texts from the first row only in the current rowset. If your `statement/state/window` size is greater than 1 and the rowset is positioned on row *n*, with this you're not able to pick from row *n+1* and further. And setting the window size to 1 of course isn't efficent either. 

Ports to the rescue: You can 
```
cursor: open statement: open connection: odbc://dsn  
change statement [window: 1'000]
insert statement "select invoiceNr, invoicePdf from invoices"
rows: next statement
at cursor 333 pdf333: pick cursor 'invoice-pdf
at cursor 444 pdf444: pick cursor 'invoice-pdf
```

with arbitrary window sizes.

@GiuseppeChillemi : Yet another `open` level to grasp ;) Connections, statements, cursors ... all are ports. Have fun! 


[18:06:45](#2kR7yBmfE5mSvKQnM7Urg3uE0FOtvtoe4JNxnccK4wY) <gurzgri>:
* @toomasv @GiuseppeChillemi : Retrieving deferred columns (BLOB, TEXT) is already implemented, but isn't properly  documented yet:

`pick`ing from a statement port by column word, column name string or column index number is possible, but is restricted to retrieving blobs/texts from the first row only in the current rowset. If your `statement/state/window` size is greater than 1 and the rowset is positioned on row *n*, with this you're not able to pick from row *n+1* and further. And setting the window size to 1 of course isn't efficent either. 

Ports to the rescue: You can 
```
cursor: open statement: open connection: open odbc://dsn  
change statement [window: 1'000]
insert statement "select invoiceNr, invoicePdf from invoices"
rows: next statement
at cursor 333 pdf333: pick cursor 'invoice-pdf
at cursor 444 pdf444: pick cursor 'invoice-pdf
```

with arbitrary window sizes.

@GiuseppeChillemi : Yet another `open` level to grasp ;) Connections, statements, cursors ... all are ports. Have fun! 


[18:07:36](#cfzRP4fGshzbzxg9WeDZZm2VkMIN8NiuIviaUK3pvkA) <gurzgri>:
* @toomasv @GiuseppeChillemi : Retrieving deferred columns (BLOB, TEXT) is already implemented, but isn't properly  documented yet:

`pick`ing from a statement port by column word, column name string or column index number is possible, but is restricted to retrieving blobs/texts from the first row only in the current rowset. If your `statement/state/window` size is greater than 1 and the rowset is positioned on row *n*, with this you're not able to pick from row *n+1* and further. And setting the window size to 1 of course isn't efficent either. 

Ports to the rescue: You can 
```
cursor: open statement: open connection: open odbc://dsn  
change statement [window: 1'000]
insert statement "select invoiceNr, invoicePdf from invoices"
rows: next statement                                                                ;-- fetch the first 1'000 invoices
at cursor 333 pdf333: pick cursor 'invoice-pdf              ;    fetch the pdf of row 333 only
at cursor 444 pdf444: pick cursor 'invoice-pdf              ;    and row 444
```

with arbitrary window sizes.

@GiuseppeChillemi : Yet another `open` level to grasp ;) Connections, statements, cursors ... all are ports. Have fun! 


[18:08:24](#apn30JLEXChjh5evlcnWtCJuKD_zjhOKyRZJKzLSvLE) <gurzgri>:
* @toomasv @GiuseppeChillemi : Retrieving deferred columns (BLOB, TEXT) is already implemented, but isn't properly  documented yet:

`pick`ing from a statement port by column word, column name string or column index number is possible, but is restricted to retrieving blobs/texts from the first row only in the current rowset. If your `statement/state/window` size is greater than 1 and the rowset is positioned on row *n*, with this you're not able to pick from row *n+1* and further. And setting the window size to 1 of course isn't efficent either. 

Ports to the rescue: You can 
```
cursor: open statement: open connection: open odbc://dsn  
change statement [window: 1'000]
insert statement "select invoiceNr, invoicePdf from invoices"
rows: next statement                                        ;-- fetch the first 1'000 invoices
at cursor 333 pdf333: pick cursor 'invoice-pdf              ;-- but fetch the pdf of row 333 
at cursor 444 pdf444: pick cursor 'invoice-pdf              ;   and row 444 only
```

with arbitrary window sizes.

@GiuseppeChillemi : Yet another `open` level to grasp ;) Connections, statements, cursors ... all are ports. Have fun! 


[18:11:35](#pOvvPH8zFpp4mOGq4k0xfbdaxRajqxiememPcSI2CRA) <gurzgri>:
Writing BLOB/TEXT isn't possible yet, just as Giuseppe said. It probably will be done by `poke cursor 'invoice-pdf load/binary %invoice000333.pdf`.

[18:12:44](#CX2TbUj_avmP34CxkeCXkR2kDA5WGJQeAHkVdE2o-is) <toomasv>:
Thanks, @gurzgri ! I'll try this out tomorrow. It is great tool you have done!

[18:12:45](#Q9YrmIDENy4jYE4rAZsohUZTNEN-aNhz_dTBXSCWAZ4) <gurzgri>:
* @toomasv @GiuseppeChillemi : Retrieving deferred columns (BLOB, TEXT) is already implemented, but isn't properly  documented yet:

`pick`ing from a statement port by column word, column name string or column index number is possible, but is restricted to retrieving blobs/texts from the first row only in the current rowset. If your `statement/state/window` size is greater than 1 and the rowset is positioned on row *n*, with this you're not able to pick from row *n+1* and further. And setting the window size to 1 of course isn't efficent either. 

Ports to the rescue: You can 
```Red
cursor: open statement: open connection: open odbc://dsn  
change statement [window: 1'000]
insert statement "select invoiceNr, invoicePdf from invoices"
rows: next statement                                        ;-- fetch the first 1'000 invoices
at cursor 333 pdf333: pick cursor 'invoice-pdf              ;-- but fetch the pdf of row 333 
at cursor 444 pdf444: pick cursor 'invoice-pdf              ;   and row 444 only
```

with arbitrary window sizes.

@GiuseppeChillemi : Yet another `open` level to grasp ;) Connections, statements, cursors ... all are ports. Have fun! 


[18:16:04](#RS5kRKiz64oiwr8GNZIrq0Jun6-NisV1rrxu3n7O_b0) <gurzgri>:
Thanks, have fun playing. If you experience problems or crashes, they are likely driver/database related and probably related to specific datatypes. So far, the scheme has been tested with Intersystems Caché, PostgreSQL, SQL Server.  

[18:34:19](#fJZ-GB_gkDDNVM2spbJrwtNLKWfTaqeZ-J_QHZLHiJo) <gurzgri>:
Documentation is at https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md, just in case you're wondering

[18:49:56](#nhEt-ATss5Xr0TVIdk6C8PwZGS83QDR8bWWeiVs3VEc) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri If you create some documentation on debugging, Toomas and other developers could help.

[19:02:25](#QDTFYCjcrRxbCS9-nqDCSiCanhUiXIxxl_pU-uWHQ-k) <gurzgri>:
It doesn't take more than a console compiled in `--debug` mode to see what's going on, additionally or alternatively a statement with `statement/state/debug?: on` to inspect binary buffers transferred and the usual discipline and systematic approach which Toomas undoubtedly has in abundance ������

[19:21:40](#KU-fwihx9bC4cN5np4bKXzGSkIyeFQTNaSJ1AVwsTVw) <GiuseppeChillemi (GiuseppeChillemi)>:
Toomas is a newbie in Red, I think you should help him in every step. Maybe with some patience, we will bring him to do great things! 

[19:27:07](#8HrhyQ7KVumOHfvw-j0w7pw_h_jDY62QLesx0261jSQ) <toomasv>:
������ 

[19:27:49](#pzzIolKziYjEEDYgT11wPtPX9Fhasfvm3zu5neTqk7w) <toomasv>:
Thanks, discovered it already! :)

[19:28:04](#K2HGmzQesKnux6B2XpGzUQTiaiIuPnNgW2UPp8hUM-I) <gurzgri>:
An *outperforming* newbie ������, if any. 

[19:28:16](#i5zUb2H1ONu-rscoM-XNiU0PJPaQhJxgZMHmj-NuZY8) <gurzgri>:
* An *outperforming* newbie :baby:, if any. ;)

[21:02:29](#YPuieEQUlzstXTsRbZms5tf0vrmdNokhlgmWwldRCWg) <gurzgri>:
Silly me ������
> Actually RED ODBC is capable of reading but not writing them.
Have you ever tried writing them, @GiuseppeChillemi ? ������ I for sure never tried. I better should have tried ...
> Writing BLOB/TEXT isn't possible yet
is obviously just plain wrong and no `poke statement` is needed (at least as long we aren't talking *really large* blobs and texts). Just now I could easily insert BLOB/TEXT of moderate sizes (the source of https://www.red-lang.org and a 150Kb PDF) into a ostgreSQL table in columns of dataype `text` and `bytea` without further ado ... 

[21:02:47](#zD5puRWKWotvWNN1E36yHNZ2yP54MjjKskmDgu8JdwM) <gurzgri>:
* Silly me :open_mouth:
> Actually RED ODBC is capable of reading but not writing them.

Have you ever tried writing them, @GiuseppeChillemi ? :smirk: I for sure never tried. I better should have tried ...
> Writing BLOB/TEXT isn't possible yet

is obviously just plain wrong and no `poke statement` is needed (at least as long we aren't talking *really large* blobs and texts). Just now I could easily insert BLOB/TEXT of moderate sizes (the source of https://www.red-lang.org and a 150Kb PDF) into a ostgreSQL table in columns of dataype `text` and `bytea` without further ado ... 

[21:03:15](#MTAZF1tM5i069s43WUBGt2jebNLgGkxdRdpjAy1Fe1Y) <gurzgri>:
* Silly me :open_mouth:
> Actually RED ODBC is capable of reading but not writing them.

Have you ever tried writing them, @GiuseppeChillemi ? :smirk: I for sure never tried. I better should have tried ...
> Writing BLOB/TEXT isn't possible yet

is obviously just plain wrong and no `poke statement` is needed (at least as long as we aren't talking *really large* blobs and texts). Just now I could easily insert BLOB/TEXT of moderate sizes (the source of https://www.red-lang.org and a 150Kb PDF) into a ostgreSQL table in columns of dataype `text` and `bytea` without further ado ... 

[21:03:31](#JAitdpEj8vVyoXItU6Rq0teRGvO4i86TPk1Fu-GfLPI) <gurzgri>:
* Silly me :open_mouth:
> Actually RED ODBC is capable of reading but not writing them.

Have you ever tried writing them, @GiuseppeChillemi ? :smirk: I for sure never tried. I better should have tried ...
> Writing BLOB/TEXT isn't possible yet

is obviously just plain wrong and no `poke statement` is needed (at least as long as we aren't talking *really large* blobs and texts). Just now I could easily insert BLOB/TEXT of moderate sizes (the source of https://www.red-lang.org and a 150Kb PDF) into a PostgreSQL table in columns of dataype `text` and `bytea` without further ado ... 

[21:04:13](#VPX4Fjz5702oSmRDJ6gTthopFGQdb24usPsfkzk3u18) <GiuseppeChillemi (GiuseppeChillemi)>:
??? Is it ALREADY working?

[21:05:09](#2BPEocnv24rn-ACAfevT5ROsrlcAvVOqr4ttaVqUDvQ) <gurzgri>:
That is what I just ... well ... discovered ... ������

[21:05:36](#w7X2K6QYWiGvICTZtCc4DvPgax-fPN9zytfARO2JMGI) <GiuseppeChillemi (GiuseppeChillemi)>:
But you are the author!!! OMG!!! ������DDD

[21:05:40](#BpwkwoIPpTyP9xVHqKjkbflD1k6aHGSytAbo9RAUbyw) <gurzgri>:
* That is what I just ... well ... discovered ... :grinning:

[21:05:59](#3bAr2JAQIaWKFwp1ZWELAJAeBh9f3w7i0WOAJuoxNOM) <GiuseppeChillemi (GiuseppeChillemi)>:
However, it is a fantastic news.

[21:06:40](#yDEFNdIJDv_xijwFuUqVkBBDx0KfmxNne4o7Lv6QukM) <GiuseppeChillemi (GiuseppeChillemi)>:
Do you think it could work in SQL Server BLOB column?

[21:07:56](#EljzjUdJ10DueaJ6p9jNP6ushHCHXmoPKlayOxEH-l8) <gurzgri>:
You're probably better off checking on your own, as I'm obviously not an authority regarding the capabilities of my own code ...

[21:08:33](#xna4ElhOCvbDbF8ZWXO_L7au4SinhjJNtU7dOrbLOs8) <GiuseppeChillemi (GiuseppeChillemi)>:
������

[21:08:44](#rkF7VvyHi4UXbNsO0Ykz7wmXNXRKT_crg2AAv7ncd8o) <GiuseppeChillemi (GiuseppeChillemi)>:
Tomorrow I will check.

[21:09:10](#xxwodfhpk0c7HeMdSOb9kbigPu2SRWippWPXCDolrIg) <GiuseppeChillemi (GiuseppeChillemi)>:
Why are you writing "of moderate size"? what established the limit?

[21:11:33](#emiQv4Xf8Xvg4C93wmNP8_K28-RSmrKgVUo5KBdc55w) <gurzgri>:
Because your usual 15 Gb disk image is likely not to work.

[21:14:07](#NdKdc2KkwtXY03sLHbyGXiomc3vj8ajz9tCvJRk76gg) <GiuseppeChillemi (GiuseppeChillemi)>:
BCould 20MB work ?

[21:14:13](#lBvg9T526NTJ80EN8qlYQBf1pgtd7vMZrAJTeLnM-Qo) <GiuseppeChillemi (GiuseppeChillemi)>:
* Could 20MB work ?

[21:14:48](#GB-YhNrRg_tkYinJfPMT5FbZdqJdVvNnxLZHRBLbrZI) <gurzgri>:
I don't know.

[21:14:57](#6TZyEZtw_t2R4vTSdFORMJSYdWtCaTyXydy8iIStIsw) <GiuseppeChillemi (GiuseppeChillemi)>:
I'll try and report

[21:15:25](#dhDZzLYGLy2OGfaFwXRGRbDfPrx-ss0PJHhh-OrGaSY) <GiuseppeChillemi (GiuseppeChillemi)>:
Could I ask if you have any news on the LF problem?

[21:19:37](#zzCaxjNqTHKikLSBVLIrqm-hwdTrxodJBi2fV__yC44) <gurzgri>:
No news. And likely no further investigons on this. I'm still not convinced it's realy scheme related if happening only in/with gui console. I don't know of a way to reproduce it.

[21:21:01](#Z2xujpj2KXA-sT4tk15zTlp5dPN_G8SvH-JpxF1HlJk) <gurzgri>:
There is zero gui / cli only code in the scheme, it either happens in both consoles or it likely happens in gui console for reasons out of my reach.

[21:21:08](#7yy5IkVNrDRW3ZF0OC8E9iPp9B6tfI6OzxEfXkOkBrI) <GiuseppeChillemi (GiuseppeChillemi)>:
If you want we could schedule a meeting and I give you access to my server machine, where I can always reproduce the problem 

[21:21:48](#BkNq3xkjT-bablpXHIV3QZ2vqv2uL3oH-COW70Ocfwg) <gurzgri>:
Sorry, I am not available for that.

[21:23:05](#iNz8WyJLqLEbQfl5y1dsHsHUaMyuTtok8emKI8gwm_Y) <GiuseppeChillemi (GiuseppeChillemi)>:
It is out of my knowledge why where il a LF between values save ONLY in GUI console. 

[21:23:18](#pwhmnwoZtOfRCXtTIXt7vWx9YowFvLhcGtWI25TrTTI) <GiuseppeChillemi (GiuseppeChillemi)>:
* It is out of my knowledge why there is a LF between values save ONLY in GUI console. 

[21:24:11](#l1WhK10cI14c0Hn3ZQFwlYZUqH6KQeCTk87ZNIcFaqU) <GiuseppeChillemi (GiuseppeChillemi)>:
> Sorry, I am not available for that.

Ok, It was just a proposal. I would like to have the knowledge needed to debug it.

## 24-May-2022

[11:19:35](#3Owgppj8FVl-KmfBewSfzRLY0ZAG3RzeXzJEQPqtxdI) <rebolek (Boleslav Březovský)>:
@toomasv I couldn’t resist and wrote proof-of-concept of CSV scheme for Red, so it’s possible to open large CSV files without loading whole file in memory.

The usage is of course different from the CSV codec, it works like any other scheme:
```
port: open csv:///data.csv
port: skip port 200 ; go to line 200 in CSV data
data: copy/part port 10 ; return 10 records (lines) from CSV
```
The scheme first must scan the file for newlines, so it know where each record begins (of course, it ignores newline inside cells). This is done in the `open` action, so there is some overhead.

The scanning is buffered, only a part of file is read into memory and searched. How long this phase takes depends on the size of data and size of the buffer. For the `%WDIData.csv` from your example dataset (around 200MB), scanning takes around 1:20 with buffer size about 0,5-1MB (that’s the optimal size I found). Once the scanning is done, random acces is instant.

It may seem that about one and half a minute is a long time, but because the scanning is buffered, with the new IO, it can by done asynchronously and the CSV may be partially accesssible even before the scanning is finished. This would need more work of course.


[11:21:04](#2am5z96-I1V8haVKdPr9CHBFKRzPyrCawkvbhXt2An0) <rebolek (Boleslav Březovský)>:
Another optimalization could be for example saving index for each scanned file, so subsequend `open`ing would be much faster. As I wrote, it’s just a PoC now.

[11:21:26](#Rh9cSuzX7vmpvy1q6dYWAHFtPkJDskWuaNttNngXv58) <GiuseppeChillemi (GiuseppeChillemi)>:
Nice experiment, great! 

[11:22:01](#YwR-9sB4z8bTSCTeRRp8FkHiqxcMUu5votp12hF7kM0) <rebolek (Boleslav Březovský)>:
* @toomasv I couldn’t resist and wrote proof-of-concept of CSV scheme for Red, so it’s possible to open large CSV files without loading whole file in memory.

The usage is of course different from the CSV codec, it works like any other scheme:
```
port: open csv:///data.csv
port: skip port 200 ; go to line 200 in CSV data
data: copy/part port 10 ; return 10 records (lines) from CSV
```
The scheme first must scan the file for newlines, so it knows where each record begins (of course, it ignores newline inside cells). This is done in the `open` action, so there is some overhead.

The scanning is buffered, only a part of file is read into memory and searched. How long this phase takes depends on the size of data and size of the buffer. For the `%WDIData.csv` from your example dataset (around 200MB), scanning takes around 1:20 with buffer size about 0,5-1MB (that’s the optimal size I found). Once the scanning is done, random acces is instant.

It may seem that about one and half a minute is a long time, but because the scanning is buffered, with the new IO, it can by done asynchronously and the CSV may be partially accesssible even before the scanning is finished. This would need more work of course.


[12:47:16](#75T4rEOzbgOhieUfW8ZIcMVdnuJjgHmo6ptGAtd2aNs) <toomasv>:
@rebolek Great, thanks! I'll try it out soon.

[12:50:48](#G-dis1nFZJZWgomOYMHbozocIWZxckr-7OqeGg3fKGc) <toomasv>:
* @rebolek Sounds good, thanks! Can I try it? A link? 

[13:39:14](#i-YNA-Ffcuwc4hbjNLGTbHn5aEHIkD1tk0Gh-jhe_EQ) <rebolek (Boleslav Březovský)>:
@toomasv of course: https://gitlab.com/rebolek/schemes

[13:40:32](#UcWS20JGoowne3JMlrh-aFg10_O78phlZcBtGG0XjqQ) <rebolek (Boleslav Březovský)>:
It’s an initial release and currently it just collects lines from CSV and doesn’t convert them to Red values so you get block of strings. I also accidentally added the dataset to the repo so it’s hugu, sorry for that :) II’ll remove it.

[13:40:40](#0WBOLqp8SOAWQDcef4Jw_jbAWICu2wHn6b-JIol36xw) <rebolek (Boleslav Březovský)>:
* It’s an initial release and currently it just collects lines from CSV and doesn’t convert them to Red values so you get block of strings. I also accidentally added the dataset to the repo so it’s hugu, sorry for that :) I’ll remove it.

[14:42:33](#Ap2HktbkmSyMDaOM5ScwDOyFdqCSzpsKkNqCDJc_RYs) <toomasv>:
Thanks, @rebolek !

[14:57:23](#HBhaTEfE_sMxlfjZdCw3GCUK7FaLEIny0yto_EFUbE0) <rebolek (Boleslav Březovský)>:
@toomasv you’re welcome! Let me know what you think of it and what you would want to see implemented there.

[15:10:52](#ZNnhBFRWnJwuwuG7eisSBnZKXayY54m8o3wtbGoXxNs) <toomasv>:
@rebolek So, `copy/part` returns number of lines and each of these has to be separately csv-loaded. Would it be better/possible to returnsingle string of n lines to be loaded once? Or may be I am missing something.

[15:11:08](#bDn-mvX6OcwpaRZwAX532pdC0_2TC8EDEkAQcK-Lx5w) <toomasv>:
* @rebolek So, `copy/part` returns number of lines and each of these has to be separately csv-loaded. Would it be better/possible to return single string of n lines to be loaded once? Or may be I am missing something.

[15:50:47](#yKp9_Voyg-hMvG2V3Q2VdWv6VpkXQLuOcCKtgDcVjbU) <rebolek (Boleslav Březovský)>:
@toomasv it should return a block of block with converted values, the conversion just hasn’t been implemented yet. I need to backport the loader from the CSV coded.  This is really just a first version with a lot of things missing, but the main point, fast random access, is there.

[15:51:02](#cknkCFxfferCx4JfJA9k__0W5xYubCBalbfBztESmms) <rebolek (Boleslav Březovský)>:
* @toomasv it should return a block of block with converted values, the conversion just hasn’t been implemented yet. I need to backport the loader from the CSV codec.  This is really just a first version with a lot of things missing, but the main point, fast random access, is there.

[15:51:15](#VsdQ071CIfM_l5AfvTumQ8RJGKvpxYfy9rGZfKFsfdc) <rebolek (Boleslav Březovský)>:
Once it’s implemented, I let you know

[15:51:36](#zj6dodKsEyqNcFUzmB8V3vI9A8NvahFyGBCiNKl50oE) <toomasv>:
Ok, thanks a lot for your effort!

[15:58:10](#zi5WpdHGZB_SQe9tFbGJGYxzXd2Efmkyf7f9ffjmGlU) <rebolek (Boleslav Březovský)>:
The first version will certainly be read-only (no `insert`/`append`/`write`/...). That’s going to be a separate challenge :)

[16:52:45](#Wni693AOIw0Xo6JGiTJUhymLYvcbcaE-XNcqiAZdmZE) <gurzgri>:
Couldn't resist either and had an ODBC Text Driver go on that WDIData.csv: 
```Red
>> dt [change wdi: open conn: open make port! [scheme: 'odbc target: rejoin [
[        "Driver={Microsoft Text Driver (*.txt; *.csv)};"
[        {Dbq=C:\Users\Christian Ensel\Development\table\data\WDI\;}
[        "Extensions=asc,csv,tab,txt;"
[    ]] [access: 'dynamic]] :== 0:00:00.0075212
>> dt [insert/part wdi "select * from WDIData.csv" 50] ;== 0:00:00.0468715
>> dt [head wdi] ;-- first 50 rows ;== 0:00:00
>> dt [tail wdi] ;-- last 50 rows ;== 0:00:02.96939
>> dt [close conn] ;== 0:00:00.0625023
```

Retrieving all columns of all rows took
```Red
>> dt [copy wdi] ;== 0:01:22.7897
```

which coincidentally seems to resemble your scanning time.

[16:59:19](#KSFKHgGKrauHc_xVQArhTePI58JGRmdI-_tJOgw7qMw) <gurzgri>:
@GiuseppeChillemi And there's the chance for you to try to come up with something reproducible for your LF problem. Does is happen width the WDI sample data @toomasv used for his table-template, too, in gui-console? Then provide the minimal reproducible example code and I'm more than happy to have go on debugging.

[16:59:34](#UrG1UOoNFyB51Ri-4g3UYHf5V96vDX4LQxKd87VLY4I) <gurzgri>:
* @GiuseppeChillemi And there's the chance for you to try to come up with something reproducible for your LF problem! Does is happen width the WDI sample data @toomasv used for his table-template, too, in gui-console? Then provide the minimal reproducible example code and I'm more than happy to have go on debugging.

[16:59:52](#byXMHUNKpQcEbd6MDgsBieXt3WU7JP4tCfghu7RrHyc) <gurzgri>:
* @GiuseppeChillemi And there's the chance for you to try to come up with something reproducible for your LF problem! Does is happen width the WDI sample data @toomasv used for his table-template, too, in gui-console that way with the Text Driver? Then provide the minimal reproducible example code and I'm more than happy to have go on debugging.

[17:00:04](#Arz1lybJMap4k2TqLecel63iDiqrXPpiCNfz62JEm2c) <gurzgri>:
* @GiuseppeChillemi And there's the chance for you to try to come up with something reproducible for your LF problem! Does is happen width the WDI sample data @toomasv used for his table-template, too, in gui-console that way with the Text Driver? Then provide the minimal reproducible example code and I'm more than happy to have another go on debugging.

[17:07:18](#oUxNm14nRgudvdruu3XblKBOqqxaLMTpNwt-yTwIg7c) <rebolek (Boleslav Březovský)>:
@gurzgri time is similar but that’s where the similarity ends ������ I can just get offsets of each relevant newline in that time ������

[17:08:11](#aNeOvf2I3My8Y6SWuL1il_qIOXdtcU8c7jHAWOtQmO8) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri  I will try to anonymize  the data of my company in respect to my customer's privacy and if the problem will be reproduced using your text loader, I will send you the archive.

[17:08:35](#uv17WWPnZWkmA2S3Pf7vU6isYWsls3cj-_zH0aexPrk) <GiuseppeChillemi (GiuseppeChillemi)>:
Another great work! Thanks!

[17:37:35](#sIUmD2lzqeMCks45jn5AdLwq-wbFyngTj8nJPTQ_ZSw) <toomasv>:
@gurzgri Thanks for the example! My times:
```
dt [change wdi: open conn: open odbc://text [access: 'dynamic]] ;== 0:00:00.0109964
dt [insert/part wdi "select * from WDIData.csv" 50] ;== 0:00:00.038935
dt [head wdi] ;== 0:00:00.0129694
dt [tail wdi] ;== 0:00:04.114
dt [close conn] ;== 0:00:00.0496009
```

[18:05:28](#0PCFzULOhbpprOCZUjIU2GpOTm0Gyz9vRdES3H4Mi84) <gurzgri>:
A lot of examples are in `tests\source\environment\odbc-test.red` (even if a bit contrived by times to suit the test suite)

[18:09:02](#oF7ySX3Cs5Spy40qZ2iIctcWtmQiqw5zDEIyLsVBvIA) <toomasv>:
Aah, good, thanks!

## 25-May-2022

[14:30:04](#B7Dmu3HUkUtlSk81Q1fgPhGLOZlNqEo0_IG-sw5IM4A) <GiuseppeChillemi (GiuseppeChillemi)>:
@rebolek What does this mean?
`User Error: "Data are not aligned"`

I have tried to load the `CSV` dataset saved from SQL Server into RED

[14:59:59](#OJYMNRwcKSIVWSG4ozO6SkWtgG7FP8HeYYiz3Kk26Co) <toomasv>:
Not correct field or line separators.

[15:01:49](#iGE1Ctyj4Lfk5KpB_Om6nonr-NxkkB-lUl9yUgLNNgo) <toomasv>:
* Not correct field (or line?) separators.

[15:14:00](#hFwfNc1Vj9FliBhVNxS6BR8kBL4tQROAv8DybJ1idrI) <GiuseppeChillemi (GiuseppeChillemi)>:
Is there a way to change it? I have ";" as field separator

[16:05:35](#oi_D2PJgdYnTjRruRxu0tFsGzEor5j12YWTlZiqBA3I) <toomasv>:
Can you show a part of your csv, just few lines. 

[16:05:56](#HfFtf0LVB94GbMD4FYTIk_yJ6giZ6HHPwQzWneGek8k) <toomasv>:
* Can you show a part of your csv, just few lines? 

[17:28:57](#p7EgDlp64VkckUgWx2DuelwFXTPBeZyzStbJ1eTrlUs) <GiuseppeChillemi (GiuseppeChillemi)>:
@toomasv Here is the [sample](https://gist.github.com/GiuseppeChillemi/b7a3412cac0882425e41dbb9b2e592e9(

[17:29:06](#HphVAcrvB27d4OHBYjwRVm1uPtqPafBiu3JLSGK7ybE) <GiuseppeChillemi (GiuseppeChillemi)>:
* @toomasv Here is the [sample](https://gist.github.com/GiuseppeChillemi/b7a3412cac0882425e41dbb9b2e592e9)

[17:38:06](#quAVm3CRZE5QsgFrC7Chn_vcoBaj6rQREMPRR6eGY4g) <toomasv>:
Here are number of elements on these 10 lines:
```
110
110
110
112
112
110
110
110
112
110
```
Clearly unaligned

[17:38:34](#fxyylKZ88Uv75jFD0mHkzMVVxP4yHhqZzQ2GhRkbPF0) <GiuseppeChillemi (GiuseppeChillemi)>:
I am testing while writing to you

[17:39:00](#rkdOHO5IrRneWHqYkDyuTNWj5PhxKJdbi6n3QlL5rfA) <GiuseppeChillemi (GiuseppeChillemi)>:
If I remove about 3500 lines, it loads

[17:43:42](#NkfTyx5Bj5AISSAp-KGy0AyU4EMD3H24CFP0vxDfQ6U) <gurzgri>:
[![image.png](https://files.gitter.im/6234feab6da037398492a62a/yd98/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/yd98/image.png)

[17:44:08](#ChqQs43cx1uuqoLWrO5F_cQeYFC_s-4WpX3mhiSY8YM) <gurzgri>:
... there it get's distorted.

[17:44:36](#UNebTO9McZSCtcyXMgiQKLgb23vV4IushICrXRT07Lo) <GiuseppeChillemi (GiuseppeChillemi)>:
I was missing a READ in the middle of LOAD. Just a crazy attempt

[17:44:49](#u-VuR3Sxcf5sTgYk3dcztLh5UTOFoWoPmCfp_Zkhre0) <GiuseppeChillemi (GiuseppeChillemi)>:
Now, the data always fails

[17:45:54](#MJfG2mITVWvqmCRFTHMOEGTK7eNAcansdMpKYT8R5-c) <GiuseppeChillemi (GiuseppeChillemi)>:
Bit it is SQL Server exporting the data, without any middleman, I can't believe it buggy, but it is. 

[17:46:01](#3sgbX-B9KnRAO1HRXg23c1A29YHSF_udl5nu8NbV06A) <GiuseppeChillemi (GiuseppeChillemi)>:
* Bat it is SQL Server exporting the data, without any middleman, I can't believe it buggy, but it is. 

[17:46:49](#6ft8S1PTkfcaQjeVtswoL0j7bQ8XE_OIKK8HgRY_h68) <GiuseppeChillemi (GiuseppeChillemi)>:
* But it is SQL Server exporting the data, without any middleman, I can't believe it buggy, but it is. 

[18:03:37](#ac-bJpRo6mNcXeO-rxfq96VUif7EnmRJkgAku595L_E) <toomasv>:
Yeah  `serve123r\server123;mycompany\ammin;In Volus` (i.e. 3 elements) gets duplicated in longer lines instead of single integer in shorter lines. So, 2 excess fields. Is the duplication intentional?

[18:11:11](#QfJC6rygUxChiwAr5-nBzGaQITeRYRjdai-CeLtUEYo) <GiuseppeChillemi (GiuseppeChillemi)>:
No, it is not inteded. They sould be  just 2: `USERINS`, `USRUPD`

[18:11:56](#QRCqzSpH1zXrqTquqNKGGjxqnWd5cfapRkevhIUL_wI) <GiuseppeChillemi (GiuseppeChillemi)>:
* No, it is not inteded. They sould be  just 2: `USERINS`, `USERUPD`

[18:13:29](#dj-pSa6rfJV5S36OCbrv0KPd0u9SjYTZujbGAvAKnDA) <GiuseppeChillemi (GiuseppeChillemi)>:
Wait, maybe I have understood what is happening.

[18:16:16](#HnyIFjETA-1hZixA8hjHRyrfxk2XoPyDeb50tgGK9-4) <GiuseppeChillemi (GiuseppeChillemi)>:
Both fields contains connection string which have the separator inside. I have seen it in the query result browser, they are not 4 fields but 2 with 2 connection inside, separated by ";"

[18:16:34](#JcIMgbH75kczsbvQX2jPsRyO4F7T6wB-eoqPVdwqjK4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Both fields contains connection string which have the separator inside. I have seen it in the query result browser, they are not 4 fields but 2 with 2 connection inside, separated by `;`!

[18:16:50](#ure0nuAMHXqfwEKEHkx7bd_EIDfXueQ3hZUcRO136Xs) <GiuseppeChillemi (GiuseppeChillemi)>:
So SQL does not escape it the inner characters

[18:17:22](#32GrBAQk-oEGSWewsrax7ngS1C8TFq8OREH19obtWWY) <GiuseppeChillemi (GiuseppeChillemi)>:
* So SQL does not escape it the inner column characters

[18:17:37](#XVbFMjJjFpEn4JbhaSqL5XZDKVsFhzKqTZefoV2JC24) <GiuseppeChillemi (GiuseppeChillemi)>:
You have had eagle eyes!

[18:33:02](#bvK_MvrZILwt_c4TkASS1oDlzbI_GxaiYDwLYptHP_s) <GiuseppeChillemi (GiuseppeChillemi)>:
Is there a way to convert from block of blocks to CSV? I would query using RED DEBUG CONSOLE and save to CSV (If Red correctly escapes the separatos)

[18:34:13](#7rf_xjIeK1FdkU8tiO1t74pBIkCN9oD_4TsFY_btZQQ) <GiuseppeChillemi (GiuseppeChillemi)>:
@rebolek Could you please add the line number where the first alignment error occurs?

[18:34:23](#vMfqp8yHuPDehuVcTGl8EMEY1GxPSMbMYguj5bOURcg) <GiuseppeChillemi (GiuseppeChillemi)>:
Not now, in the future

[18:34:56](#P_5rUDEmIFyo_DNtfwmKdEcbl5iDLHsJzDg3lC7e7d4) <GiuseppeChillemi (GiuseppeChillemi)>:
Because it is very helpful for debugging purpose. It would be nice that any errors come with line number.

[18:43:15](#rv-EI735sAap3av_NF64WnvxB-TBchPUqI9KFcQsywo) <gurzgri>:
```Red
>> collect [foreach row [[1 "a;b"] [2 "c;d"]] [keep to-csv/with/quote row #";" #"^""]]
== [{1;"a;b"^/} {2;"c;d"^/}]
```

[18:44:14](#p4WPFAKFlgRbTTklXW6hQfR6-rQ03L4Aq1_bNvZ1aOk) <gurzgri>:
with `rows: [[1 "a;b"] [2 "c;d"]` fetch thru ODBC ...

[18:44:23](#j3P_Cqn5rTSboSf3qjJGEJfhxEdi2_qUmn6TYmudlXc) <gurzgri>:
* with `rows: [[1 "a;b"] [2 "c;d"]` fetched thru ODBC ...

[18:45:41](#u-J1i5EDgpKUCGQwOey-s1bg9ctgWcpJBJy4Giq_9dE) <gurzgri>:
* ```Red
>> collect [foreach row rows: [[1 "a;b"] [2 "c;d"]] [keep to-csv/with/quote row #";" #"^""]]
== [{1;"a;b"^/} {2;"c;d"^/}]
```

[18:53:58](#gRCc0kvtl5vLptb5eLQ46lNIoUxQoMGX1lNEVYxwl0w) <gurzgri>:
No! Just `to-csv/with/quote rows #";" #"^""` is enough.

[18:54:25](#VgX_-ovuoRNhsmqMI9cwHQFZYjF-UXAyTNijZAcJ52g) <gurzgri>:
* No! Just `to-csv/with/quote rows #";" #"^""` is enough. Result is one big string.

[21:01:38](#2Nu6O0qRcInXt9qXj5ACLyIyPBQANXSpyDVCTFcUMPc) <gurzgri>:
[![image.png](https://files.gitter.im/6234feab6da037398492a62a/BHvA/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/BHvA/image.png)

[21:06:47](#H6yrbwEV2kiInQ_Mo3PAWYqf0xPRmOIR_F-9XZ82Wz0) <gurzgri>:
@toomasv Over in https://gitter.im/red/red/gui-branch you wrote that odbc access with your %try-odbc.red
> tends to die at times

I think I've seen it too in a slighty modified script, sometimes it crashes with a `*** access violation` when wildly clicking thru different tables — is that the symptom you've discovered?

I therefore compiled a `%console.red` with `Needs: [View JSON CSV ODBC]` header including the View component with `--debug` switch `do/args %red.r "-r --debug %environment/console/CLI/console.red"`.

Then I tried again ... and I tried and tried and ... switched tables like mad (screenshot above). 

Somehow debugging on seems to make this bug disappear ������

[21:07:04](#G1MQy2kaiiUHGWmUEscCgwiAD2JCBQ5w4N1_nH81hm8) <gurzgri>:
* @toomasv Over in https://gitter.im/red/red/gui-branch you wrote that odbc access with your %try-odbc.red
> tends to die at times

I think I've seen it too in a slighty modified script, sometimes it crashes with a `*** access violation` when wildly clicking thru different tables — is that the symptom you've discovered?

I therefore compiled a `%console.red` with `Needs: [View JSON CSV ODBC]` header including the View component with `--debug` switch `do/args %red.r "-r --debug %environment/console/CLI/console.red"`.

Then I tried again ... and I tried and tried and ... switched tables like mad (screenshot above). 

Somehow debugging turned on seems to make this bug disappear :disappointed:

[21:08:23](#yeidJEkU0qjC6ukFAWPEbXMKYQ_hY14MjkEsy_UZjvY) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri I have tried. I have saved successfully but `load/as ... 'csv` create a block where each line is a block with a big string inside. Is there the need to change the delimeters on load?

[21:08:38](#whP5hBe0at2mYaEm1tRmE9ZNe8m9qwK8Y3CpacurgTM) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri I have tried. I have saved the query result successfully but `load/as ... 'csv` create a block where each line is a block with a big string inside. Is there the need to change the delimeters on load?

[21:08:49](#44b8kQnou3RoWbepkebhisXRQCdr9ubcXppilt4k7tQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri I have tried. I have saved the query result successfully but `load/as ... 'csv` creates a block where each line is a block with a big string inside. Is there the need to change the delimeters on load?

[21:21:25](#NsGj4bQEPeCl3PCxAOpgUFrrkhOgYcFeefuxqlro_Lg) <gurzgri>:
`help load-csv`. Chances are that in order to successfully parse the CSV the same delimiters have to be used then the ones used in the file.

[21:21:38](#nL02OB-fCC0QEGFmwA7p2iHWqkK_Gxblb0aclDDjb-8) <gurzgri>:
* `help load-csv`. Chances are that in order to successfully parse the CSV the same delimiters have to be used as the ones used in the file.

[21:23:21](#1QtYcOv6BvPtI8laTlJFBEbJHGWwlpbNqdO3KCXT484) <gurzgri>:
* `help "csv"`, `help load-csv`. Chances are that in order to successfully parse the CSV the same delimiters have to be used as the ones used in the file.

[21:45:36](#32g17z3SISOVHd0Xf2xGz4Th4juB5N7mNyMwBQT9xk8) <gurzgri>:
If, however, you do not want the load it from Red but access it via ODBC Text Driver, you'll probably need a `schema.ini` file in folder where the csv is placed. More info here: https://docs.microsoft.com/en-us/sql/odbc/microsoft/schema-ini-file-text-file-driver?view=sql-server-ver16 

[21:47:16](#US5GZlLWqrv-saIdoaUPDIndIhMPAaQr-6fPeSBEErc) <gurzgri>:
* If, however, you do not want to load it from Red but access it via ODBC Text Driver, you'll probably need a `schema.ini` file in folder where the csv is placed. More info here: https://docs.microsoft.com/en-us/sql/odbc/microsoft/schema-ini-file-text-file-driver?view=sql-server-ver16 

[22:41:56](#Qj0_Qu5vwFebQk9y7W0ElY5e5cDW_Kl7xXbrZ7mYAt4) <gurzgri>:
Hm, @toomasv, now I finally sometimes manage to reproduce the crash. Fun thing is, that my EXECUTED-STATEMENT routine executes the API function SQLExecute, the API under circumstances returns an error, the error *is* properly detected and only then when I try to R/S–`fire` an error, firing that error crashes ... :thinking: ������ :zany_face:
```Red
vvv EXECUTE-STATEMENT FAILED vvv

*** Runtime Error 1: access violation
*** in file: /C/Users/Christian Ensel/Development/red/runtime/datatypes/common.reds
*** at line: 100
***
***   stack: red/copy-cell 04C92FD8h 01FBA548h
***   stack: red/error/create 01D2D1A0h 01D2EA08h 04C92FD8h 058E5620h 00000000h
***   stack: red/fire 0 010AE560h
***   stack: ctx||544~execute-statement 0336EA84h
***   stack: red/interpreter/exec-routine 0336EA74h
```

[22:42:57](#qAjvTTs2Dl15v7XLWdNM2C0ESPerxJYoJQob2zdEbeI) <gurzgri>:
* Hm, @toomasv, now I finally sometimes manage to reproduce the crash. Fun thing is, that my EXECUTED-STATEMENT routine executes the API function SQLExecute, the API under circumstances returns an error, the error *is* properly detected and only then when I try to R/S–`fire` an error, firing that error crashes ... :thinking:  :dizzy:  :zany_face:
```Red
vvv EXECUTE-STATEMENT FAILED vvv

*** Runtime Error 1: access violation
*** in file: /C/Users/Christian Ensel/Development/red/runtime/datatypes/common.reds
*** at line: 100
***
***   stack: red/copy-cell 04C92FD8h 01FBA548h
***   stack: red/error/create 01D2D1A0h 01D2EA08h 04C92FD8h 058E5620h 00000000h
***   stack: red/fire 0 010AE560h
***   stack: ctx||544~execute-statement 0336EA84h
***   stack: red/interpreter/exec-routine 0336EA74h
```

[23:00:38](#GYRCsJrC6_1UOGeeCRfhLWg1Fh__LqJ0VOfS67roLsw) <GiuseppeChillemi (GiuseppeChillemi)>:
You have solved the reason why I have  not used the ODBC text driver. I have found no page that describe the delimeters in the connection string. With `schema.it`I can bypass this problem

[23:01:18](#UVw-2OBV8rbns-z_1xZzZF9L1SSp5J7g56eEeB6Ziv0) <GiuseppeChillemi (GiuseppeChillemi)>:
`schema.ini`

[23:02:56](#8j4Bo6FYk__OQt2Fk85qYH_vVuy8B6NxSEJPFu1ds40) <GiuseppeChillemi (GiuseppeChillemi)>:
But if you have a good page with all the connection string parameters for the text odbc driver, I will accept it too

[23:37:54](#HFnQNRLf_FZ15eKsYLhdgtjW6yVQDahhfvg4P8eoHUM) <greggirwin (Gregg Irwin)>:
Thanks for the continued improvments @gurzgri. Maybe @qtxie will have an idea on the error issue.

## 26-May-2022

[1:21:28](#VlaV7Kpfe-OlMG9lwGTRiRabmaXmfx0zATU96SjLX-E) <qtxie>:
```
***   stack: red/fire 0 010AE560h
```
How do you use `fire`? The first parameter of `red/fire` should be as least 2.

[1:21:39](#7F1Q5UzvtuXotDtJGDxZaB25ixd9tf7h1Xc058luJSc) <qtxie>:
* ```
***   stack: red/fire 0 010AE560h
```
How do you use `fire`? The first parameter of `red/fire` should be at least 2.

[5:31:16](#haqnmd_XRtsgYJtJJzpCleX9JzhmD9V_IR-rommQnVM) <toomasv>:
@gurzgri Thanks for looking into this! I tried to reproduce it also, but now it happened much less than before! But one place I now get consistent errors and occasional crashes is a mysql table having a field with type `geometry`:

[5:31:20](#mzHddZNPJJkvRbcK51gYqph66Hd2WQKZtY5jVWB9z58) <toomasv>:
[![image.png](https://files.gitter.im/6234feab6da037398492a62a/P841/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/P841/image.png)

[5:51:16](#MIljKlRNKwotAxcj7vqf2xjHIob9-rGG9sBs4pz90gw) <toomasv>:
Here is the error:
```
*** Script Error: ODBC error: ["HY000" 517 "[MySQL][ODBC 8.0(w) Driver][mysqld-8.0.29]"]
*** Where: execute-statement
*** Near : port/state describe-result port/state
*** Stack: do-file context view do-events do-actor do-safe 
```

[6:28:22](#MF6e7APkECWTnyZp-C98c65WLcUSqwhccCrOX_n2YW8) <toomasv>:
[Full debug session](https://github.com/toomasv/table-template/blob/main/try-odbc.debug) with shortest path to the error.

[6:29:49](#EQvkIJxaw_90HxBUzYPKZGccnmiQ-DSWGlCNqXZpTPE) <toomasv>:
I notice constant warnings about "Invalid cursor state".

[6:30:13](#Najdjhbb91xDbwmcmPxJKM2DqbAiKD_9RDXZ-72NI4U) <toomasv>:
* Also, I notice constant warnings about "Invalid cursor state".

[10:18:26](#lUroBKeXMrdEVaw484zWH3e-VD5JnBclf6hNRKn5WfI) <gurzgri>:
@toomasv Thanks for the effort you put into this! Regarding the invalid cusor state, that was an annoying warning regression of the latest additions implementing cursor movement in currenr rowset. Pushed a fix for that and another.

The MySQL geometry datatype thing is deeper issue with probably no other way to circumvent it than excluding it from a `SELECT` statement's result columns list — because of that datatype not being supported by ODBC at all from what I see, e.g. https://stackoverflow.com/questions/52058228/odbc-prepared-statement-for-table-with-a-geometry-column-type-throws-exception#comment91067758_52058228. It's a good thing at least to me that it throws a (not so particular) error instead of crashing. 

But did I get that right, so far you've had no `*** access violation` errors?

[10:18:44](#rDykWPtY1y7Mf0tC7dRZJxZ2Ob_Un-d6Xy_5U4n3V6Y) <gurzgri>:
* @toomasv Thanks for the effort you put into this! Regarding the invalid cusor state, that was an annoying warning regression of the latest additions implementing cursor movement in current rowset. Pushed a fix for that and another.

The MySQL geometry datatype thing is deeper issue with probably no other way to circumvent it than excluding it from a `SELECT` statement's result columns list — because of that datatype not being supported by ODBC at all from what I see, e.g. https://stackoverflow.com/questions/52058228/odbc-prepared-statement-for-table-with-a-geometry-column-type-throws-exception#comment91067758_52058228. It's a good thing at least to me that it throws a (not so particular) error instead of crashing. 

But did I get that right, so far you've had no `*** access violation` errors?

[10:18:58](#QLU8b6e4b18N_3XhKpYVY7wYUdUSq8HUm82Z-MgOK3E) <gurzgri>:
* @toomasv Thanks for the effort you put into this! Regarding the invalid cusor state, that was an annoying warning regression of the latest additions implementing cursor movement in current rowset. Pushed a fix for that and another.

The MySQL geometry datatype thing is a deeper issue with probably no other way to circumvent it than excluding it from a `SELECT` statement's result columns list — because of that datatype not being supported by ODBC at all from what I see, e.g. https://stackoverflow.com/questions/52058228/odbc-prepared-statement-for-table-with-a-geometry-column-type-throws-exception#comment91067758_52058228. It's a good thing at least to me that it throws a (not so particular) error instead of crashing. 

But did I get that right, so far you've had no `*** access violation` errors?

[10:20:57](#VCdBVXZXObbnQoz0Cgli0v9G-pcdn6fCkqxyg2IyPhw) <gurzgri>:
* @toomasv Thanks for the effort you put into this! Regarding the invalid cusor state, that was an annoying warning regression of the latest additions implementing cursor movement in current rowset. Pushed a fix for that and another.

The MySQL geometry datatype thing is a deeper issue with probably no other way to circumvent it than excluding it from a `SELECT` statement's result columns list — because of that datatype not being supported by ODBC at all from what I see, e.g. https://stackoverflow.com/questions/52058228/odbc-prepared-statement-for-table-with-a-geometry-column-type-throws-exception#comment91067758_52058228. It's a good thing at least to me that it throws a (not so particular) error instead of crashing, the hopes however that unknown columns will just be returned as a string (I do that/try that) have not been fulfilled in this case. 

But did I get that right, so far you've had no `*** access violation` errors?

[10:24:39](#4WaBcd3CuaRHv9ZLbppv3OOd4I5U7c47BBPnJW4GoGI) <rebolek (Boleslav Březovský)>:
Ok, I take a look at it.

[10:26:04](#7-W79lz4etF7Gm6Go8YEbnO8SvxeecPxBMgyyianF1U) <toomasv>:
@gurzgri Thanks for the info! And yes, I don't get any more `access violation` errors. 

[10:26:06](#IxbGozPlfqUj-1Aq0V6b02YyAimIATmMWk0flpjdjOs) <rebolek (Boleslav Březovský)>:
Block of blocks is actually the default format:
```
>> to-csv [["a" "b"] [1 2]]
== "a,b^/1,2^/"
```

[10:44:59](#H-kLapQN8e6NKflf-7Ap90sQtc2gUJAUhlFB7byzrvY) <gurzgri>:
@qtxie The one argument to `fire` is a block, I think the call itself is legit: https://github.com/gurzgri/red/blob/5e5bc196cebc235b7434a4f619b0c9fc26d5c916/environment/schemes/odbc.red#L1622  with `odbc/odbc: word/load "ODBC"` and `odbc/common-field-errors`being an enum defined in https://github.com/gurzgri/red/blob/5e5bc196cebc235b7434a4f619b0c9fc26d5c916/environment/schemes/odbc.reds#L2701 

[11:10:13](#BRDELzmUqDVxDEAV2Jp6nxORNd2nazlD71x4XXlgDMQ) <gurzgri>:
@GiuseppeChillemi Another thing you might try is compiling the CLI console %console.red with `Needs: [View JSON CSV ODBC]` header including the View component, then rerun your retrieval code and see if saving results intruduces the LF problem. If so and if it reliably doesn't happen when View is not  `Needs:`ed, that I think would point to a problem with/in the View engine itself and not so much the GUI console.

[19:02:42](#9hzUBvLlcVxag9-GRNmBloymrq-bYV6xXRwzfCL9Ug4) <gurzgri>:
@toomasv Played a bit with MariaDB's various geometry datatypes: These
* *can* be retrieved as deferred values, picking the deferred value gives `binary!` values like `#{00000000010100000000000000000024400000000000003440}`, 
* *can* be deferred as text with `select ST_AsText(g) as geo from gis_geometry` and 
* *can* directly be retrieved casted to varchar from text like so `select cast(ST_AsText(g) as varchar(256)) from gis_geometry`.

So not all hope is lost. But of course all this doesn't lend itself for a generic tool like your "table browser", which needs to be as schema agnostic as possible.

And now I'm curious why it doesn't work with MySQL, guess I finally need to install that too.

[19:21:24](#WJHb6VwLf2rSiyQ3CeTngXS3T6p37vpfvhrw_UAM354) <gurzgri>:
The whole `deferred` btw. columns is a bit of a rushed design I'm not too happy with, but was a low hanging fruit to provide a way for Giuseppe to retrieve e.g. the PDF invoices from BLOB columns of his coporate database. 

Fetching rows is done thru preallocated binary buffers of window size * num of columns bound to the API functions to write into, of course there is no way to preallocate 4294967294 bytes for each single BLOB/TEXT cell. That's why they are deferred, then they can be stream thru a single buffer of reasonable sized.

Instead of burdening the user with that, that process *could* work automagically under the hood. But then inevitable there needs to be a some compromise in form of a configurable upper column size up to with BLOB/TEXT values will implicitly be loaded by the scheme.

And this threshold violates the principle of least surprise, because for the average user it will work without him knowing how and why, and then the day will come where I "randomly" doesn't work because he stumbles over a value beyond that threshold ...

[19:21:51](#Wd0Ihf3rUyxYxrtiQgqr1oUFHIpRVLGollCV0v-CYEY) <gurzgri>:
* BTW, the whole `deferred` columns thing is a bit of a rushed design I'm not too happy with, but was a low hanging fruit to provide a way for Giuseppe to retrieve e.g. the PDF invoices from BLOB columns of his coporate database. 

Fetching rows is done thru preallocated binary buffers of window size * num of columns bound to the API functions to write into, of course there is no way to preallocate 4294967294 bytes for each single BLOB/TEXT cell. That's why they are deferred, then they can be stream thru a single buffer of reasonable sized.

Instead of burdening the user with that, that process *could* work automagically under the hood. But then inevitable there needs to be a some compromise in form of a configurable upper column size up to with BLOB/TEXT values will implicitly be loaded by the scheme.

And this threshold violates the principle of least surprise, because for the average user it will work without him knowing how and why, and then the day will come where I "randomly" doesn't work because he stumbles over a value beyond that threshold ...

[19:22:29](#l5PZqaHM9c6trpeC4gRDcGvXaZT9t5xIaWmETF2Jp4A) <gurzgri>:
* BTW, the whole `deferred` columns thing is a bit of a rushed design I'm not too happy with, but was a low hanging fruit to provide a way for Giuseppe to retrieve e.g. the PDF invoices from BLOB columns of his coporate database. 

Fetching rows is done thru preallocated binary buffers of window size * num of columns bound to the API functions to write into, of course there is no way to preallocate 4294967294 bytes for each single BLOB/TEXT cell. That's why they are deferred, then they can be streamed thru a single buffer of reasonable sized.

Instead of burdening the user with that, that process *could* work automagically under the hood. But then inevitable there needs to be a some compromise in form of a configurable upper column size up to with BLOB/TEXT values will implicitly be loaded by the scheme.

And this threshold violates the principle of least surprise, because for the average user it will work without him knowing how and why, and then the day will come where I "randomly" doesn't work because he stumbles over a value beyond that threshold ...

[19:22:40](#ZWxU6WU2ORspIk9XqrI1Wzi-4JI_zm8bNBwHnWVmHlQ) <gurzgri>:
* BTW, the whole `deferred` columns thing is a bit of a rushed design I'm not too happy with, but was a low hanging fruit to provide a way for Giuseppe to retrieve e.g. the PDF invoices from BLOB columns of his coporate database. 

Fetching rows is done thru preallocated binary buffers of window size * num of columns bound to the API functions to write into, of course there is no way to preallocate 4294967294 bytes for each single BLOB/TEXT cell. That's why they are deferred, then they can be streamed thru a single buffer of reasonable size.

Instead of burdening the user with that, that process *could* work automagically under the hood. But then inevitable there needs to be a some compromise in form of a configurable upper column size up to with BLOB/TEXT values will implicitly be loaded by the scheme.

And this threshold violates the principle of least surprise, because for the average user it will work without him knowing how and why, and then the day will come where I "randomly" doesn't work because he stumbles over a value beyond that threshold ...

[19:23:31](#Esh9eDKVQdUvjUZhAR4Wa8hzkU6xcsjfu7p-AOGfKQE) <gurzgri>:
* BTW, the whole `deferred` columns thing is a bit of a rushed design I'm not too happy with, but was a low hanging fruit to provide a way for Giuseppe to retrieve e.g. the PDF invoices from BLOB columns of his coporate database. 

Fetching rows is done thru preallocated binary buffers of window size * num of columns bound to the API functions to write into, of course there is no way to preallocate 4294967294 bytes for each single BLOB/TEXT cell. That's why they are deferred, then they can be streamed thru a single buffer of reasonable size.

Instead of burdening the user with that, that process *could* work automagically under the hood. But then inevitable there needs to be a some compromise in form of a configurable upper column size up to with BLOB/TEXT values will implicitly be loaded by the scheme.

And this threshold violates the principle of least surprise, because for the average user it will work without him knowing how and why, but suddenly the day will come where it "randomly" doesn't work because he stumbles over a value beyond that threshold ...

[20:13:10](#uge4iDz95zE-aJoY3PcBT8KWuZWLlzDc8cYnaqb1lmE) <toomasv>:
@gurzgri Good news! Thanks for researching this. You are right of course, that the more general a tool strives to be the more it needs to deal with differences and quirks of diverse sources and hide these. I see this trying to make some common interface for different datasources. Or rather, trying to integrate these datasources through your odbc tool with the table widget.

[20:18:10](#iiRlpWG6n_lKYvidzFPY7xTJZOPPGXDN5yzehU40uNo) <gurzgri>:
Have you seen the `system/schemes/odbc/state/sources` function already? It lists all datasources configured in the (32bit) odbc panel. That way you wouldn't have to hardcode them. And then theres `insert statement [table]`, listing all tables. 

[20:35:29](#1gNrf_uodd07cjPm8WlWiXKa6ZCkrNEyY_svIgun5tI) <gurzgri>:
@toomasv `columns: insert stmt: open conn: open odbc://dsn 'tables probe tables: copy stmt probe columns close conn` lists all tables in datasource agnostic way, provides columns `[table-cat table-schem table-name table-type remarks]`.

[20:39:02](#VzLN3PaYmHfFbsw1Pxl5NAO7xMUyYUfcpK9FVwKQ9Qg) <gurzgri>:
* @toomasv `columns: insert change stmt: open conn: open odbc://dsn [flat?: yes]  'tables probe tables: copy stmt probe columns close conn` lists all tables in datasource agnostic way, provides columns `[table-cat table-schem table-name table-type remarks]`.

[20:43:25](#4sZbHeiY4rnKb6AncK9N1ZzMrURcgzhnTi1bOhZwqTU) <gurzgri>:
```Red
>> databases: unique extract/index tables length? columns 1
== ["information_schema" "mysql" "performance_schema" "sample" "sys"]
```
And the tables in only one database you can get with : `db: "sample" insert stmt compose [tables (db)] copy stmt`.

[20:43:44](#2yVvNjCNaeda9hb_F0Pi-PFhQhqJoHG0RscUMeobY7Y) <gurzgri>:
* ```Red
>> databases: unique extract/index tables length? columns 1
== ["information_schema" "mysql" "performance_schema" "sample" "sys"]
```
And the tables in only one database you can get with : 
```Red
db: "sample" insert stmt compose [tables (db)] copy stmt
```

## 27-May-2022

[2:58:14](#ZPRxlMY1InTOyhiq8iEldpCC80oFjCXrH6ybJHn6dHY) <toomasv>:
@gurzgri Thanks! A lot to learn ������ ������ 

[8:47:58](#OKKvy50IgjuiWBMh3S0x57he2LZVPCRnGzP7EsV57o4) <toomasv>:
@gurzgri Your docment says 

> Note that insert with catalog functions doesn't reduce the block, but will rather silently compose it to allow for easier dialecting.

But it seems not to `compose` it. Not a problem, it can be explicity composed, just a notice.

[10:58:51](#8VJJhoK_LVMovd5P3sVv7kXYyNVqflEzsHa10LymuYQ) <gurzgri>:
Thanks for noticing that, pushed fix for docs, dropped that sometime ago.

[11:01:34](#eGx8H743kxAPwIEHq1ktFd2YPpxLazEBTH6AWE2wYDE) <gurzgri>:
*Misleading* docs are worse than *no docs* ������

[11:50:00](#95pL_4tP_IrpzQkm5dANJIUrdamet1ORF_ETUygl2Ec) <gurzgri>:
I haven't really put too much effort in catalog functions for now, so they pretty much just follow the signature of the corresponding ODBC catalog functions like SQLTables, SQLColumns etc.

[11:59:31](#IYPV57MClTir3Gglw6cY5MNJebf0CCovf1IjgNF_wbg) <gurzgri>:
Better stay away from `strict` mode for now. It's *very* picky if not buggy and it sometimes requires an `""` empty string instead of `none`:
```Red
>> insert maria [tables none none "gis_%line"] ;== finds me two tables
>> insert maria [tables none  ""  "gis_%line"] ;== finds no tables
>> insert maria [strict tables none "" "gis_%line"] ;== finds no tables (which is correct), but
>> insert maria [strict tables none "" "gis_line"] ;== finds no tables (in my case I somehow think it should), but
>> insert maria [strict tables none none "gis_%line"] ;   throws error HY009 "Invalid use of null pointer", which is far from obvious

[11:59:47](#AXBOkEAVSvZ8wJFWY0M6Bai9PlzMLR98KWXZXfXXxC0) <gurzgri>:
* Better stay away from `strict` mode for now. It's *very* picky if not buggy and it sometimes requires an `""` empty string instead of `none`:
```Red
>> insert maria [tables none none "gis_%line"] ;== finds me two tables
>> insert maria [tables none  ""  "gis_%line"] ;== finds no tables
>> insert maria [strict tables none "" "gis_%line"] ;== finds no tables (which is correct), but
>> insert maria [strict tables none "" "gis_line"] ;== finds no tables (in my case I somehow think it should), but
>> insert maria [strict tables none none "gis_%line"] ;   throws error HY009 "Invalid use of null pointer", which is far from obvious
```

[15:33:49](#sOOo0TjYunfgf-KHj4AmZ_WRY4OfIgua476yqNBJQic) <toomasv>:
@gurzgri I rewrote it using [odbc-only](https://github.com/toomasv/table-template/blob/main/try-odbc-only.red) with minimal hardcoded values. Still, could not avoid it entirely, because (1) there are more odbc drivers I care to use (some different versions etc.), and (2) I couldn't make `mariadb` behave without explicitly pointing out which database I want to see. Radio box at right changes view from data to columns, but again `mariadb` crashes on this transfer (occasionally `sqlite` too). Others seem to be stable.

[15:34:15](#DT98xl9XEU5nZLBwJaWLX7pxWMx3ytDq-J-QEkjURTw) <toomasv>:
* @gurzgri I rewrote it using [odbc-only](https://github.com/toomasv/table-template/blob/main/try-odbc-only.red) with minimal hardcoded values. Still, could not avoid these entirely, because (1) there are more odbc drivers I care to use (some different versions etc.), and (2) I couldn't make `mariadb` behave without explicitly pointing out which database I want to see. Radio box at right changes view from data to columns, but again `mariadb` crashes on this transfer (occasionally `sqlite` too). Others seem to be stable.

[19:16:20](#kY5u2XYTct21AhbDyTjgdICld_HOlCH7l0PpTUBK6mw) <gurzgri>:
So @toomasv has just recreated 75% of HeidiSQL / WinSQL in 75 LOC, how cool is that? ������  I will have a deeper look into the issues, but likely not before Pentecost, I'm on vacation for a week. 

[19:33:08](#WWXmkmK0J24MN_OxJYtUIyNaAC9MBa6jpy5kAcf6jw4) <toomasv>:
Well, yeah, + few K of your and my code in odbc and table :). But yes, when these get in place, it is piece of cake.

## 28-May-2022

[17:27:06](#B391rqwYn--NJc17uo4gpPle0AfUxIIUZH1LlUUdt_8) <greggirwin (Gregg Irwin)>:
Exciting stuff!

## 6-Jun-2022

[16:37:10](#7QX32BYdTvq2LoaIveCqlHsl1VbHQ3zQ_zUTLKZ8Lh4) <bubnenkoff (Dmitry Bubnenkov)>:
Exciting stuff!

[17:00:18](#OdH99h8j5JlTHw6lYhkQazDqQSnU0ig1fjluYG1rlnk) <bubnenkoff (Dmitry Bubnenkov)>:
What of current status of this branch? I do not see branch named `-odbc` does it mean that it it now have another name?

[17:00:29](#Q1uHLQgiZA_vShU68Md0UtGfGnNyjUjPQuYjKLav468) <bubnenkoff (Dmitry Bubnenkov)>:
* What of current status of this branch? I do not see branch named `-odbc` does it mean that it it now have another name? Or I am looking at wrong place?

[17:01:45](#tfe7XkWEqK9NQ80wbXNof5wMYa_-xu2IVS00lsrZ960) <greggirwin (Gregg Irwin)>:
There is no official Red branch for this.

[17:03:00](#h_xdLtRWGqzVy46ADUadWBd7CBzkJl3U4Ts8mTz1ruU) <greggirwin (Gregg Irwin)>:
@gurzgri took the initiative and we're cheering him on. Eventually I think it will be a very important module in the Red ecosystem.

[17:25:33](#l_nqKqJj7BVh6T682XHf-FZSsPnIImr5HEyEwewo4nA) <gurzgri>:
@bubnenkoff `odbc` branch has been merged into `master` of [gurzgri/red](https://github.com/gurzgri/red)  

## 8-Jun-2022

[16:36:53](#tnLiJtJMLO3h-uOPjBcc5VdNnzeHLe_49oLEoFOpNkM) <gurzgri>:
@toomasv 
> Radio box at right changes view from data to columns, but again mariadb crashes on this transfer

Looks like MariaDB with [SQLColumns](https://docs.microsoft.com/en-us/sql/odbc/reference/syntax/sqlcolumns-function) makes [SQLDescribeCol](https://docs.microsoft.com/en-us/sql/odbc/reference/syntax/sqldescribecol-function) return a `ColumnSize` of 536'870'911 `WCHAR`s, i.e. 1 GByte for column `"TYPE_NAME"`, leading to a `system/cpu/overflow? ` when trying to preallocate a column buffer sized 1GByte × window size (1024 rows). 

In effect, the scheme allocates a buffer of size `0` and  a `*** access violation` being the inevitable result when [SQLFetchScroll](https://docs.microsoft.com/en-us/sql/odbc/reference/syntax/sqlfetchscroll-function) was trying to write into that buffer.

I'm in the process of adding a check for that just now. But in essence it will be a showstopper for using the `'columns` catalog function with MariaDB, because with that check in place it will always `cause-error 'internal 'limit-hit`. Which is better than crashing, but ... sigh. 

> I couldn't make mariadb behave without explicitly pointing out which database I want to see

To set the catalog, use `change connection [catalog: "database"]`. Microsoft Text Driver doesn't like doing so if a statement has been opened already. Other datasources may be even pickier, not allowing doing so *after* the connection itself has been established. And there is currently no way to do so *before* the connection connects with the scheme.

[17:18:29](#leFiRCtKknb3ETm-0ZrIu19Szv8r3Wx798J85WbGkaA) <gurzgri>:
Pushed these fixes and some.

[18:31:32](#6kTqZp_53p2mA1OeoEs_h-vNJp2U5V0sjXJ0c50Bhgw) <gurzgri>:
@toomasv `try-odbc-only.red` [gist](https://gist.github.com/gurzgri/a75c23b5e32fda1d3a5d7f62c23ecb46), with said MariaDB limitation (MySQL, SQLite not tested).

## 9-Jun-2022

[7:48:04](#drNDRbmXAHCPoa7YdRZiiyBpXjv9u58UhgY1TEeZGes) <toomasv>:
Thanks @gurzgri ! Will try soon.

[15:37:53](#cfLgI2NssjhQknnrqQ-G5k-2_D98HzduJx8QfZVyEM4) <gurzgri>:
Hacked gist so that it works for MariaDB, too.

## 10-Jun-2022

[6:26:28](#xMoXaEHENlnCfqQxPRTvCoN5nhLuuDM1v8CXyBJIgTE) <toomasv>:
Interesting, thanks! Hmm, mariadb still crashing here.

[6:27:29](#mo5MLkFxqd5T46HAleCWliw6Ge26jPx9Baib600MUxI) <toomasv>:
* Interesting, thanks! Hmm, mariadb still crashing here. 

[6:54:05](#_xGcUAM8vv3Ag35N02h9__bu4uBz25VgrpE-RTCfEZw) <gurzgri>:
Your're using gurzgri/red on commit 8a9606c and gurzgri/try-odbc-only.red on rev. 4? Sigh ... again.  

[7:04:14](#SyiZMSOeUpism9xSJrCTfrekbmVCNFTK9XCC1dSfnDc) <gurzgri>:
I'm using MariaDB ODBC 3.1 Driver version 3.01.15.00 from 2021-11-15 here.

[7:33:20](#3p114wZMYi2vB0VHwabeSfatUHJ9y8rFcVEm-Vc_c0o) <toomasv>:
Ok, I fetched your updates and now it works. Thanks again!

[7:37:02](#dTFfvL4vT59hX3KqLsGB0uApnQrV95P6hFUJiJOSwdI) <gurzgri>:
������

[7:41:10](#kjGM1-Uhue9_zDe7S9jhMLcZHq4os60QvqehXxnrKpE) <toomasv>:
������

[9:14:06](#WNt_WmRuvmqNs3A2oWU5YmuEprUTyGtsfXWPlWrDLfg) <gurzgri>:
[![image.png](https://files.gitter.im/6234feab6da037398492a62a/pkI3/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/pkI3/image.png)

[9:14:31](#CckY6FTnKLEBIh8denvXTZv_BREP_duMhMxssyp3UDI) <gurzgri>:
Rev. 5

## 19-Jun-2022

[11:13:30](#dToQSh6t_ivCaH4mZTn8ijfaF9Psp89iDCJFvr0hrms) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri I am trying to run my app and server is run on another IP. And I am getting next error:
```
send-startup-info
[SUCCESS] PostgreSQL Connection
odbc-count-request
total count(*):  3207408
....
*** Script Error: ODBC error: []
*** Where: execute-statement
*** Near : port/state describe-result port/state
*** Stack: view layout layout layout do-safe parser-init start-stop-processing error? xml-for-processing-request time-it try-to-insert-data-to-db data-to-sql flat-data-to-prepared-insert
```

[11:15:57](#YFRL_6U5V1JhbfJdm1GaM1urRw_gIB7J9anEKtTiqkQ) <bubnenkoff (Dmitry Bubnenkov)>:
* @gurzgri I am trying to run my app and server is run on another IP. And I am getting next error:
```
send-startup-info
[SUCCESS] PostgreSQL Connection
odbc-count-request
total count(*):  3207408
....
Generation INSERT STATEMENT
DELETE:
DELETE FROM notifications WHERE "purchaseNumber" = '0101300011118000042';
*** Script Error: ODBC error: []
*** Where: execute-statement
*** Near : port/state describe-result port/state
*** Stack: view layout layout layout do-safe parser-init start-stop-processing error? xml-for-processing-request time-it try-to-insert-data-to-db data-to-sql flat-data-to-prepared-insert
```

[11:16:48](#sLxZQ2aApNaNByHGUGWTtKIt6l7YivU2j0kW_rp-lfI) <bubnenkoff (Dmitry Bubnenkov)>:
so it's connecting, but fail on execution of request. And by the log it's hard understand what happens 

[12:12:04](#1Y7Y97lrPm-N4RlKUeAZVZyfCUODkAn5sGhEZSFmEWs) <bubnenkoff (Dmitry Bubnenkov)>:
Same build work when DB is running on same host

[12:25:11](#2h3fSwW3Jl8TRCSOVTX5i0Hlteeav1i61z9vU2FbFCE) <bubnenkoff (Dmitry Bubnenkov)>:
It's strange that it's not only from new server, from old server I am able to connect to DB and it's working 

[13:46:00](#RliNUNcM2jPhdSKI9r8VBTUYbORi_jXi3yTH69nR5ZY) <toomasv>:
@gurzgri Great! I'm back from a little trip. Are you really updating tables here?!

[14:14:54](#-1RTiJx_VJzKdc-Rf4mPGpaik65vUa4NJ7TG_GTZlmA) <bubnenkoff (Dmitry Bubnenkov)>:
I can't reproduce error above. After some success run my app from old server new instance begin work. I have one idea and will write if I would be able to reproduce error

[16:46:44](#RPiI_w8u1yV53BulR7m4eLoWziVoIqUdIt9MHaw2SyI) <bubnenkoff (Dmitry Bubnenkov)>:
Again error above... do not understand what wrong...

[16:46:56](#aXfLd8QFjpLr5F96RNEtORZJ1p8ZPyzDsCgBrbpLAog) <bubnenkoff (Dmitry Bubnenkov)>:
* Again error above... do not understand what's wrong...

[16:48:42](#sUuZneyzs1n6mL5wMwSWHfangGeVUr24VN7vs-3hVZI) <bubnenkoff (Dmitry Bubnenkov)>:
what mean error `port/state describe-result port/state` ?

[16:59:42](#5HKrrLKc2lxPuWEcOXlThElORgZvYYDcw8wOTN9U8_k) <bubnenkoff (Dmitry Bubnenkov)>:
For unknown reason this code is crush App on new server:
```
            delete-sql: none
            either ((type? idata/2) = string!) [
                delete-sql: rejoin [{DELETE FROM } key { WHERE "} to-string idata/1 {" = '} idata/2 {';}]
            ] [
                delete-sql: rejoin [{DELETE FROM } key { WHERE "} to-string idata/1 {" = } idata/2 {;}]
            ]
          
            print "DELETE: "
            print delete-sql
            insert data-insert-statement delete-sql
            print "detete done"
```
With error:
```
DELETE:
DELETE FROM notifications WHERE "purchaseNumber" = '0126300035817000408';
*** Script Error: ODBC error: []
*** Where: execute-statement
*** Near : port/state describe-result port/state
*** Stack: view layout layout layout do-safe parser-init start-stop-processing error? xml-for-processing-request time-it try-to-insert-data-to-db data-to-sql flat-data-to-prepared-insert
```

If to comment it it work. But I do not understand reason.  

[17:00:28](#58ZtFtYIRu_W8EHBqKamtwy5qIpoCEQRIkhy-XlrM6g) <bubnenkoff (Dmitry Bubnenkov)>:
* For unknown reason this code is crush App on new server:
```
            delete-sql: none
            either ((type? idata/2) = string!) [
                delete-sql: rejoin [{DELETE FROM } key { WHERE "} to-string idata/1 {" = '} idata/2 {';}]
            ] [
                delete-sql: rejoin [{DELETE FROM } key { WHERE "} to-string idata/1 {" = } idata/2 {;}]
            ]
          
            print "DELETE: "
            print delete-sql
            insert data-insert-statement delete-sql
            print "detete done"
```
With error:
```
DELETE:
DELETE FROM notifications WHERE "purchaseNumber" = '0126300035817000408';
*** Script Error: ODBC error: []
*** Where: execute-statement
*** Near : port/state describe-result port/state
*** Stack: view layout layout layout do-safe parser-init start-stop-processing error? xml-for-processing-request time-it try-to-insert-data-to-db data-to-sql flat-data-to-prepared-insert
```
If to comment it it work. But I do not understand reason.  


But `INSERT ` statement work on both servers without error. The problem only with `DELETE`

[17:02:20](#OgFfjarGJLELVFNqM0hNK_c_GZQTCWEG_Hfl0rQYNDs) <bubnenkoff (Dmitry Bubnenkov)>:
* For unknown reason this code is crush App on new server:
```
            delete-sql: none
            either ((type? idata/2) = string!) [
                delete-sql: rejoin [{DELETE FROM } key { WHERE "} to-string idata/1 {" = '} idata/2 {';}]
            ] [
                delete-sql: rejoin [{DELETE FROM } key { WHERE "} to-string idata/1 {" = } idata/2 {;}]
            ]
          
            print "DELETE: "
            print delete-sql
            insert data-insert-statement delete-sql
            print "detete done"
```
With error:
```
DELETE:
DELETE FROM notifications WHERE "purchaseNumber" = '0126300035817000408';
*** Script Error: ODBC error: []
*** Where: execute-statement
*** Near : port/state describe-result port/state
*** Stack: view layout layout layout do-safe parser-init start-stop-processing error? xml-for-processing-request time-it try-to-insert-data-to-db data-to-sql flat-data-to-prepared-insert
```
If to comment it it work. But I do not understand reason.  

But `INSERT ` statement work on both servers without error. The problem only with `DELETE`.

And I am use build from last commit. I tried downgrade, but same issue. 

[17:50:53](#gTmb5C7D39Bi08s7VImoEc2BQn7cxmiX1zApXMy59jE) <bubnenkoff (Dmitry Bubnenkov)>:
If to run App on same server where PG installed (I talk about new server) I am getting same error.

[19:11:35](#jn0c2JV_PD6llubfQs3Y_0jrH7FFDCH6A2hbbBuZJRM) <bubnenkoff (Dmitry Bubnenkov)>:
prepared statement version:
```
delete-sql: rejoin [{DELETE FROM } key { WHERE "} to-string idata/1 {" = ?} ]

print "delete start"
insert data-insert-statement compose [ (delete-sql) (idata/2)  ]

print "DELETE: "        
```
Exactly same error:

```
delete start
*** Script Error: ODBC error: []
*** Where: execute-statement
*** Near : port/state describe-result port/state
*** Stack: view layout layout layout do-safe parser-init start-stop-processing error? xml-for-processing-request time-it try-to-insert-data-to-db data-to-sql flat-data-to-prepared-insert
```

## 20-Jun-2022

[7:17:46](#JswcNgdrny86wYWYTUKOkNZx6izsDWK55aJkv5SSTtA) <bubnenkoff (Dmitry Bubnenkov)>:
I tried to upgrade my dev PC to PG 14.4 it's works fine. Error happens only on new prod server

[7:48:48](#oi1zPFzFOFxuKHGcezuEF9wjvczEPKMc-0sMJic24A8) <bubnenkoff (Dmitry Bubnenkov)>:
debug version:

```
delete start
INSERT actor
OPEN? actor
FREE-PARAMETERS [
]
FREE-COLUMNS [
]
FREE-STATEMENT [
        SQLFreeStmt 0
        SQLFreeStmt 0
        SQLFreeStmt 0
]
PREPARE-STATEMENT [
        SQLPrepare 0
]
BIND-PARAMETERS [
        1 rows of 1 params
        allocate status/value, 4 bytes @ 0509B4F0
SET-STATEMENT [
        SQLSetStmtAttr 0
]
SET-STATEMENT [
        SQLSetStmtAttr 0
]
        prm 1
                slotlen? row 1/1
                TYPE_OF(7)
                        slotlen = 40
                        slotlen = 40
        allocate buffer, 40 bytes @ 0509A168
        allocate lenbuf, 4 bytes @ 0509B520
                populate row 1/1
                TYPE_OF(7)
        prm    1
        C-type 65528
        SQL-type 65527
        col-size 40
        digits 0
        buffer 0509A168
        slotlen 40
        lenbuf 0509B520
        SQLBindParameter 0
]
EXECUTE-STATEMENT [
        SQLExecute 100
*** Script Error: ODBC error: []
*** Where: execute-statement
*** Near : port/state describe-result port/state
*** Stack: view do-events do-actor do-safe start-stop-processing error? xml-for-processing-request time-it try-to-insert-data-to-db data-to-sql flat-data-to-prepared-insert

```

[8:07:40](#ZI8dgXOvWo1c5m6qo2dMIOiKrNina0XxHbBjSRFji4k) <bubnenkoff (Dmitry Bubnenkov)>:
After some testing: the error happens on every instance. I used old build without this code so I thought it work. After updating all App I got error on every server

[14:01:26](#TuFY79BneIwVNS4aWBE6OQZzE_ZWC_LbA7zPE5ZKzP0) <bubnenkoff (Dmitry Bubnenkov)>:
Continue trying to get more info about an error:
``` 
 if error? result: try [
       insert data-insert-statement compose [ (delete-sql) (idata/2)  ]
 ] [
    probe result          
 ]
```
 
error:
```
make error! [
    code: 350
    type: 'script
    id: 'bad-bad
    arg1: 'ODBC
    arg2: []
    arg3: none
    near: [port/state
    describe-result port/state]
    where: 'execute-statement
    stack: 16062188
]
``` 

[17:29:54](#Ba588w1rvadObjxB_WCCx7Y5sMPt1I3s9eN9yT1hTh8) <gurzgri>:
@bubnenkoff `SQLExecute 100` means executing the statement returns `SQL_NO_DATA`. I've by myself stumpled upon that recently and had fixed it already, but hadn't yet pushed the fix. Made up for just now, please pull again.

[17:34:18](#IY0PJOyDM0KtjcSqPg-ZSJbFwNCwn7qZ0dL3aXPydyM) <gurzgri>:
@toomasv
> Are you really updating tables here?!

Yes, odbc:// not only supports `SELECT` but `INSERT`, `UPDATE` and `DELETE` statements, too. If your table template allows for some sort of "on-cell-change" handlers, writing back edits to the database should be quite possible.

[19:25:13](#UWu7qsdLJnJT09UjNndlWMpxtOz7k2Y71vJ8TFSxE5c) <bubnenkoff (Dmitry Bubnenkov)>:
> @bubnenkoff `SQLExecute 100` means executing the statement returns `SQL_NO_DATA`. I've by myself stumpled upon that recently and had fixed it already, but hadn't yet pushed the fix. Made up for just now, please pull again.

Big thanks! It seems that now it's working!

## 21-Jun-2022

[10:02:30](#7l5gWENUCnP5WjtAkVV5RFY6wRGZRWhdmElhwEhEZ88) <bubnenkoff (Dmitry Bubnenkov)>:
> @bubnenkoff `SQLExecute 100` means executing the statement returns `SQL_NO_DATA`. I've by myself stumpled upon that recently and had fixed it already, but hadn't yet pushed the fix. Made up for just now, please pull again.

Big thanks! It seems that now it's working!

[11:25:48](#kobFuTtTt2ecjANV118rJrRGFMoTdCdFY9ZgalSJYnM) <bubnenkoff (Dmitry Bubnenkov)>:
I am getting some strange crush. 

I am trying to switch to old commit where (possible) all works.
I am doing:
```
$ git reset --hard 46f1ea366f03204f78e79b9113794017965a1334
HEAD is now at 46f1ea366 FIX: addtional fix for issue #5134
```
than:
```
do/args %red.r "-r %environment/console/CLI/console.red"
```

But when I am trying to compile my app I am getting an error that ODBC not found:
```
Compiling d:\code\app.red ...
...using libRedRT built on 21-Jun-2022/14:16:13+3:00
*** Compilation Error: module not found: ODBC
*** in file: d:\code\app.red
*** near: []
```

But it compile fine if I am not switching the branch. I tried few different commits. Same error.

[11:27:47](#PlmDnkkp4hPrEShFLNtYTe3QK5PBKISOMrQJHGk9Tko) <bubnenkoff (Dmitry Bubnenkov)>:
The crush if very strange. Few instance of app it working fine. Few is failing at DB insert stage with an error:
```
Runtime Error 1: access violation
```
It seems that there that difference in parameters. I am trying to dump them.

[13:05:19](#AbTUm72c-7ciGHDaXgXbAfeTLt2mIrR0xaFxEPRQN44) <bubnenkoff (Dmitry Bubnenkov)>:
I am trying to find reason of crush. I wrote next code.
```
Red [
		Needs: [View ODBC]
		]

    connection: try [ 
            open make port! [
            scheme: 'odbc
            target: "driver={PostgreSQL Unicode};server=127.0.0.1;port=5432;database=db;uid=postgres;pwd=1234567"
        ]
    ] 
    either not error? connection [
        xml-files-statement: open connection
        data-insert-statement: open connection     
        print "[SUCCESS] PostgreSQL Connection"
    ] [
        print "[ERROR] PostgreSQL Connection"
        print connection/arg2 ; arg2 это у нас текст ошбики 
    ]



data-insert-statement: open connection

insert-part: {INSERT INTO applications ("lotNumber", "purchaseNumber", "admitted", "appNumber", "appRating", "increaseInitialPrice", "offer_price", "firstOffer_price", "firstOffer_increaseInitialPrice", "lastOffer_price", "lastOffer_increaseInitialPrice", "bestPrice", "finalPrice", "journalNumber", "lastOfferPrice", "participant_contactEMail", "participant_address_post", "participant_address_fact", "participant_phoneNumber", "participant_fullname", "participant_inn", "is_individualPerson", "individualPerson_address", "individualPerson_phone", "individualPerson_contactEMail", "individualPerson_inn", "winnerPrice", "appRejectedReason") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}
prepared-values-part: [[0 "0176200005516000136" true none none none none none none none none none none "1" none none none none none none none none none none none none none {Some text}] [0 "0176200005516000136" true none none none none none none none none none none "3" none none none none none none none none none none none none none none] [0 "0176200005516000136" true none none none none none none none none none none "4" none none none none none none none none none none none none none none] [0 "0176200005516000136" none none none none none none none none none none none "5" none none none none none none none none none none none none none none]]


print "start"

insert data-insert-statement compose [ 
                    (insert-part)
                    (prepared-values-part)
                ]     


print "end"                
```

After it's running I am getting an error:
```
[SUCCESS] PostgreSQL Connection
start
*** Script Error: values must be of the same type
*** Where: do
*** Near : args
*** Stack: cause-error
```

[13:07:55](#YvswJDyLfuz06X-WfwVWLBFmylibKAy_pJT0-DiqRnA) <bubnenkoff (Dmitry Bubnenkov)>:
* I am trying to find reason of crush. I wrote next code.
```
Red [
		Needs: [View ODBC]
		]

    connection: try [ 
            open make port! [
            scheme: 'odbc
            target: "driver={PostgreSQL Unicode};server=127.0.0.1;port=5432;database=db;uid=postgres;pwd=1234567"
        ]
    ] 
    either not error? connection [
        xml-files-statement: open connection
        data-insert-statement: open connection     
        print "[SUCCESS] PostgreSQL Connection"
    ] [
        print "[ERROR] PostgreSQL Connection"
        print connection/arg2 ; arg2 это у нас текст ошбики 
    ]



data-insert-statement: open connection

insert-part: {INSERT INTO applications ("lotNumber", "purchaseNumber", "admitted", "appNumber", "appRating", "increaseInitialPrice", "offer_price", "firstOffer_price", "firstOffer_increaseInitialPrice", "lastOffer_price", "lastOffer_increaseInitialPrice", "bestPrice", "finalPrice", "journalNumber", "lastOfferPrice", "participant_contactEMail", "participant_address_post", "participant_address_fact", "participant_phoneNumber", "participant_fullname", "participant_inn", "is_individualPerson", "individualPerson_address", "individualPerson_phone", "individualPerson_contactEMail", "individualPerson_inn", "winnerPrice", "appRejectedReason") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}
prepared-values-part: [
    [0 "0176200005516000136" true none none none none none none none none none none "1" none none none none none none none none none none none none none {Some text}] 
    [0 "0176200005516000136" true none none none none none none none none none none "3" none none none none none none none none none none none none none none] 
    [0 "0176200005516000136" true none none none none none none none none none none "4" none none none none none none none none none none none none none none] 
    [0 "0176200005516000136" none none none none none none none none none none none "5" none none none none none none none none none none none none none none]
    ]


print "start"

insert data-insert-statement compose [ 
                    (insert-part)
                    (prepared-values-part)
                ]     


print "end"                
```

After it's running I am getting an error:
```
[SUCCESS] PostgreSQL Connection
start
*** Script Error: values must be of the same type
*** Where: do
*** Near : args
*** Stack: cause-error
```

Do not know if this related with this bug

[13:09:16](#oEykgJJRwbgVCEr_Z8a-YTmW1wUkJuRGJ29yQ9lJyhE) <bubnenkoff (Dmitry Bubnenkov)>:
* I am trying to find reason of crush. I wrote next code.
```
Red [
		Needs: [View ODBC]
		]

    connection: try [ 
            open make port! [
            scheme: 'odbc
            target: "driver={PostgreSQL Unicode};server=127.0.0.1;port=5432;database=db;uid=postgres;pwd=1234567"
        ]
    ] 
    either not error? connection [
        xml-files-statement: open connection
        data-insert-statement: open connection     
        print "[SUCCESS] PostgreSQL Connection"
    ] [
        print "[ERROR] PostgreSQL Connection"
        print connection/arg2 ; error text
    ]



data-insert-statement: open connection

insert-part: {INSERT INTO applications ("lotNumber", "purchaseNumber", "admitted", "appNumber", "appRating", "increaseInitialPrice", "offer_price", "firstOffer_price", "firstOffer_increaseInitialPrice", "lastOffer_price", "lastOffer_increaseInitialPrice", "bestPrice", "finalPrice", "journalNumber", "lastOfferPrice", "participant_contactEMail", "participant_address_post", "participant_address_fact", "participant_phoneNumber", "participant_fullname", "participant_inn", "is_individualPerson", "individualPerson_address", "individualPerson_phone", "individualPerson_contactEMail", "individualPerson_inn", "winnerPrice", "appRejectedReason") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}
prepared-values-part: [
    [0 "0176200005516000136" true none none none none none none none none none none "1" none none none none none none none none none none none none none {Some text}] 
    [0 "0176200005516000136" true none none none none none none none none none none "3" none none none none none none none none none none none none none none] 
    [0 "0176200005516000136" true none none none none none none none none none none "4" none none none none none none none none none none none none none none] 
    [0 "0176200005516000136" none none none none none none none none none none none "5" none none none none none none none none none none none none none none]
    ]


print "start"

insert data-insert-statement compose [ 
                    (insert-part)
                    (prepared-values-part)
                ]     


print "end"                
```

After it's running I am getting an error:
```
[SUCCESS] PostgreSQL Connection
start
*** Script Error: values must be of the same type
*** Where: do
*** Near : args
*** Stack: cause-error
```

Do not know if this related with this bug

[13:28:26](#rcuhnyfr8LwDbMmRL8IMkewQpweCuT0MSnZbDNX3zyU) <bubnenkoff (Dmitry Bubnenkov)>:
Bingo! The reason of 
```
*** Runtime Error 1: access violation
*** at: 54B6282Eh
```
is different parameters types!

Real app is crushing with  `access violation` error, but example just show error above.

[16:18:15](#qnTmYrTV-AyEZJpCNnyTX8QAvq4mxWN2quy7pOZjlbo) <greggirwin (Gregg Irwin)>:
Thanks for the continued testing and reports @bubnenkoff. :+1:

[18:00:27](#1k2eQr4LxfV0zmL9m84Zb5GEtcHExpKwFHBlmE2WZg8) <gurzgri>:
@bubnenkoff The `*** Script Error: values must be of the same type` error is intentionally thrown when the paramaters in a given parameter column are of different types (not counting `none`, which *is* allowed). Of course that error should result in a `*** Runtime Error 1: access violation` — is that really what's happening (script error + access vioalation)? I'll have to investigate wether this is a possible situation.

But what might cause the `*** Script Error: values must be of the same type` here is probably your `prepared-values-part`: Could it be that `true` and `none` are again of type `word!` instead of type `logic!` and `none!`? If so, the `"appRejectedReason"` parameter would consist of `string!` and `word!` and the parameters would be rejected. 

[18:00:51](#8-ThZSG6hDn0XV-vEkbrzRpFJT042gWW2HbY4B0wI2o) <gurzgri>:
* @bubnenkoff The `*** Script Error: values must be of the same type` error is intentionally thrown when the paramaters in a given parameter column are of different types (not counting `none`, which *is* allowed). Of course that error should *not* result in a `*** Runtime Error 1: access violation` — is that really what's happening (script error + access vioalation)? I'll have to investigate wether this is a possible situation.

But what might cause the `*** Script Error: values must be of the same type` here is probably your `prepared-values-part`: Could it be that `true` and `none` are again of type `word!` instead of type `logic!` and `none!`? If so, the `"appRejectedReason"` parameter would consist of `string!` and `word!` and the parameters would be rejected. 

[18:01:03](#KUYvL2XXcp1PGont5-Jpwzc-PKdiJ1IrLWf4gNTaEcg) <gurzgri>:
* @bubnenkoff The `*** Script Error: values must be of the same type` error is intentionally thrown when the paramaters in a given parameter column are of different types (not counting `none`, which *is* allowed). Of course that error should *not* result in a `*** Runtime Error 1: access violation` — is that really what's happening (script error + access violation)? I'll have to investigate wether this is a possible situation.

But what might cause the `*** Script Error: values must be of the same type` here is probably your `prepared-values-part`: Could it be that `true` and `none` are again of type `word!` instead of type `logic!` and `none!`? If so, the `"appRejectedReason"` parameter would consist of `string!` and `word!` and the parameters would be rejected. 

[18:39:24](#SQv5VNClCi1INPh2FGHzE98IR5tkIXGq6HR2QzJSyvA) <bubnenkoff (Dmitry Bubnenkov)>:
That's very strange I am getting random crush if run app many times on same file:
```
INSERT DONE!!!
---------------------
INSERT INTO applications ("lotNumber", "purchaseNumber", "admitted", "appNumber", "appRating", "increaseInitialPrice", "offer_price", "firstOffer_price", "firstOffer_increaseInitialPrice", "lastOffer_price", "lastOffer_increaseInitialPrice", "bestPrice", "finalPrice", "journalNumber", "lastOfferPrice", "participant_contactEMail", "participant_address_post", "participant_address_fact", "participant_phoneNumber", "participant_fullname", "participant_inn", "is_individualPerson", "individualPerson_address", "individualPerson_phone", "individualPerson_contactEMail", "individualPerson_inn", "winnerPrice", "appRejectedReason") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
[[0 "0176200005516000137" true none none none none none none none none none none "1" none none none none none none none none none none none none none "sdfddd dddddddd"] [0 "0176200005516000137" none none none none none none none none none none none "2" none none none none none none none none none none none none none none]]
------------------------------------------------------

*** Runtime Error 1: access violation
*** at: 54B6282Eh
```

But sometimes it's insert data without errro

[18:39:28](#t_wXw9G2DbYv8PNLSl_PvZvXMhjze5rqr8ZlZOg8mM0) <bubnenkoff (Dmitry Bubnenkov)>:
* That's very strange I am getting random crush if run app many times on same file:
```
INSERT DONE!!!
---------------------
INSERT INTO applications ("lotNumber", "purchaseNumber", "admitted", "appNumber", "appRating", "increaseInitialPrice", "offer_price", "firstOffer_price", "firstOffer_increaseInitialPrice", "lastOffer_price", "lastOffer_increaseInitialPrice", "bestPrice", "finalPrice", "journalNumber", "lastOfferPrice", "participant_contactEMail", "participant_address_post", "participant_address_fact", "participant_phoneNumber", "participant_fullname", "participant_inn", "is_individualPerson", "individualPerson_address", "individualPerson_phone", "individualPerson_contactEMail", "individualPerson_inn", "winnerPrice", "appRejectedReason") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
[[0 "0176200005516000137" true none none none none none none none none none none "1" none none none none none none none none none none none none none "sdfddd dddddddd"] [0 "0176200005516000137" none none none none none none none none none none none "2" none none none none none none none none none none none none none none]]
------------------------------------------------------

*** Runtime Error 1: access violation
*** at: 54B6282Eh
```

But sometimes it's insert data without errroк

[18:43:39](#HpRYYAJVjWeumDivsjEJXl9XwZ-F3dIswe3mhIt-GaY) <bubnenkoff (Dmitry Bubnenkov)>:
* That's very strange I am getting random crush if run app many times on same file:
```
INSERT DONE!!!
---------------------
INSERT INTO applications ("lotNumber", "purchaseNumber", "admitted", "appNumber", "appRating", "increaseInitialPrice", "offer_price", "firstOffer_price", "firstOffer_increaseInitialPrice", "lastOffer_price", "lastOffer_increaseInitialPrice", "bestPrice", "finalPrice", "journalNumber", "lastOfferPrice", "participant_contactEMail", "participant_address_post", "participant_address_fact", "participant_phoneNumber", "participant_fullname", "participant_inn", "is_individualPerson", "individualPerson_address", "individualPerson_phone", "individualPerson_contactEMail", "individualPerson_inn", "winnerPrice", "appRejectedReason") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
[[0 "0176200005516000137" true none none none none none none none none none none "1" none none none none none none none none none none none none none "sdfddd dddddddd"] [0 "0176200005516000137" none none none none none none none none none none none "2" none none none none none none none none none none none none none none]]
------------------------------------------------------

*** Runtime Error 1: access violation
*** at: 54B6282Eh
```

But sometimes it's insert data without error

[18:48:34](#lmoHhY3vwLx6fnaRvOUWSQmm4z6KAlnaJl7dxhHoUTc) <bubnenkoff (Dmitry Bubnenkov)>:
interesting moment. If text is long (200-300 symbols) it's crush 10 times from 10 attempts. If text is short there is some chance that it do not crush 

[18:50:04](#YFGr5ZEuwiJdRbiJWSIC_t14bnhMORVLLGbzr_2sKRE) <gurzgri>:
[![image.png](https://files.gitter.im/6234feab6da037398492a62a/s1R5/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/s1R5/image.png)

[18:50:13](#q2CcU4Fu_JIal4xFEZbuJEZ4L-DlpfxLW1BGNf3gHp8) <gurzgri>:
@toomasv Finally! By casting some pagan magic spells from the Ancient Book of Kernel the 32th instead of calling upon Malloc from the Depth of Red/System I finally unleashed the ODBC Powers of SQLite thru the Aethers of the SQLite ODBC Driver.

In other words: Now even SQLite / [SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) works ������ 



[18:52:22](#w7iGf0uBZz2eOCpyQXWw92BpO4Th-rklVurIHatIfA0) <gurzgri>:
(probably minus some occasional crashes every now and then)

[18:52:42](#C2ieIl0cOVwnhLftz1XLT76b2GGDkPbNV83OiFJXTwY) <bubnenkoff (Dmitry Bubnenkov)>:
```
INSERT INTO applications ("lotNumber", "purchaseNumber", "admitted", "appNumber", "appRating", "increaseInitialPrice", "offer_price", "firstOffer_price", "firstOffer_increaseInitialPrice", "lastOffer_price", "lastOffer_increaseInitialPrice", "bestPrice", "finalPrice", "journalNumber", "lastOfferPrice", "participant_contactEMail", "participant_address_post", "participant_address_fact", "participant_phoneNumber", "participant_fullname", "participant_inn", "is_individualPerson", "individualPerson_address", "individualPerson_phone", "individualPerson_contactEMail", "individualPerson_inn", "winnerPrice", "appRejectedReason") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
[[0 "0176200005516000137" true none none none none none none none none none none "1" none none none none none none none none none none none none none {Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.}] [0 "0176200005516000137" none none none none none none none none none none none "2" none none none none none none none none none none none none none none]]
```

For example this peace is crush real app every time. I am trying to find length when inserting begin work.

[18:55:18](#Mp9vD1wyegzGH5t_chc-bQFcNpXqhjYoBNVCiJx5dhA) <bubnenkoff (Dmitry Bubnenkov)>:
with: 
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
```
5 crush with `Runtime Error 1: access violation` and 1 success 

[19:06:37](#pyMX5EcdYEeaAV-d4lAbezpDC_YoV3OB_ZvW00ljgGk) <bubnenkoff (Dmitry Bubnenkov)>:
[![изображение.png](https://files.gitter.im/6234feab6da037398492a62a/N2Dr/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/N2Dr/izobrazhenie.png)

[19:16:35](#-q_J_Kd3h8yhkZQv6U_yu2CgK0mTEqXzyTj9pVgkkfk) <gurzgri>:
Insert `foreach row prepared-values-part [probe collect [foreach prm row [keep type? prm]]]` there.

[19:17:40](#ijBnck6xzCm4Ok6pFyLUvgNsoy1lA2TcqFyy4a1JFzU) <gurzgri>:
* Insert `foreach row prepared-values-part [probe collect [foreach prm row [keep type? prm]]]` there, post the output here.

[19:21:49](#biYODYlmKtwqx_tZgMI83e2TYLXjfTPoqEuFRlvrQ9Q) <bubnenkoff (Dmitry Bubnenkov)>:
in place of `here` on screenshot? 

[19:27:36](#hb_m2mMq1vdN-rwS-zrBA2OehGzNeYpGBPgfj69muF4) <bubnenkoff (Dmitry Bubnenkov)>:
```
INSERT INTO applications ("lotNumber", "purchaseNumber", "admitted", "appNumber", "appRating", "increaseInitialPrice", "offer_price", "firstOffer_price", "firstOffer_increaseInitialPrice", "lastOffer_price", "lastOffer_increaseInitialPrice", "bestPrice", "finalPrice", "journalNumber", "lastOfferPrice", "participant_contactEMail", "participant_address_post", "participant_address_fact", "participant_phoneNumber", "participant_fullname", "participant_inn", "is_individualPerson", "individualPerson_address", "individualPerson_phone", "individualPerson_contactEMail", "individualPerson_inn", "winnerPrice", "appRejectedReason") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
[[0 "0176200005516000137" true none none none none none none none none none none "1" none none none none none none none none none none none none none {Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.}] [0 "0176200005516000137" none none none none none none none none none none none "2" none none none none none none none none none none none none none none]]
------------------------------------------------------
[integer! string! logic! none! none! none! none! none! none! none! none! none! none! string! none! none! none! none! none! none! none! none! none! none! none! none! none! string!]
[integer! string! none! none! none! none! none! none! none! none! none! none! none! string! none! none! none! none! none! none! none! none! none! none! none! none! none! none!]
here
```


[19:33:13](#JMRBN7h_8JiU9QNP-eTWYXvbX_pG6H8D-eavjh41Ibc) <gurzgri>:
Okay so, that's legit. Turn `date-insert-statement/state/debug?: on` then in this particular line and let's see how the param buffer looks like.

[19:34:06](#rKM3KEeehi8bCVyZutPSCZEECG7V7yEU5u68CE7u5Eg) <bubnenkoff (Dmitry Bubnenkov)>:
I should to add this line to header of app? 

[19:35:18](#T0WuzUWNf1Wfk8FMP_aB1dZ4MjqqAZGIYJAz2DVZx5s) <bubnenkoff (Dmitry Bubnenkov)>:
```
        data-insert-statement: open connection
        date-insert-statement/state/debug?: on
```
Would it ok?


[19:36:52](#RBOsrnBVV7dwGlSGqbQeslH2WMRZIxpF6Q-zl3hPLGA) <gurzgri>:
Well, probably just about everywhere *before* line 421 in the above screenshot would be okay. 

[19:38:46](#ICrKtlVQlQwFGp1QyXxJ_iQlNOHsBThd8VFAEo-0P84) <bubnenkoff (Dmitry Bubnenkov)>:
Well, probably just about everywhere *before* line 421 in the above screenshot would be okay. 

[19:40:53](#hQDDkpfuO6B6cSd7SlCytGZHqQtSdT1IzbjKiG18Fxw) <bubnenkoff (Dmitry Bubnenkov)>:
https://gist.github.com/bubnenkoff/e4003a75a2f328740ceffcf6bf51db7e

[19:40:58](#LN-Ot9Lx8OL_2ieBcQnY-ldmZRvirazuA3qoBr8kXAU) <greggirwin (Gregg Irwin)>:
@gurzgri ������

[19:53:16](#Ozs8XqHUu8F9TEmoG3YVibSeyjnVKRRXiqPTT6XYzvQ) <gurzgri>:
Thanks, Gregg.

[20:09:30](#n5cn7RBAz7C5gaU_uygp-bIhGCSax6XA1SiGg0JPlck) <bubnenkoff (Dmitry Bubnenkov)>:
interesting:
I have add at start of function:
```
recycle/off
```

And got:
```
...
INSERT DONE!!!
INSERT done
D:/zak_data/fz44/protocols/Adygeja_Resp/protocol_Adygeja_Resp_2016030100_2016040100_001/fcsProtocolEF1_0176200005516000137_7929152.xml
*** Script Error: ODBC error: []
*** Where: free-statement
*** Near : port/state
*** Stack: view layout layout layout do-safe parser-init start-stop-processing error? xml-for-processing-request time-it try-to-insert-data-to-db
```
But by the log `applications` was inserted.

[20:09:54](#MZDSW9LqPQYltbpa3Ya6PEun9F1VkhXUrDfxaMxEOP8) <gurzgri>:
@bubnenkoff The buffer
```
04F94628:  4c00                               L.
04F948B8:  6900 6100 ffff ffff                i.a.ÿÿÿÿ
```
allocated for the param really looks fishy. It's only 2 bytes big instead of `(length? {Lorem ipsum ... est laborum.}) + 1 << 1 ;== 892 bytes` big. And I might already have an idea why. It's probably an artefact of the `none` param in row 2. I'll have a look.

[20:11:13](#UmpYLr60Y9Dh_-efnsV4a1UWfAUpNI4Gu4l_JGPo-wc) <bubnenkoff (Dmitry Bubnenkov)>:
* interesting:
I have add at start of function:
```
recycle/off
```

And got:
```
...
INSERT DONE!!!
INSERT done
D:/zak_data/fz44/protocols/Adygeja_Resp/protocol_Adygeja_Resp_2016030100_2016040100_001/fcsProtocolEF1_0176200005516000137_7929152.xml
*** Script Error: ODBC error: []
*** Where: free-statement
*** Near : port/state
*** Stack: view layout layout layout do-safe parser-init start-stop-processing error? xml-for-processing-request time-it try-to-insert-data-to-db
```
But by the log `applications` was inserted.

But this error was only once. Than: `access violation` again

[20:52:44](#nm8jwNnEJUjE2qMNPBM4mwdQCTmhyp0GKpJnJ2getPQ) <gurzgri>:
Definitly a regression, pushed a fix for that. Please pull and try again, @bubnenkoff .

## 22-Jun-2022

[7:10:21](#gHxspwRMCo3lL2HJ0clF4Mi3yl_n38hGJOwGWSlT0ak) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri perfect! It Works!

[7:15:13](#aXOgjg-jMDYonK1EHRPPbqdKzJMzYTSdLnAqfpqO8C0) <toomasv>:
Great news, @gurzgri , thanks! :+1:

## 28-Jun-2022

[15:24:57](#NROTMUpIEaXW6W7kcXoHzDk3-5fcMgXL_-qRejs_I8Q) <gurzgri>:
So here's a story from an intense bug huntig journey - you've all have been there before:

The ODBC scheme had some instability with crashes due to access violations every now and then. But without any noticeable pattern. Most of the time it just worked fine.

Then I tried to get it to play with SQLite. Everything worked fine with SQLite except retrieving results. And retrieving results worked fine with every other database I've tried so far. Somehow, I've managed to trace it down to some process heap memory issue, but wasn't up to the task of debugging it further and really got no hold of the error. The allocating/freeing logic looked okay, e.g. I wasn't freeing memory still in use and other such things.

So I've replaced all ALLOCATE/FREE calls with direkt calls to HeapAlloc/HeapFree. And .. SQLite results suddenly could be retrieved. Of course I didn't thought the underlying problem as being solved though, it was more like post-poned. But the problems went away and I ccontinued with cleaning up and refactoring the code. Fine.

Then suddenly the error came back. Now SQLite result retrieval wasn't possible in 10 out of 10 trials, yet again it was working with other databases. All the same symptoms as before. And creating a new heap next to the processes `GetProcessHeap` default heap didn't help either. So I finally wrote my own heap walker function which allowed me to have an eye on every allocation I've made and surrounded all API calls with functions inspecting the Heap validity before and after calling them.

Doing this made it really became clear that the Heap was intact before a call to `SQLDescribeCol` and wasn't intact after. 

So it wasn't exactly *me* who invalidated the heap, but it was SQLite. But of course I couldn't just assume that it's the SQLite drivers fault, which worked fine with other tools. Somehow it *must* have been *me* allowing it to overwrite some buffer ...

And so it was: I erroneously told `SQLDescribeCol` that the buffer to return a column name in was `len` wide chars big whilst it really was only `len` bytes big. The buffer still was large enough to keep all column names I've encoutered so far, but the driver wrote past its end anyways. 

Fixing the buffer size parameter to the correct wide char length made SQLite behave nicely. With the fix in place, I'm e.g. not able to get Toomas' table browser to crash anymore.

Working out all this low lowel stuff ate 2-3 weekends in a row and every minute of spare time in between.

In hindsight, the solution was just simple buffer size math. But what a relieve to know that the problem is solved! And I for sure learned myself a lesson or two on the way. 

PS: The fix hasn't been pushed yet. Now that I know that I can get rid of the HeapAPI functions and rewrite it to just use Red/System's `allocate`/`free` again ...

[15:25:15](#TSZZw41P7a0W6lR4p1ErM05t3GYX0QHk62JgGqhYV94) <gurzgri>:
* So here's a story from an intense bug huntig journey - you've all have been there before:

The ODBC scheme had some instability with crashes due to access violations every now and then. But without any noticeable pattern. Most of the time it just worked fine.

Then I tried to get it to play with SQLite. Everything worked fine with SQLite except retrieving results. And retrieving results worked fine with every other database I've tried so far. Somehow, I've managed to trace it down to some process heap memory issue, but wasn't up to the task of debugging it further and really got no hold of the error. The allocating/freeing logic looked okay, e.g. I wasn't freeing memory still in use and other such things.

So I've replaced all `allocate`/`free` calls with direkt calls to HeapAlloc/HeapFree. And .. SQLite results suddenly could be retrieved. Of course I didn't thought the underlying problem as being solved though, it was more like post-poned. But the problems went away and I ccontinued with cleaning up and refactoring the code. Fine.

Then suddenly the error came back. Now SQLite result retrieval wasn't possible in 10 out of 10 trials, yet again it was working with other databases. All the same symptoms as before. And creating a new heap next to the processes `GetProcessHeap` default heap didn't help either. So I finally wrote my own heap walker function which allowed me to have an eye on every allocation I've made and surrounded all API calls with functions inspecting the Heap validity before and after calling them.

Doing this made it really became clear that the Heap was intact before a call to `SQLDescribeCol` and wasn't intact after. 

So it wasn't exactly *me* who invalidated the heap, but it was SQLite. But of course I couldn't just assume that it's the SQLite drivers fault, which worked fine with other tools. Somehow it *must* have been *me* allowing it to overwrite some buffer ...

And so it was: I erroneously told `SQLDescribeCol` that the buffer to return a column name in was `len` wide chars big whilst it really was only `len` bytes big. The buffer still was large enough to keep all column names I've encoutered so far, but the driver wrote past its end anyways. 

Fixing the buffer size parameter to the correct wide char length made SQLite behave nicely. With the fix in place, I'm e.g. not able to get Toomas' table browser to crash anymore.

Working out all this low lowel stuff ate 2-3 weekends in a row and every minute of spare time in between.

In hindsight, the solution was just simple buffer size math. But what a relieve to know that the problem is solved! And I for sure learned myself a lesson or two on the way. 

PS: The fix hasn't been pushed yet. Now that I know that I can get rid of the HeapAPI functions and rewrite it to just use Red/System's `allocate`/`free` again ...

[15:27:57](#-DQHpuS2PH7iPJCVO4dWLriyQDzoA1nnmqFmQcd1Wcc) <gurzgri>:
* So here's a story from an intense bug huntig journey - you've all have been there before:

The ODBC scheme had some instability with crashes due to access violations every now and then. But without any noticeable pattern. Most of the time it just worked fine.

Then I tried to get it to play with SQLite. Everything worked fine with SQLite except retrieving results. And retrieving results worked fine with every other database I've tried so far. Somehow, I've managed to trace it down to some process heap memory issue, but wasn't up to the task of debugging it further and really got no hold of the error. The allocating/freeing logic looked okay, e.g. I wasn't freeing memory still in use and other such things.

So I've replaced all `allocate`/`free` calls with direkt calls to HeapAlloc/HeapFree. And .. SQLite results suddenly could be retrieved. Of course I didn't thought the underlying problem as being solved though, it was more like post-poned. But the problems went away and I ccontinued with cleaning up and refactoring the code. Fine.

Then suddenly the error came back. Now SQLite result retrieval wasn't possible in 10 out of 10 trials, yet again it was working with other databases. All the same symptoms as before. And creating a new heap next to the processes `GetProcessHeap` default heap didn't help either. So I finally wrote my own heap walker function which allowed me to have an eye on every allocation I've made and surrounded all API calls with functions inspecting the Heap validity before and after calling them.

Doing this made it really became clear that the Heap was intact before a call to `SQLDescribeCol` and wasn't intact after. 

So it wasn't exactly *me* who invalidated the heap, but it was SQLite. But of course I couldn't just assume that it's the SQLite drivers fault, which worked fine with other tools. Somehow it *must* have been *me* allowing it to overwrite some buffer ...

And so it was: I erroneously told `SQLDescribeCol` that the buffer to return a column name in was `len` wide chars big whilst it really was only `len` bytes big (half the size). The buffer still was large enough to keep all column names I've encoutered so far, but the driver wrote past its end anyways. 

Fixing the buffer size parameter to the correct wide char length made SQLite behave nicely. With the fix in place, I'm e.g. not able to get Toomas' table browser to crash anymore.

Working out all this low lowel stuff ate 2-3 weekends in a row and every minute of spare time in between.

In hindsight, the solution was just simple buffer size math. But what a relieve to know that the problem is solved! And I for sure learned myself a lesson or two on the way. 

PS: The fix hasn't been pushed yet. Now that I know that I can get rid of the HeapAPI functions and rewrite it to just use Red/System's `allocate`/`free` again ...

[15:31:06](#O68RlbM1PpbSYOeaRqRilpFXwtjNzGZzR9DVourXalE) <Respectech (Respectech)>:
Wow, great work!

[16:01:18](#ZTuXsr2USpH6xzXgj9WfE_vLGwx8_5lfgPu5b76tbiw) <GiuseppeChillemi (GiuseppeChillemi)>:
I have read every line like it was an intense adventure. Great work, I know what is working with passion and you have it.

[16:49:59](#vV-JtZL1HH7MdcXYoCXekzBEjHBQaKiUyUiPEyTFC0Q) <toomasv>:
Congratulations, @gurzgri, great adventure !

[18:38:46](#dC26fqfzIVEI9phC04_fnmVjUHaZVwhGSP8XrahwEbs) <greggirwin (Gregg Irwin)>:
Fantastic work @gurzgri! Thank you for all your efforts.

[18:39:07](#jhzO2pV39YcDx0kTxyc-CjMsQlFOjoJvlYB3dE8J8kE) <greggirwin (Gregg Irwin)>:
And thank you for sharing the story. It will help others so much.

## 4-Jul-2022

[20:37:48](#WPnyQXvjaURgMayXYe9EQs316-WCVc2IviVi0SIKyN4) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri Is there any reason why this column `s.importodare` is translated to `importo-dare` in Red ODBC?

[20:38:14](#pEjfSl1e0FwN6kek83aWMg-Z8rzZQ9Ry6jihXQHf1hU) <GiuseppeChillemi (GiuseppeChillemi)>:
* @gurzgri Is there any reason why this column `s.importodare` is translated to `importo-dare` in Red ODBC? (note, `s` is an alias)

[20:46:45](#qxFnbxq4txUxBfKjvRRhQc1gJhk8cSgv4sYqf0kl1yg) <gurzgri>:
What does statement/state/columns look like *for this specific* column?

[20:48:02](#CJMfwA6hSUqz9oRjYUKe5qPbDaeFZv6VBi2XZB-RFck) <gurzgri>:
* What does statement/state/columns look like *for this specific* column? And what do you expect instead?

[21:01:00](#C8Ff6QMPDR3DsJVJn_idIJOaQCd_HWNgnOgTg7rHdLc) <GiuseppeChillemi (GiuseppeChillemi)>:
```
[
...
importo-dare "ImportoDare" 2 1 38 2 1 handle! 39 handle!
...
```


[21:01:11](#8WNYfBljcYzpdRNJqV0HJwaytXtWz5ZSL-DxPTATeZ4) <GiuseppeChillemi (GiuseppeChillemi)>:
* ```
[
...
importo-dare "ImportoDare" 2 1 38 2 1 handle! 39 handle!
...
```
]

[21:01:23](#kpcbATaSuRSPHJ892Fe8YOYtkqwimYoAoPPp7MJ_V58) <GiuseppeChillemi (GiuseppeChillemi)>:
* ```
[
   ...
   importo-dare "ImportoDare" 2 1 38 2 1 handle! 39 handle!
   ...
```
]

[21:01:50](#fkbZYaVV6eOCz4IX0JTcu3K97IqoAdsOO2oAY_Kq2dg) <GiuseppeChillemi (GiuseppeChillemi)>:
* ```
[
   ...
   importo-dare "ImportoDare" 2 1 38 2 1 handle! 39 handle!
   ...
```


[21:01:57](#7P-JLtRBUapKg0_xou5u3pbmYY_-tIKTecKIztzYa_Q) <GiuseppeChillemi (GiuseppeChillemi)>:
* ```
[
   ...
   importo-dare "ImportoDare" 2 1 38 2 1 handle! 39 handle!
   ...
]
```


[21:02:08](#j4uwAbLc3yZb6tqp6dg666WK_42EZ0ES2Rzlb8Kwz2Y) <GiuseppeChillemi (GiuseppeChillemi)>:
But I can see all the others having this behaviour too

[21:02:51](#c-UrdeWP9b2_F2K7QuqEXpTIpwECBsHtEGvFJ9ryGp0) <GiuseppeChillemi (GiuseppeChillemi)>:
It seems they are split at each uppercase

[21:03:25](#HXjSCHYF1S0wb7c2OkcnztzfGMcbl6Ut7qvE8_8bdd8) <GiuseppeChillemi (GiuseppeChillemi)>:
* It seems they are split at each change from lowercase to uppercase

[21:03:40](#Iq81YVf1eoBC8hKmGuE4MIPdAdzzNX7j2fyS48AKwbc) <gurzgri>:
[Column names](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md#column-names)

[21:03:52](#VXT8-BRE61KYIX_QY7tHDfkvtMFcQgfZ_yRCgfBjtTo) <gurzgri>:
* See [Column names](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md#column-names)

[21:09:00](#uF_XBNtxdxPuvR1Cx1A0BsiO-z3ne_PYqnjFnBsHTIc) <GiuseppeChillemi (GiuseppeChillemi)>:
I thought it was only intended for `My Column` which are then translated to `my-column` but why on `MyColumn` too?

[21:16:13](#ifXHRFCUCwZFJ-gYIbhAy95nTsPYXReq0qdT1iZzsHc) <gurzgri>:
Because that is uncommon casing in Redbol languages since the very beginning, see e.g. [Hyphenate Multiple Word Names](http://www.rebol.com/r3/docs/concepts/scripts-style.html#section-9)

[21:23:59](#YjaDvUwr3821hOteYAJazySDvP7f8pQ7D0XBqbe9pe0) <GiuseppeChillemi (GiuseppeChillemi)>:
In this situation, we are in a different scenario. Column names are meant to be keys, so I think it is important to maintain a 100% equivalence.

[21:26:57](#zf1TN8b5aa_4GFR4bU__Eq667c9sV6PuegRKqMllkmw) <GiuseppeChillemi (GiuseppeChillemi)>:
I use a query to retrieve column name and datatype. I create an automatic object using those words and also the update creation code is fully automatic. 

[21:27:14](#stnBa4jsTRLADZfylqhl3HEpWZwoIomEaYatDo8i_D4) <GiuseppeChillemi (GiuseppeChillemi)>:
* I use a query to retrieve column name and datatypes. I create an automatic object using those words and also the update creation code is fully automatic. 

[21:27:20](#JQ1KxR2rTlxhV4Vaq-6GLg0PMsTytsMWS7DRDXgnuNs) <GiuseppeChillemi (GiuseppeChillemi)>:
* I use a query to retrieve column names and datatypes. I create an automatic object using those words and also the update creation code is fully automatic. 

[21:27:34](#vAyju2LDU7I6mB324zrNkM9YPAiZb4nb3AMiK_uWeRs) <GiuseppeChillemi (GiuseppeChillemi)>:
* I use a query to retrieve column names and datatypes. I create an automatic object using those words and also the update/insert query creation code is fully automatic. 

[21:28:32](#EPnaEDMcoqkXaVoDqW4_wpke3ue0HRMeIRTyOTJUYW8) <GiuseppeChillemi (GiuseppeChillemi)>:
However, having the second column as the original name solves this situation but I think many will fall into this problem as you don't expect it.

## 5-Jul-2022

[0:22:46](#ikhqy3R0PY8c4tI2hW07ym-2kOvPHrrVB0KEEyufFq8) <GiuseppeChillemi (GiuseppeChillemi)>:
Also: is it possible to have other information like the column datatype, length, if it is nullable...

[0:22:52](#eumTGTxLurVM708azc1Ps4YI4Tx3WCGlGqEuF5CGsk4) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also: is it possible to have other information like the column datatype, length, if it is nullable... ?

[0:23:12](#yfRveU_iCU1-ZfIf_IUXudVuInB8bd5covq7XcwykTE) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also: is it possible to have other query result information like the column datatype, length, if it is nullable... ?

[0:23:35](#4N38BlLA0liDfq_5VHOW6rTqAVb8Sfz0gckvlmgLwLw) <GiuseppeChillemi (GiuseppeChillemi)>:
* Also: is it possible to have other information on the query result query like the column datatype, length, if it is nullable... ?

[7:39:29](#uSorV17Bl5S6dn5rr5m7q34O-ubxjCDc31FjWWR5Sr4) <GiuseppeChillemi (GiuseppeChillemi)>:
I have a bug, confirmed in the latest version I have just downloaded. If I write a query with this malformed where clause (a placeholder has not been replaced) the interpreter crashes and closes:
```
{select TABLE_name as TableName, Column_Name as ColumnName, Data_Type as Datatype, Character_Maximum_Length as CharacterMaximumLength from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = $$TABLE-NAME$$}
```

[7:40:15](#fXnuh8d2b0iVS211rXR_YWuiKDooi8oOdx3dqg_vo9U) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have a bug, confirmed in the latest version I have just downloaded. If I write a query with this malformed where clause (a placeholder has not been replaced) the interpreter crashes and closes:
```
{
select 
  TABLE_name as TableName, 
  Column_Name as ColumnName, 
  Data_Type as Datatype, 
  Character_Maximum_Length as CharacterMaximumLength 
from INFORMATION_SCHEMA.COLUMNS 

where TABLE_NAME = $$TABLE-NAME$$
}
```

[10:50:34](#N7La3k0zfQwoLAoeJdPBxAthK9_BkvKEvItAqHZgXtg) <gurzgri>:
Please open a ticket with a minimal reproducible example and proper debug output of --debug compiled console.

[10:55:58](#6dZISsknMefQ73di6pKEtHuvlSLvhrP1pIlKaYHHa8M) <gurzgri>:
@GiuseppeChillemi  The `statement/state/columns` block keeps an internal copy of such information with layout as defined from https://github.com/gurzgri/red/blob/3289753aef4a15f7bdc9e3e9092ca40bd9ab15c5/environment/schemes/odbc.reds#L2738 on. Or consider having a look into docs, there are dedicated means for such things.

## 14-Jul-2022

[9:30:49](#S44DLNR7HpIALzisGKwAo72Rq7LLYEaPDkaCxy3stGs) <GiuseppeChillemi (GiuseppeChillemi)>:
I have an error on insert, here is the issue I have opened: https://github.com/gurzgri/red/issues/6




[19:40:25](#Faxtj_6yhB7WoRRRyjeiPCrHT78wt7IaOFhnrV5QXD4) <gurzgri>:
@GiuseppeChillemi No. You do not have an error on `insert` there. You have an error on `copy` there. Which is expected and fully legit: First you manipulate data with an SQL `INSERT` statement and throw away / ignore the result `insert` returns for that (the number of rows inserted). Then you immediatly try to fetch rows with `copy` without having queried for any with an SQL `SELECT` statement.  Hence: invalid cursor state.

[19:42:49](#JzvelgMzl_P7bS36m_tj_URJ13c1_HbT7B_-EKRPFtc) <gurzgri>:
* @GiuseppeChillemi No. You do not have an error on `insert` there. You have an error on `copy` there. Which is expected and fully legit: First you manipulate data with an SQL `INSERT` statement and throw away / ignore the result `insert` returns for that (the number of rows inserted). Then you immediatly try to fetch rows with `copy` without having queried for any with an SQL `SELECT` statement first.  Hence: invalid cursor state.

[21:12:12](#UzfsYuDQYI8l6wtZYnxP58ukxYI4MXYQYDEjNG_S3Hs) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri Thank you, here is another problem, the one I have talked to you some time ago. You shuld use same table and seme code bu just only `insert`

https://github.com/gurzgri/red/issues/7


[22:03:24](#_iVke706kxm8Sl43_9veRqbSWS56zgFKjXlSMIWQVck) <gurzgri>:
@GiuseppeChillemi But isn't `INSERT INTO xeventslog (type) VALUES ("Record")` just [invalid SQL](https://stackoverflow.com/questions/1992314/what-is-the-difference-between-single-and-double-quotes-in-sql)?

[22:12:28](#JUPFCmxPGcEseWgJvou_FY89uDMXEe6OhIMEoyHObWE) <GiuseppeChillemi (GiuseppeChillemi)>:
Yes, it is on purpose

[22:13:08](#ZbvVj4zMHJy7aF9fgDLfBSrKMFRlW7XCPBMjvmqVvQw) <GiuseppeChillemi (GiuseppeChillemi)>:
It was and error in my conversion code this malformed sql let Red crash

[22:14:15](#y3jejlR1pW0RourLxGuYJ5DuJ0rqF1m_Hem1TCcJO1g) <gurzgri>:
I see no crash. It throws an error. You even cited it: `*** Script Error: ODBC error`.

[22:14:45](#QfQJrP9loRM9yx9Dz-Pl37GG2dT-sQbr0_KxKpdrSVo) <GiuseppeChillemi (GiuseppeChillemi)>:
Here the GUI console closes

[22:14:58](#Zu2TdtT4Acf_Wg5Gsc8NJPyoREnXKH0GlYDKHvzOnOA) <GiuseppeChillemi (GiuseppeChillemi)>:
I have forgot to wite this

[22:15:05](#BmIZCh4sIZI-o_qPxEXT174Ck3JwDVpJ5v17e4mH4sA) <GiuseppeChillemi (GiuseppeChillemi)>:
*write

[22:15:22](#Y7vhkKR8zarJdmj09xJa5Wy_Ungr0Y6zQpnLidsnTns) <GiuseppeChillemi (GiuseppeChillemi)>:
*forgotten

[22:15:31](#gX2nrbWo_xk_9BIJL-xttZSmo_fqQZp-vfV9GeyBr60) <gurzgri>:
You even "forgot" to provide the code which is failing.

[22:16:24](#aeFLQJROgrH-KSHulNlvy_SGfBUTdJ9tNM030u6JC84) <GiuseppeChillemi (GiuseppeChillemi)>:
I have writte it is the same of issue #6 but just the insert

[22:16:42](#YgSQ3bXuZFin8Xwpe3ObRRbQb8grlDX89ud85bwIqAU) <GiuseppeChillemi (GiuseppeChillemi)>:
No copy and subsequent code

[22:17:56](#aFUfKBWfS7NIvehGhbdXAl9kNtYCBoQYGV-seUKlL20) <gurzgri>:
It's just that I can't read minds. Especially not yours, it seems ;^)

[22:21:29](#QaePf4kStwi1PslAz5fQJoY2XM4gQyTA2u0YSUuy5J4) <GiuseppeChillemi (GiuseppeChillemi)>:
OMG I am going in front of my pc to correct my disasters

[22:26:17](#RVIf4OecQnsahS9evske7Md83lGd_H31HQ5fpezN-ow) <GiuseppeChillemi (GiuseppeChillemi)>:
The code is the following:

```
the-query: {insert into xeventslog (type) values ("Record")}
st: open cn: switch 'rd con 
insert st the-query
```

This crashes the GUI-Console.

But also this query:
```
the-query: {insert into xeventslog (type) values ("Record")}
```

Or a simple:
```
the-query: {select * from xeventslog with $$condition$$}
```


[22:26:56](#ruWRMoGhOHr2H11FSqc4O5of1Y4BrryomI-nkFTWMgY) <GiuseppeChillemi (GiuseppeChillemi)>:
* The code is the following:

```
the-query: {insert into xeventslog (type) values ("Record")}
st: open cn: switch 'rd con 
insert st the-query
```

This crashes the GUI-Console.

But also this query:
```
the-query: {insert into xeventslog (type) values ("Record")}
```

Or a simple:
```
the-query: {select * from xeventslog where$$condition$$}
```


[22:27:03](#sM9dLc0ib9mMpWGOOVSZkUUl8fYnZkF8Gf-9o93cofU) <GiuseppeChillemi (GiuseppeChillemi)>:
* The code is the following:

```
the-query: {insert into xeventslog (type) values ("Record")}
st: open cn: switch 'rd con 
insert st the-query
```

This crashes the GUI-Console.

But also this query:
```
the-query: {insert into xeventslog (type) values ("Record")}
```

Or a simple:
```
the-query: {select * from xeventslog where $$condition$$}
```


[22:27:11](#rCW1rXCLsCQvlpd_V1LCS9stZjdGJpxft9tKVXwIfrQ) <GiuseppeChillemi (GiuseppeChillemi)>:
Any query with an error inside, crashes RED

[22:30:28](#IS8tQTDNlEnT10oJNSbpV9rTium23mTj8ryC2CD7WXQ) <GiuseppeChillemi (GiuseppeChillemi)>:
* The code is the following:

```
the-query: {insert into xeventslog (type) values ("Record")}
st: open cn: switch 'rd con 
insert st the-query
```

This crashes the GUI-Console.

But also this query:
```
the-query: {insert into xeventslog (type) values ("Record")}
```


[22:30:41](#lE5Ig2GVBtW5l8z_VhlJIGT1_vzKNsVgrHdJgjfE_Hk) <GiuseppeChillemi (GiuseppeChillemi)>:
* The code is the following:

```
the-query: {insert into xeventslog (type) values ("Record")}
st: open cn: switch 'rd con 
insert st the-query
```

This crashes the GUI-Console.

But also this query:
```
the-query: {insert into xeventslog (type) values ($$Record$$)}
```


[22:31:03](#o7m-dBrCCuODJI2ehse5d9A4-u51Y8wm-MsyauyyEWg) <GiuseppeChillemi (GiuseppeChillemi)>:
* This kind of query, crashes RED

[22:31:13](#U1tGKo_gevrgCdksXHaCGpAbiTNbzcxmLdWcL82srh4) <GiuseppeChillemi (GiuseppeChillemi)>:
* This kind of query, crashes RED (Edited)

[22:31:24](#p69wP7JFGWmttVU3sZPqyx2PANK1Ylt8y_T3q9VoW0I) <GiuseppeChillemi (GiuseppeChillemi)>:
* This kind of query, crashes RED (EDITED)

[22:37:38](#nI8zNE7Mq7L7expH3UxwUdr_YNYHQOOg5QCf26Gt-2A) <gurzgri>:
Is that `$$`-quoting a thing with SQL Server or is it something you‘ve invented? Never came across that so far.

[22:45:03](#4oHU6rdvECpMcsNsZswj6SfbXz4zaGoaE1RsT45eaUU) <GiuseppeChillemi (GiuseppeChillemi)>:
I use a `$$` as delimiters for placeholders.  The word in the middle and placeholder are replaced with the corresponding Red word. So I have discovered that if you make an error in the column name, then everything crashes.

[22:48:56](#Kwwl6m2RKpIuf8VY2o_QaoptwZNB8Svvizck9XTephI) <GiuseppeChillemi (GiuseppeChillemi)>:
I have created a function called `apply-values` so you can:

apply-values the-string make object! [record: "Record type 22"] so the word `record` in string and its delimiters is replaced with the content of the word `record` in the context. In this situation the string would be converted to :

`the-query: {insert into xeventslog (type) values ('Record type 22')}`


[22:49:37](#e1L1xzPnG8dD3wHH8pVC9YhLOxd9J8M5X6nnfiVcGWU) <GiuseppeChillemi (GiuseppeChillemi)>:
* I use a `$$` as delimiters for placeholders.  The word in the middle and placeholder is replaced with the corresponding Red word. So I have discovered that if you make an error in the column name, then everything crashes.

[22:50:38](#ls5XQoYkEMC9m40_-yjIRuAAp1pEuHOLBG5nHi-xB-k) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have created a function called `apply-values` so you can:
```
apply-values the-string make object! [record: "Record type 22"] 
```
so  the word `record` in string and its delimiters is replaced with the content of the word `record` in the context. In this situation the string would be converted to :

`the-query: {insert into xeventslog (type) values ('Record type 22')}`


[22:50:55](#gSffIlAXbe-J5aLU5leyGM919oo_BctsVME13zXdkIo) <GiuseppeChillemi (GiuseppeChillemi)>:
* I have created a function called `apply-values` so you can:
```
apply-values the-string make object! [record: "Record type 22"] 
```
so  the word `record` in string and its delimiters is replaced with the content of the word `record` in the context. In this situation the string would be converted to :
```
the-query: {insert into xeventslog (type) values ('Record type 22')}`
```

[23:22:00](#S_uub196bDr09zO4Hr5C1EzfLYmTLvv-FgTUN_-ltig) <gurzgri>:
@GiuseppeChillemi With SQLite I get 
```Red
>> insert chinook {insert into Genre (GenreId, Name) values (99, $$Record$$)}
*** Script Error: ODBC error: ["HY000" 1 "parameter marker count incorrect (1)"]
```

in GUI console. `"Record"` it inserted as if I'd given it as `'Record'`.
iWith Postgress I get
```Red
>> insert depot {insert into publishers (publisher_id, name) values ('bad0bad0bad0', "Record")}
*** Script Error: ODBC error: ["42703" 1 {ERROR: column "Record" does not exist;^/Error while preparing parame
```

in GUI console. `$$Record$$` it inserted as if I'd given it as `'Record'`.

None of these crashed the console.

[23:22:55](#9cIqcoHgxgaeI2OwxEBLstO1znvelSwWTEgfqzusnkk) <gurzgri>:
* @GiuseppeChillemi With SQLite I get 
```Red
>> insert chinook {insert into Genre (GenreId, Name) values (99, $$Record$$)}
*** Script Error: ODBC error: ["HY000" 1 "parameter marker count incorrect (1)"]
```

in GUI console. `"Record"` it inserted as if I'd given it as `'Record'`.
With Postgress I get
```Red
>> insert depot {insert into publishers (publisher_id, name) values ('bad0bad0bad0', "Record")}
*** Script Error: ODBC error: ["42703" 1 {ERROR: column "Record" does not exist;^/Error while preparing parame
```

in GUI console. `$$Record$$` it inserted as if I'd given it as `'Record'`.

None of these crashed the console.

[23:29:09](#fa9O1sNB84QXArv4jVr2ttRlrxMxCAIWbxqI-dHEYjs) <GiuseppeChillemi (GiuseppeChillemi)>:
SQL Server here...

[23:29:47](#xSobAvM_-xHVbP2lf4AZx-hsXnVaF7VL3nW6yY4tyIA) <GiuseppeChillemi (GiuseppeChillemi)>:
I will investigate more and report the errors again.

## 15-Jul-2022

[22:21:16](#GWivyK7lSPDyEy9mSb_u8JU1t7Zt1o6qz7-L9bKUC6Y) <GiuseppeChillemi (GiuseppeChillemi)>:
@gurzgri I apologize if I ask it again but I have had no answer. Does you version of Red includes I/O?

## 17-Jul-2022

[14:36:22](#PSYOSsBsO5vNhGInzk3FoiOp9tSXvQT201TwJyln9nQ) <gurzgri>:
No.

[18:35:23](#2Lh4fs9YXvEd1zqB8uquh0I0WYnEAMPbjzpL9nz7S5Y) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, let's wait for the Red team to merge it.

## 29-Jul-2022

[7:40:31](#DR8EHEE5guGDFZAUy9bUjQHbCqs7RC2I7lQjFjyRMdk) <bubnenkoff (Dmitry Bubnenkov)>:
Could you update your branch with latest red branch. There was import fix with `unique` that  I heavy use in my project.

## 1-Aug-2022

[14:33:05](#YjPi_xCI8Q22PgNh6xw1p56FdIVnLQudVMePAKVenps) <gurzgri>:
Did so.

[15:59:05](#bo9cVvdHodBd04haZBNS-cYgfKC4nnRGsw0qy4G2TA0) <GiuseppeChillemi (GiuseppeChillemi)>:
Nice, I needed it too.

## 15-Aug-2022

[11:59:35](#y1LO9O-vxajuQw3CzmEGeyEjOh97yRNJzX3ZtN6xFBE) <bubnenkoff (Dmitry Bubnenkov)>:
Nice, I needed it too.

[11:59:50](#Xh1R04Kldy64zSCHPnpY3223jKPKJj5_olyPQdm7phE) <bubnenkoff (Dmitry Bubnenkov)>:
* @gurzgri I got very strange error message:
```
07002 32 The # of IPD parameters 1 < 16 the # of parameter markers
Error:07002 32 The # of IPD parameters 1 < 16 the # of parameter markers
```

## 20-Aug-2022

[18:22:36](#TRkV8_v27fENcVQg7K1FoMkZuIWr6Ga-wcC9MnqsAKA) <GiuseppeChillemi (GiuseppeChillemi)>:
If I make a select query of a table which has no unique IDs for rows, is there a way to get a sql Internal one, so I can write back to the same read rows, the modification I have made to them in Red?

[19:38:45](#4PfPBfRAc8GGxGlHeG6h-hwY9vEq6YguX-AkSrkdQ58) <gurzgri>:
That's `change statement [bookmarks?: on]`. It retrieves the rows with an additional first column being a bookmark column by which the db server can track/identify rows without it being part of the dable itself. 

The scheme however for now supports such bookmarks with SELECT statements only, not with INSERT, UPDATE, DELETE statements. That's because ODBC (the API, not the scheme) uses bookmarks in a totally different way than normal statement execution.

[19:39:17](#Xlcdf7r0TVfO25spa0d1Dw1EWYwxkLOtUxDI47sDt54) <gurzgri>:
* That's `change statement [bookmarks?: on]`. It retrieves the rows with an additional first column being a bookmark column by which the db server can track/identify rows without them being part of the table themself. 

The scheme however for now supports such bookmarks with SELECT statements only, not with INSERT, UPDATE, DELETE statements. That's because ODBC (the API, not the scheme) uses bookmarks in a totally different way than normal statement execution.

## 22-Sep-2022

[15:25:29](#sbHO3auvmJcFm-AwowbcFPoBo4fZrtAnRZBhSSPaBgw) <bubnenkoff (Dmitry Bubnenkov)>:
* That's `change statement [bookmarks?: on]`. It retrieves the rows with an additional first column being a bookmark column by which the db server can track/identify rows without them being part of the table themself. 

The scheme however for now supports such bookmarks with SELECT statements only, not with INSERT, UPDATE, DELETE statements. That's because ODBC (the API, not the scheme) uses bookmarks in a totally different way than normal statement execution.

[15:25:37](#BW2zBdAfk94vmjkrSyqX0opJzfJoL_fWRjZ4UfHXOMM) <bubnenkoff (Dmitry Bubnenkov)>:
* @gurzgri hi! I am getting an error:
```
#(
    org_reg_num: [keys: [reg_number cons_registry_number org_full_name org_short_name org_inn] values: [["03203000178" "05320547" none "Some text" none] ["03482000044" none {Some text} none none] ["03112000217" "922Э2430" {Some other text} "And another Text" none]]]
)
-------------
Generation INSERT STATEMENT
make error! [
    code: 317
    type: 'script
    id: 'not-same-type
    arg1: none
    arg2: none
    arg3: none
    near: [args]
    where: 'do
    stack: 87287212
]
Process stopped with an error: Can't complete insert request. App quit! Error:none
```

What can be reason of it? 

[15:31:23](#rlEjVdANT_NlCiFlY8_8CwsIHbZVgbw5vOaYAcBvXCU) <bubnenkoff (Dmitry Bubnenkov)>:
* @gurzgri hi! I am getting an error:
```
#(
    org_reg_num: [keys: [reg_number cons_registry_number org_full_name org_short_name org_inn] values: [["03203000178" "05320547" none "Some text" none] ["03482000044" none {Some text} none none] ["03112000217" "922Э2430" {Some other text} "And another Text" none]]]
)
-------------
Generation INSERT STATEMENT
make error! [
    code: 317
    type: 'script
    id: 'not-same-type
    arg1: none
    arg2: none
    arg3: none
    near: [args]
    where: 'do
    stack: 87287212
]
Process stopped with an error: Can't complete insert request. App quit! Error:none
```

What can be reason of it? 

[15:35:02](#EQbs251Pqujn1VpxWAdYnRcuvWQoWH457uZK0qOL4lk) <bubnenkoff (Dmitry Bubnenkov)>:
* @gurzgri hi! I am getting an error:
```
#(
    org_reg_num: [keys: [reg_number cons_registry_number org_full_name org_short_name org_inn] values: [["03203000178" "05320547" none "Some text" none] ["03482000044" none {Some text} none none] ["03112000217" "922Э2430" {Some other text} "And another Text" none]]]
)
-------------
Generation INSERT STATEMENT
make error! [
    code: 317
    type: 'script
    id: 'not-same-type
    arg1: none
    arg2: none
    arg3: none
    near: [args]
    where: 'do
    stack: 87287212
]
Process stopped with an error: Can't complete insert request. App quit! Error:none
```

What can be reason of it? 

## 4-Oct-2022

[8:00:02](#wdIldIx4BcO8U8ebqfrUsn2XXsa3jEfu5QYXYawEJz4) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri  Could you do merge with latest Red branch? There was few important fixes 

[9:46:06](#XZ6BPHyRCYSVNC0ymFjG7YAOSuiO5ygrCLbqrrUJRjs) <bubnenkoff (Dmitry Bubnenkov)>:
oh please wait before regression reported in main chat will be fixed

## 10-Oct-2022

[13:18:17](#syggJhY5NcyYnhh_of2ErnECFeY3eWSQipd_XH4EJTI) <bubnenkoff (Dmitry Bubnenkov)>:
oh please wait before regression reported in main chat will be fixed

[13:27:39](#k483epcrJ1bn3WJRywTQy-pQ7U_P40R49Jxmf0TwFeM) <bubnenkoff (Dmitry Bubnenkov)>:
oh please wait before regression reported in main chat will be fixed

[13:30:52](#atX2-mW96fZ2TWqpQBF8vF8OolSvNEOIqgRKf_i2FA4) <bubnenkoff (Dmitry Bubnenkov)>:
oh please wait before regression reported in main chat will be fixed

[13:32:11](#i9UBfJkxUVxU9fUErthCV_3ohbpV-fS0zhXGuHJaVIg) <bubnenkoff (Dmitry Bubnenkov)>:
oh please wait before regression reported in main chat will be fixed

[14:34:14](#I__oczvRLWxSCAfWM8-cq9uCAU4TAWCw0fcapaqjwtk) <bubnenkoff (Dmitry Bubnenkov)>:
oh please wait before regression reported in main chat will be fixed

## 11-Oct-2022

[7:42:42](#VbrgAr7vZifJQGc_X86wHu27SQMVt1tWQCnUxutb9SA) <bubnenkoff (Dmitry Bubnenkov)>:
Can't build the latest version from git.
After cloning repo:
```
do/args %red.r "-r %environment/console/CLI/console.red"
```
then:
```
>> do/args %red.r "-c -e %/d/code/zakupki/XMLParser/XMLParser.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)
Script: "Get git version data" (none)

-=== Red Compiler 0.6.4 ===-

Compiling d:\code\zakupki\XMLParser\XMLParser.red ...
Compiling libRedRT...
...compilation time : 1429 ms

Compiling to native code...
Script: "Red/System PE/COFF format emitter" (none)
...compilation time : 47453 ms
...global words     : 22935 (69.72%)
...linking time     : 545 ms
...output file size : 1769472 bytes
...output file      : C:\odbc-new\libRedRT.dll

...compilation time : 1248 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined symbol: red/string/load-in
*** in file: %/C/odbc-new/environment/schemes/odbc.reds
*** in function: exec/odbc/diagnose-error
*** at line: 2969
*** near: [
    string/load-in as c-string! state 5 errors UTF-16LE
    integer/make-in
]
```

[7:51:50](#tSte1Sahn3Ahj1qzLi1eDrHoGuYvrlK2CmQUtqNSQos) <bubnenkoff (Dmitry Bubnenkov)>:
Can't build the latest version from git.
After cloning repo:
```
do/args %red.r "-r %environment/console/CLI/console.red"
```
then:
```
>> do/args %red.r "-c -e %/d/code/zakupki/XMLParser/XMLParser.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)
Script: "Get git version data" (none)

-=== Red Compiler 0.6.4 ===-

Compiling d:\code\zakupki\XMLParser\XMLParser.red ...
Compiling libRedRT...
...compilation time : 1429 ms

Compiling to native code...
Script: "Red/System PE/COFF format emitter" (none)
...compilation time : 47453 ms
...global words     : 22935 (69.72%)
...linking time     : 545 ms
...output file size : 1769472 bytes
...output file      : C:\odbc-new\libRedRT.dll

...compilation time : 1248 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined symbol: red/string/load-in
*** in file: %/C/odbc-new/environment/schemes/odbc.reds
*** in function: exec/odbc/diagnose-error
*** at line: 2969
*** near: [
    string/load-in as c-string! state 5 errors UTF-16LE
    integer/make-in
]
```

[8:06:27](#ulkUIRDUvDVHTogwNi0uk3SLW_fJau1loA-SS9Wip-s) <bubnenkoff (Dmitry Bubnenkov)>:
Can't build the latest version from git.
After cloning repo:
```
do/args %red.r "-r %environment/console/CLI/console.red"
```
then:
```
>> do/args %red.r "-c -e %/d/code/zakupki/XMLParser/XMLParser.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)
Script: "Get git version data" (none)

-=== Red Compiler 0.6.4 ===-

Compiling d:\code\zakupki\XMLParser\XMLParser.red ...
Compiling libRedRT...
...compilation time : 1429 ms

Compiling to native code...
Script: "Red/System PE/COFF format emitter" (none)
...compilation time : 47453 ms
...global words     : 22935 (69.72%)
...linking time     : 545 ms
...output file size : 1769472 bytes
...output file      : C:\odbc-new\libRedRT.dll

...compilation time : 1248 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined symbol: red/string/load-in
*** in file: %/C/odbc-new/environment/schemes/odbc.reds
*** in function: exec/odbc/diagnose-error
*** at line: 2969
*** near: [
    string/load-in as c-string! state 5 errors UTF-16LE
    integer/make-in
]
```

[8:06:57](#Xv1UDpVrgZXIn2Z3tIXV4JPB9puxH2oA7mip3KIh_N0) <bubnenkoff (Dmitry Bubnenkov)>:
* After recompiling console I am seeing PG driver in list. It strange that it was not there before (probably ODBC should be installed before compiling red-odbc?):
```
probe system/schemes/odbc/state/drivers
[
    {Driver da Microsoft para arquivos texto (*.txt; *.csv)} #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.,*.asc,*.csv,*.tab,*.txt,*.csv"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Driver do Microsoft Access (*.mdb)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.mdb"
        "FileUsage" "2"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Driver do Microsoft dBase (*.dbf)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.dbf,*.ndx,*.mdx"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Driver do Microsoft Excel(*.xls)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.xls"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Driver do Microsoft Paradox (*.db )" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.db"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Microsoft Access Driver (*.mdb)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.mdb"
        "FileUsage" "2"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Microsoft Access-Treiber (*.mdb)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.mdb"
        "FileUsage" "2"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Microsoft dBase Driver (*.dbf)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.dbf,*.ndx,*.mdx"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Microsoft dBase-Treiber (*.dbf)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.dbf,*.ndx,*.mdx"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Microsoft Excel Driver (*.xls)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.xls"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Microsoft Excel-Treiber (*.xls)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.xls"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Microsoft ODBC for Oracle" #(
        "APILevel" "1"
        "ConnectFunctions" "YYY"
        "CPTimeout" "120"
        "DriverODBCVer" "02.50"
        "FileUsage" "0"
        "SQLLevel" "1"
        "UsageCount" "1"
    )
    "Microsoft Paradox Driver (*.db )" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.db"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Microsoft Paradox-Treiber (*.db )" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.db"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Microsoft Text Driver (*.txt; *.csv)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.,*.asc,*.csv,*.tab,*.txt,*.csv"
        "FileUsage" "1"
        "SQLLevel" "0"
        "UsageCount" "1"
    )
    "Microsoft Text-Treiber (*.txt; *.csv)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "02.50"
        "FileExtns" "*.,*.asc,*.csv,*.tab,*.txt,*.csv"
        "FileUsage" "1"
        "SQLLevel" "0"
  ``` 

[8:07:52](#rxnNKmizmloFqDfiCLqNcFwF9xMw2mFRp8XOWpzxpic) <bubnenkoff (Dmitry Bubnenkov)>:
* After recompiling console I am seeing PG driver in list. It strange that it was not there before (probably ODBC should be installed before compiling red-odbc?):
```
probe system/schemes/odbc/state/drivers
... some lines skipped
    "SQL Server" #(
        "APILevel" "2"
        "ConnectFunctions" "YYY"
        "CPTimeout" "60"
        "DriverODBCVer" "03.50"
        "FileUsage" "0"
        "SQLLevel" "1"
        "UsageCount" "1"
    )
    "PostgreSQL ODBC Driver(ANSI)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "13.00.0000"
        "FileUsage" "0"
        "SQLLevel" "1"
    )
    "PostgreSQL ODBC Driver(UNICODE)" #(
        "APILevel" "1"
        "ConnectFunctions" "YYN"
        "DriverODBCVer" "13.00.0000"
        "FileUsage" "0"
        "SQLLevel" "1"
    )
]
  ``` 

[8:10:56](#_R_s1zHwDmeeAHdLneCGr-nrnb0ICvcmmKiToAOxiVw) <bubnenkoff (Dmitry Bubnenkov)>:
it's very strange. Error above is disrepair if not close Rebol console and run in it:
```
do/args %red.r "-r %environment/console/CLI/console.red"
do/args %red.r "-c -e  %/d/code/zakupki/XMLParser/XMLParser.r
```
If close Rebol console after first command and then open again and run second command I am getting an error above


[8:11:04](#JPUlpxpzes3xcycy3DXei0ffwWNXo1G50edZB1DRZn4) <bubnenkoff (Dmitry Bubnenkov)>:
* it's very strange. Error above is disrepair if not close Rebol console and run in it:
```
do/args %red.r "-r %environment/console/CLI/console.red"
do/args %red.r "-c -e  %/d/code/zakupki/XMLParser/XMLParser.red
```
If close Rebol console after first command and then open again and run second command I am getting an error above


[8:15:16](#fZ0AcywqGA7d7YUAVlA-gYoWxkUa4dU764N0oPaMOJc) <bubnenkoff (Dmitry Bubnenkov)>:
But I still can't connect to DB. I tried to un next code in red-odbc console.
```
>> connection: open make port! [
[        scheme: 'odbc
[        target: "driver={PostgreSQL Unicode};server=127.0.0.1;port=5432;database=fz44;uid=postgres;pwd=12345"
[    ]
*** Script Error: ODBC error: ["IM002" 0 {[Microsoft][ ODBC] Data source name not found and no default driver specified
*** Where: either
*** Near : {driver={PostgreSQL Unicode};server=127.0}
*** Stack:
```

Error message

[8:25:09](#YNQEORIEDc__k2NXRmK2XIfGTkvnF8O6sqhGITeRK1k) <bubnenkoff (Dmitry Bubnenkov)>:
I have found solution.
The name PostgreSQL driver on different configurations could be different.
To check it you need to open ODBC driver manager.
For example for my new PC name become: ```PostgreSQL ODBC Driver(UNICODE)```

So this code with fixed name work:
```
connection: open make port! [
    scheme: 'odbc
    target: "driver={PostgreSQL ODBC Driver(UNICODE)};server=127.0.0.1;port=5432;database=fz44;uid=postgres;pwd=Infinity8"
]
```

[8:25:17](#9R098qrqR24IGgKgGQ5wVyFikZ-OJj9pnfMBkNxvd9E) <bubnenkoff (Dmitry Bubnenkov)>:
* I have found solution.
The name PostgreSQL driver on different configurations could be different.
To check it you need to open ODBC driver manager.
For example for my new PC name become: ```PostgreSQL ODBC Driver(UNICODE)```

So this code with fixed name work:
```
connection: open make port! [
    scheme: 'odbc
    target: "driver={PostgreSQL ODBC Driver(UNICODE)};server=127.0.0.1;port=5432;database=fz44;uid=postgres;pwd=12345"
]
```

[13:20:34](#JthimxOEEmRjn5SO2mamChGKnDvbDNI41BdeMEqqdWs) <gurzgri>:
@bubnenkoff Re: "To check it you need to open ODBC driver manager." No, nigh impossible to believe that `system/schemes/odbc/state/drivers` returns a driver name other than the one listed in the admin panel and the one required to connect. And impossible to tell, too, because it looks as if by now the original output (which was incomplete anyways) has been deleted.

[13:21:19](#XGi3_9Spk7jCN4rxJXbzlaOcsLtPsR6cyr9WWFZl_3w) <gurzgri>:
* @bubnenkoff Re: "To check it you need to open ODBC driver manager." No, nigh impossible to believe that `system/schemes/odbc/state/drivers` returns a driver name other than the one listed in the admin panel and the one required to connect. And impossible to tell, too, because it looks as if by now the original output (which was posted here only incomplete anyways) has been deleted.

## 11-Dec-2022

[12:02:02](#PSiJ7N1ggWRlwjTGJfvuY66ebW3VRiIKxP1lUR0eK-w) <bubnenkoff (Dmitry Bubnenkov)>:
hi! When I am executing count(*) request I am getting answer in nested block like: `[[123]]`
Is there any way to get result without nesting?

## 12-Dec-2022

[19:28:21](#g_akwnl6AfQidIrCTygVtWJ51DdQ31_aP_O4RjplCd4) <gurzgri>:
Yes, there is. I'm sure you'll find something in the [documentation](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md).

## 13-Dec-2022

[7:47:21](#TmnEywevkikHScUWh295e01F0SQ9Pn9qM_A6PtldgYo) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri could you prompt place? I really can't find it

[11:21:49](#6TQA_0H1jh-7BWJ_beQdf5FdzGhpsWat5u6UaTUF4g8) <gurzgri>:
So you don‘t want nested blocks, fine. What antonyms for „nested“ can you think of and with these, which hits can you obtain with a `ctrl+f` search in the docs?

[15:02:22](#YJVSjRlMW3zTi0wOlI5aK-rpW-Z3RUVJd9j5qqy6iuo) <bubnenkoff (Dmitry Bubnenkov)>:
Oh I understood! When I read it I did not understand idea of `flat row`
Am I right that it's setting on connection level and there is no way to get flatten result only for one type of query?

[17:03:38](#gHz0hVr7ADwujAH6WkYC7J9Rpc4tQyNSSL-SlKhElKY) <gurzgri>:
> To retrieve results in flat fashion, on scheme, connection or statement level set ...

So, no: It is a setting on either i) whole scheme, ii) connection, iii) statement level.

But by "type of query" you're probably asking for flat retrieval for a "count" query and block retrievel (block of row-blocks) for generic result-set returning queries. But that's not how ODBC works. A "count query" is a result-set returning '`SELECT` query just as good as any other. Only for  `INSERT`, `UPDATE`, `DELETE` queries the  number of affected rows is returned as an integer.

## 20-Dec-2022

[6:41:45](#QlfDc0rkd9UPCFupD0DwLdiz7CKramSYTs7i9ueSdxg) <bubnenkoff (Dmitry Bubnenkov)>:
@gurzgri thanks for merging! I just wanted to ask about it)

## 24-Dec-2022

[6:32:37](#Vt5ZJkHKDS4WY6j8Civ99x2Hh3bk-ll-Syjs8luBSDQ) <bubnenkoff (Dmitry Bubnenkov)>:
Is it possible to use ODBC driver in Mac/Linux?

[6:32:45](#a10cDSsP2E86ZIceF59uOoJYdCeW4FZfKGqUSEEHGqk) <bubnenkoff (Dmitry Bubnenkov)>:
* Is it possible to use ODBC driver on Mac/Linux?

[11:27:14](#Q2NdBVezHWvgijGY9N2uXcczS82jOXIOfFeOJXog4Iw) <gurzgri>:
@bubnenkoff  No, that is not supported yet (btw, as per ↑ [documentation](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md#:~:text=The%20ODBC%20scheme%20is%20currently%20available%20only%20for%20the%20Windows%20platform%2C%20other%20platforms%20may%20follow.), again). I don't think it would require too much work, but currently I have access to neither Mac nor Linux machines. It for sure would be a fun experience to do so, but nothing I plan to address before Red reaches 0.7 or even 1.0 with a stable module system allowing for custom modules. Until modules, ports and I/O stuff settles, further ODBC scheme development is on hold.  

## 2-Feb-2023

[8:17:57](#kBbRfmUgi63IL4hB9YJST6KtcGB3tZETygDa8hlTlyw) <bubnenkoff (Dmitry Bubnenkov)>:
Hi, @gurzgri how to check status of connection? I need prevent execution statement if connection was not opened?
```
odbc-count-request: function [] [
    insert xml-files-statement count-of-unprocessed-files-sql-query ; need prevent execution if connection not opened 
    ; ....
    ] 
```

[8:23:13](#VwNCLWD0iTU7X9Y7OIxE8ScGaLwDso2k3yDXtehQfW0) <bubnenkoff (Dmitry Bubnenkov)>:
hm... possible solution is:
```
    if error? try [
        insert xml-files-statement count-of-unprocessed-files-sql-query 
    ] [ 
        print "some error"
        exit
    ]
```

[11:51:58](#5ygfK0NfB93ZTi5LISuIAz7N6bLxWqImtQf-N3swkIg) <gurzgri>:
That is the *only* viable solution. There are means to check if a connection is alive with

```Red
>> select query connection "connection-dead"   ;== false
```

and without a connection succesfully opened you wouldn't be able to open a statement.

But of course in the timespan between evaluation of this `query` expression and the consecutive `insert` expression anything might happen: Somewhere whole new universes might be born eventually. And here, the connection might get lost in between due to networking problems and such.

The only way to know if executing a statement has failed is testing if executing has thrown an error or not. The future is predictable only in hindsight. 

## 5-Feb-2023

[15:03:26](#R5wbTl23OdVzUYRhCtongoqjRAnd8DomCBISF4ZeyO4) <ProDimSum (ProDimSum)>:
```Red [
    Title: "try crud"
    Needs: 'odbc
    
    ; Open Connection
    conn: open odbc://db.db
    
    ; Read table
    data: conn "SELECT * FROM users"
    view data
    
    ; Close Connection
    close conn
]```

[15:04:12](#EB8i-zX_hLXq86t8j7lzom6jvnGFB9qrG5pGSr7PF_I) <ProDimSum (ProDimSum)>:
can not read table from sqlite database

[15:56:56](#iKL-VP-A_eK0Av0CNKBWFl7deMC-zvb59O9XWj-QyJg) <ProDimSum (ProDimSum)>:
@gurzgri 
> @toomasv Finally! By casting some pagan magic spells from the Ancient Book of Kernel the 32th instead of calling upon Malloc from the Depth of Red/System I finally unleashed the ODBC Powers of SQLite thru the Aethers of the SQLite ODBC Driver.
> 
> In other words: Now even SQLite / [SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) works ������ 
> 
> 

I installed this driver still can not read it.

[16:06:52](#GV1bT1ExTjyaLA1jYFj6PgBQLwvb8Tuvh31ta-YD71Q) <ProDimSum (ProDimSum)>:
```Red [
    Title: "try crud"
    Needs: 'odbc
    
    ; Open Connection
    connection: open odbc://db
    
    ; Read table
    data: connection "SELECT * FROM user"
    view data
    
    ; Close Connection
    close connection
]```

[16:19:50](#wULAsq4SzpNedO8OogPKzTe8eEIqnMD84XX8uPINOPg) <ProDimSum (ProDimSum)>:
do i have to import %odbc.red?

[22:29:22](#vVMWLd5aaajxexejTVPRdEJGSaNtCJ1SrwWVEuwL1hs) <gurzgri>:
@ProDimSum As Red user/custom modules aren't a thing yet and because of the ODBC scheme being dependent on Red/System code, it requires compiling. For now, you'll have the clone the repo https://github.com/gurzgri/red to your machine and compile yourself a ODBC enabled Red console or Red GUI console.

Once you've made it thru that step, using the scheme should feel pretty familier if you're used to REBOLs ODBC scheme. Make sure to study https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md though, there are some differences.

## 17-Feb-2023

[10:53:59](#8kziSmA9fzsqY48HGE-pXrvYUOAjrqJJBNb5HNFwr0Y) <bubnenkoff (Dmitry Bubnenkov)>:
@ProDimSum As Red user/custom modules aren't a thing yet and because of the ODBC scheme being dependent on Red/System code, it requires compiling. For now, you'll have the clone the repo https://github.com/gurzgri/red to your machine and compile yourself a ODBC enabled Red console or Red GUI console.

Once you've made it thru that step, using the scheme should feel pretty familier if you're used to REBOLs ODBC scheme. Make sure to study https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md though, there are some differences.

## 20-Feb-2023

[13:49:54](#BcNKpU_2Kr62_YHFhqBgWrZvZwdz9KOmTSlQN_FXdDM) <bubnenkoff (Dmitry Bubnenkov)>:
what is  right way to setting path to SQLite?
```
        sqlite-file: %/code/test/test_db.db

        connection: open odbc://db ; how this string should look like im my case?
```

[19:35:50](#RHBdtDpPpwVWd6w9iaskUPytlaTKILehexdd9PfZXxM) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov)  I have e.g. an ODBC DSN `chinook` set up in the ODBC datasource administration with database name `C:\Users\gurzgri\AppData\Roaming\DBeaverData\workspace6\.metadata\sample-database-sqlite-1\Chinook.db`, which is the path to where that sample database is located. In the same manner you should be able to provide the location using the [connection string syntax](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md#opening-connections) with likey the `database` parameter.

[19:38:15](#RUC3YUXJ2rfaHIih-ESu8m2WwvWXxi4R0wrIlbBPFP0) <gurzgri>:
 * bubnenkoff (Dmitry Bubnenkov)  I have e.g. an ODBC DSN `chinook` set up in the ODBC datasource administration with database name `C:\Users\gurzgri\AppData\Roaming\DBeaverData\workspace6\.metadata\sample-database-sqlite-1\Chinook.db`, which is the path to where that sample database is located. So I can connect with just `opend odbc://chinook`. But in the same manner you should be able to provide the location using the [connection string syntax](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md#opening-connections) with likey the `database` parameter.

[19:38:30](#fiZ_Y6ldeQfNf_P7-jS9QdwKho5QAQlxxJndksdAWGU) <gurzgri>:
 * bubnenkoff (Dmitry Bubnenkov)  I have e.g. an ODBC DSN `chinook` set up in the ODBC datasource administration with database name `C:\Users\gurzgri\AppData\Roaming\DBeaverData\workspace6\.metadata\sample-database-sqlite-1\Chinook.db`, which is the path to where that sample database is located. So I can connect with just `opend odbc://chinook`. But in the same manner you should be able to provide the location using the [connection string syntax](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md#opening-connections) with likey the `database=` parameter.

[19:48:36](#j0gknLFS2RpGMc2ytg5Yp8Bp5kvcVmVPJaBuvCSauKI) <gurzgri>:
 * bubnenkoff (Dmitry Bubnenkov)  I have e.g. an ODBC DSN `chinook` set up in the ODBC datasource administration with database name `C:\Users\gurzgri\AppData\Roaming\DBeaverData\workspace6\.metadata\sample-database-sqlite-1\Chinook.db`, which is the path to where that sample database is located. So I can connect with just `open odbc://chinook`. But in the same manner you should be able to provide the location using the [connection string syntax](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md#opening-connections) with likey the `database=` parameter.

## 21-Feb-2023

[7:46:10](#y--3wxHNBmur5yQpoka17mOYoxvVdheszppcSxiaBaM) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: could you add to docs an example, because it's not very clear how to connect to SQLite because 
```
target: "driver={<DRIVERNAME>};server=<IPADDRESS>;port=<PORT>;database=<DATABASE>;uid=<USER>;pwd=<PASS>"
```
if i right understand it's only: `database=<DATABASE>` needed

[8:11:50](#65HO0y6esDLvdIzekVSjAWqf5T_mAdxN4kiqQEjHx4I) <bubnenkoff (Dmitry Bubnenkov)>:
this connection syntax is work:
```
odbc-connection-string: "driver={SQLite3 ODBC Driver};database=test_db.db;"
```
I am able to get COUNT request work.
But on INSERT request I am getting error:
```
Generation ON CONFLICT DO request for table: contracts

*** Runtime Error 1: access violation
*** at: 64BC20E8h
```


[8:18:22](#JGxZ2wWry8bFC9DoEhtfvffMkIk19mmPeBPvfQa1KdY) <bubnenkoff (Dmitry Bubnenkov)>:
plain text request on which I am getting crush:
```

INSERT INTO notifications ("purchaseNumber", "isGOZ", "docPublishDate", "responsibleOrg_inn", "responsibleOrg_regNum", "responsibleOrg_kpp", "responsibleOrg_fullName", "responsibleOrg_postAddress", "responsibleOrg_factAddress", "contactPerson_lastName", "contactPerson_firstName", "contactPerson_middleName", "responsibleInfo_contactEMail", "responsibleInfo_contactPhone", "specializedOrg_fullName", "specializedOrg_postAddress", "specializedOrg_factAddress", "specializedOrg_INN", "specializedOrg_regNum", "responsibleRole", "placingWay_code", "placingWay_name", "etp_code", "etp_name", "etp_url", "procedureInfo_collecting_startDate", "procedureInfo_collecting_place", "procedureInfo_collecting_endDate", "procedureInfo_scoring_date", "procedureInfo_bidding_date", "region", "xml_path", "fz_name", "tag")
 VALUES ('0373100031922000521', NULL, '2022-10-01T00:00:13.307+03:00', '77334322', '03330319', '77331001', 'Company name, 'test', 'ДОМ 27', 'Тест', 'Александр', 'Александрович', 'Konakov@ixv.ru', '7-499-2379227', NULL, NULL, NULL, NULL, NULL, 'CU', 'OKP20', 'Открытый конкурс в электронной форме', 'ETP_EETP', 'АО «ЕЭТП»', 'http://roseltorg.ru', '2022-10-01T00:00:13+03:00', NULL, '2022-10-17T08:00:00+03:00', NULL, NULL, NULL, NULL, NULL, 'notifications')
 ON CONFLICT ("purchaseNumber")
 DO UPDATE SET "purchaseNumber" = EXCLUDED."purchaseNumber", "isGOZ" = EXCLUDED."isGOZ", "docPublishDate" = EXCLUDED."docPublishDate", "responsibleOrg_inn" = EXCLUDED."responsibleOrg_inn", "responsibleOrg_regNum" = EXCLUDED."responsibleOrg_regNum", "responsibleOrg_kpp" = EXCLUDED."responsibleOrg_kpp", "responsibleOrg_fullName" = EXCLUDED."responsibleOrg_fullName", "responsibleOrg_postAddress" = EXCLUDED."responsibleOrg_postAddress", "responsibleOrg_factAddress" = EXCLUDED."responsibleOrg_factAddress", "contactPerson_lastName" = EXCLUDED."contactPerson_lastName", "contactPerson_firstName" = EXCLUDED."contactPerson_firstName", "contactPerson_middleName" = EXCLUDED."contactPerson_middleName", "responsibleInfo_contactEMail" = EXCLUDED."responsibleInfo_contactEMail", "responsibleInfo_contactPhone" = EXCLUDED."responsibleInfo_contactPhone", "specializedOrg_fullName" = EXCLUDED."specializedOrg_fullName", "specializedOrg_postAddress" = EXCLUDED."specializedOrg_postAddress", "specializedOrg_factAddress" = EXCLUDED."specializedOrg_factAddress", "specializedOrg_INN" = EXCLUDED."specializedOrg_INN", "specializedOrg_regNum" = EXCLUDED."specializedOrg_regNum", "responsibleRole" = EXCLUDED."responsibleRole", "placingWay_code" = EXCLUDED."placingWay_code", "placingWay_name" = EXCLUDED."placingWay_name", "etp_code" = EXCLUDED."etp_code", "etp_name" = EXCLUDED."etp_name", "etp_url" = EXCLUDED."etp_url", "procedureInfo_collecting_startDate" = EXCLUDED."procedureInfo_collecting_startDate", "procedureInfo_collecting_place" = EXCLUDED."procedureInfo_collecting_place", "procedureInfo_collecting_endDate" = EXCLUDED."procedureInfo_collecting_endDate", "procedureInfo_scoring_date" = EXCLUDED."procedureInfo_scoring_date", "procedureInfo_bidding_date" = EXCLUDED."procedureInfo_bidding_date", "region" = EXCLUDED."region", "xml_path" = EXCLUDED."xml_path", "fz_name" = EXCLUDED."fz_name", "tag" = EXCLUDED."tag";
```

[14:14:17](#MHXaz3lefNiuQUiimksIyCohmFxZ-4TqMruO1pYmx3U) <gurzgri>:
Sorry, bubnenkoff (Dmitry Bubnenkov) , but I am not going down the route of trying to add documentation on how connection strings for specific databases/drivers need to be composed. That would be well out of scope for such an API documentation.

[14:21:20](#6T2EER7ioWqSkFIHA8POGJUs77v22wU4peYRVW9INBk) <gurzgri>:
The access violation of course is a problem with the scheme.  Please open a ticket for that problem. I don't think that I'm able to investigate and address that any time soon due to spare time constraints. However, if you like to invest some time in providing a minimal (and I am really talking "minimal" here) SQLite sample db and statement with just a handful columns and rows which you can share, that would help investigating.

[14:37:58](#LyY01bmEOTIwH1aVgnmWlqAGhYqAh5kU8s4cxIEtN1A) <bubnenkoff (Dmitry Bubnenkov)>:
Thanks! I will try to create reproducible example a little bit later 

[20:50:14](#PZoUhlktXYPeuDR1zB07dGxvbc9GLo3KoSa4Mi0Xppo) <gurzgri>:
Given that you set up a datasource named "db", then `connection: open odbc://db` should work. But to execute a statement you would have to open a statement first as in `statement: open conection`. After that you should be able to `insert statement "SELECT * FROM user"` to execute the statement and  `probe copy statement`.

Your line `data: connection` would just assign the value of `connection` to the word `data` without doing anything else. The literal string `"SELECT * FROM user"` just sits there and is ignored. And `view data` isn't valid Red code, `view` is for displaying GUI faces, you are trying to feed a database `port!` type here, provocing an error `*** Script Error: view does not allow port! for its spec argument`.

The documentation I've pointed to should help with these things.

[20:50:51](#zL6FovvZx-XmbZVfSX6aJZqsqcDIdGhr9BJph55EYHM) <gurzgri>:
 * Given that you set up a datasource named "db", then `connection: open odbc://db` should work. But to execute a statement you would have to open a statement first as in `statement: open connection`. After that you should be able to `insert statement "SELECT * FROM user"` to execute the statement and  `probe copy statement`.

Your line `data: connection` would just assign the value of `connection` to the word `data` without doing anything else. The literal string `"SELECT * FROM user"` just sits there and is ignored. And `view data` isn't valid Red code, `view` is for displaying GUI faces, you are trying to feed a database `port!` type here, provocing an error `*** Script Error: view does not allow port! for its spec argument`.

The documentation I've pointed to should help with these things.

[20:51:11](#b3GH2icz6oLSJcE2-xzfaOANtcjOra4Tr0ZdKZygj1E) <gurzgri>:
 * Given that you set up a datasource named "db", then `connection: open odbc://db` should work. But to execute a statement you would have to open a statement first as in `statement: open connection`. After that you should be able to `insert statement "SELECT * FROM user"` to execute the statement and  `probe copy statement` to retrieve the result set.

Your line `data: connection` would just assign the value of `connection` to the word `data` without doing anything else. The literal string `"SELECT * FROM user"` just sits there and is ignored. And `view data` isn't valid Red code, `view` is for displaying GUI faces, you are trying to feed a database `port!` type here, provocing an error `*** Script Error: view does not allow port! for its spec argument`.

The documentation I've pointed to should help with these things.

[21:31:11](#tlfbOSz6Nx8J94vlIOlZkSRSAj1aMLqS_nLOCQQQM7Y) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) It's not that it doesn't work with an `INSERT ... ON CONFLICT DO UPDATE SET ...` statement per se (this was my first guess). I set a database as simple as it gets with:
```
sqlite> create table stars (id integer unique, name text);
sqlite> insert into stars values (1,'son');
sqlite> insert into stars values (1,'sun');
Runtime error: UNIQUE constraint failed: stars.id (19)
sqlite> insert into stars values (1,'sun') on conflict (id) do update set name = excluded.name;
sqlite> select * from stars;
1|sun
```
Then in Red I connected to this and tried:
```
>> stars: open sqlite: open odbc://gurzgri
>> insert stars "insert into stars values (2,'Orionis')"
>> insert stars "insert into stars values (2,'Betelgeuse') on conflict (id) do update set name = excluded.name"
```
No error, no access violation. But surprisingly
```
>> insert stars "select * from stars"
>> probe copy stars
[
    [1 "su"]
    [2 "Betelgeus"]
]
```
������ The last letter of the names are missing! So something is still fishy here, I thought that had long since been fixed. 

[21:43:00](#Z_C_BayZvRQbcysr9UXeBMF1ApcD4P_PcUra7wuuxOc) <gurzgri>:
And then, there is a typo in your statement, have you noticed? There's an `'` missing for `'Company name` in 
```
... VALUES (..., '03330319', '77331001', 'Company name, 'test', 'ДОМ 27', 'Тест', 'Александр', ...) ...
```

## 22-Feb-2023

[7:11:56](#hAQU_0yD_IiAoSD28JdgpyYiSufft49drNEnqRRQS38) <bubnenkoff (Dmitry Bubnenkov)>:
oh, it's my own error I removed original company name and did an error. Now I have time -- will try to create example

[7:16:58](#Vet3phHF4MSWwnXJmAk9wAA6lWQnOaUtpqasAzDOKgE) <bubnenkoff (Dmitry Bubnenkov)>:
 * oh, it's my error I removed original company name and did an error. Now I have time -- will try to create example

[8:00:20](#yFp6OkdXmZ_g7U7xpRZF3GyYXjiEwO-W_kxsDQWCYK8) <bubnenkoff (Dmitry Bubnenkov)>:
Table:
```
CREATE TABLE "notifications"(
    "purchaseNumber" Text NOT NULL,
    "isGOZ" Integer,
    "docPublishDate" DateTime
CONSTRAINT "unique_purchaseNumber" UNIQUE ( "purchaseNumber" ) );
```

code:
```
odbc-connection-string: "driver={SQLite3 ODBC Driver};database=test_db.db;"

connection: try [
        open make port! [
        scheme: 'odbc
        target: rejoin [odbc-connection-string]
    ]
] 


either not error? connection [
    statement: open connection   

    print "[SUCCESS] SQL Connection"
] [
    print "[ERROR] SQL Connection"
    print connection/arg2 ; 
]


    

insert-part: {INSERT INTO notifications ("purchaseNumber", "isGOZ", "docPublishDate")
 VALUES (?,?,?)
 ON CONFLICT ("purchaseNumber")
 DO UPDATE SET "purchaseNumber" = EXCLUDED."purchaseNumber", "isGOZ" = EXCLUDED."isGOZ", "docPublishDate" = EXCLUDED."docPublishDate"}


prepared-values-part: [["0373100031922000521" none "2022-10-01T00:00:13.307+03:00"]]


insert statement compose [ 
        (insert-part)
        (prepared-values-part)
    ] 
```

I am getting a crush on this. Possible it's issue with date. I will try to check it

[8:00:48](#7ur5QuhWb-nVDiUvWtwQEMUmAVOc_4M9nZCQeaoFMK4) <bubnenkoff (Dmitry Bubnenkov)>:
 * Table:

```
CREATE TABLE "notifications"(
    "purchaseNumber" Text NOT NULL,
    "isGOZ" Integer,
    "docPublishDate" DateTime
CONSTRAINT "unique_purchaseNumber" UNIQUE ( "purchaseNumber" ) );
```

code:

```
odbc-connection-string: "driver={SQLite3 ODBC Driver};database=test_db.db;"

connection: try [
        open make port! [
        scheme: 'odbc
        target: rejoin [odbc-connection-string]
    ]
] 

either not error? connection [
    statement: open connection   
    print "[SUCCESS] SQL Connection"
] [
    print "[ERROR] SQL Connection"
    print connection/arg2 ; 
]

insert-part: {INSERT INTO notifications ("purchaseNumber", "isGOZ", "docPublishDate")
 VALUES (?,?,?)
 ON CONFLICT ("purchaseNumber")
 DO UPDATE SET "purchaseNumber" = EXCLUDED."purchaseNumber", "isGOZ" = EXCLUDED."isGOZ", "docPublishDate" = EXCLUDED."docPublishDate"}

prepared-values-part: [["0373100031922000521" none "2022-10-01T00:00:13.307+03:00"]]

insert statement compose [ 
        (insert-part)
        (prepared-values-part)
    ] 
```

I am getting a crush on this. Possible it's issue with date. I will try to check it

[8:05:44](#0dNI4RpOl2XZ-NI_9UeGDAavQpmjEkYvGgPgY5lcQlA) <bubnenkoff (Dmitry Bubnenkov)>:
It's not related with data, it crush even if it removed 

[17:38:50](#HO86WxKllYXj-UnqYRLUa7yMepAlF6mAleYuVvtqTA8) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) No problem here with
```SQL
create table notifications ( purchase text unique not null, goz integer, date datetime);
```
```Red
db: open sqlite: open odbc://gurzgri
sql: {insert into notifications (purchase, goz, date) values ('0373100031922000521',null,'2022-10-01T00:00:13.307+03:00') on conflict (purchase) do update set purchase = excluded.purchase, goz = excluded.goz, date = excluded.date}
insert db sql
insert db sql
insert db sql
```
But
```Red
sql: {insert into notifications (purchase, goz, date) values (?,?,?) on conflict (purchase) do update set purchase = excluded.purchase, goz = excluded.goz, date = excluded.date}
params: ["0373100031922000521" none "2022-10-01T00:00:13.307+03:00"]
insert db compose [(sql) (params)
*** Runtime Error 1: access violation
*** at: 64BC20E8h
```
So obviously the crash is related to using statement parameters.

[20:37:38](#VD3ReMw7iWDhJWdTNpKC4mCB2ncyx7QRe5k_cwWY-dc) <gurzgri>:
 * bubnenkoff (Dmitry Bubnenkov) No problem here with

```SQL
create table notifications ( purchase text unique not null, goz integer, date datetime);
```

```Red
db: open sqlite: open odbc://gurzgri
sql: {insert into notifications (purchase, goz, date) values ('0373100031922000521',null,'2022-10-01T00:00:13.307+03:00') on conflict (purchase) do update set purchase = excluded.purchase, goz = excluded.goz, date = excluded.date}
insert db sql
insert db sql
insert db sql
```

But

```Red
sql: {insert into notifications (purchase, goz, date) values (?,?,?) on conflict (purchase) do update set purchase = excluded.purchase, goz = excluded.goz, date = excluded.date}
params: ["0373100031922000521" #[none] "2022-10-01T00:00:13.307+03:00"]
insert db compose [(sql) (params)]
*** Runtime Error 1: access violation
*** at: 64BC20E8h
```

So obviously the crash is related to using statement parameters.

[21:15:22](#q4o8LKMEui_HLr1w8loF0PhZtD5KBcSzIDzTtM8PSsk) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) Commit [b770ee4](https://github.com/red/red/commit/b770ee43958ad857f3ee9ce48e430e931cdd20bf) might improve this for you:
```Red
sql: {insert into notifications (purchase, goz, date) values (?,?,?) on conflict (purchase) do update set purchase = excluded.purchase, goz = excluded.goz, date = excluded.date}
params: [
        ["0373100031922000521" #[none] "2022-10-01T00:00:13.307+03:00"]
        ["0373100031922000521" #[none] "2022-10-01T00:00:13.307+03:00"]
        ["0373100031922000521" #[none] "2022-10-01T00:00:13.307+03:00"]
]
db: open sqlite: open odbc://chinchin
insert db compose [(sql) (params)] ;== 3, no crash
```

## 23-Feb-2023

[6:36:17](#gcVEjQydeEi_cagroNPoPkGpuNWIH88qDO2RJ3VYoVA) <bubnenkoff (Dmitry Bubnenkov)>:
![](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/c48a41a258a0014c61aeebfb2569f05c54b34ce3)

[6:36:25](#O1ARekUiRWFrb16RpMJTgoVjzdejHYHzwVJJeUctxcM) <bubnenkoff (Dmitry Bubnenkov)>:
Now it do not crush, but insert cutted data like:

## 24-Feb-2023

[14:49:39](#1tCgi9cXTrSPd7JmxCZOnMEfocx462lhUiq973sFqxM) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) Have another go after commits [6655300](https://github.com/red/red/commit/6655300cfdce897702f4edabc038d183404108ae) and [4673ea0](https://github.com/red/red/commit/4673ea017422b997218728d6ceae7a28e589f687).

[15:46:02](#Ge8O4ljPNQpiRE7V7kSOJcOVaDPHxBdaLXNvcoaL5fM) <bubnenkoff (Dmitry Bubnenkov)>:
```
*** Compilation Error: undefined symbol: DATE_GET_YEAR
*** in function: exec/ctx||615~bind-parameters
*** at line: 500
*** near: [DATE_GET_YEAR (red-date/date)
    or (DATE_GET_MONTH (red-date/date) << 16)
    ts/day|hour: (DATE_GET_DAY (red-date/date))
    or ((as integer! floor red-date/time / 3600.0) << 16)
```

[19:51:19](#katqpp_7ch_KzNxXxeCmgZ0VU8X-5VZZ3Eo8clKfp8Y) <gurzgri>:
How did you try to compile to get that error?

[21:06:21](#AdLwjT9sP-EjPCtcU_LUfcOOu5rACKIQpBod8KO9I50) <gurzgri>:
 * How did you try to compile to get that error? With `--compile` probably without `--update-libRedRT` or instead of just `--release`? 

## 25-Feb-2023

[5:38:04](#MvtH_yuRr8TIiE4Fdqylg04BYGNleCepH4ps1rPb0mE) <bubnenkoff (Dmitry Bubnenkov)>:
I did next steps:
1. Copy to folder fresh version from git (old data removed)
2. Rebol console: 
```
>> do/args %red.r "-r -t Windows %environment/console/GUI/gui-console.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)
Script: "Get git version data" (none)

-=== Red Compiler 0.6.4 ===-

Compiling C:\odbc\environment\console\GUI\gui-console.red ...
...compilation time : 2774 ms

Target: Windows

Compiling to native code...
Script: "Red/System PE/COFF format emitter" (none)
...compilation time : 81570 ms
...global words     : 26972 (81.99%)
...linking time     : 426 ms
...output file size : 2503680 bytes
...output file      : C:\odbc\gui-console.exe
```
3. Compiling app:
```
>>  do/args %red.r "-c -e %/d/code/app/app.red"
Script: "Red command-line front-end" (none)
Script: "Get git version data" (none)

-=== Red Compiler 0.6.4 ===-

Compiling d:\code\foo\app\app.red ...
Compiling libRedRT...
...compilation time : 2024 ms

Compiling to native code...
Script: "Red/System PE/COFF format emitter" (none)
...compilation time : 82110 ms
...global words     : 27251 (82.84%)
...linking time     : 601 ms
...output file size : 1821696 bytes
...output file      : C:\odbc\libRedRT.dll

...compilation time : 1813 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined symbol: DATE_GET_YEAR
*** in file: %/d/code/app/app.red
*** in function: exec/ctx||615~bind-parameters
*** at line: 500
*** near: [DATE_GET_YEAR (red-date/date)
    or (DATE_GET_MONTH (red-date/date) << 16)
    ts/day|hour: (DATE_GET_DAY (red-date/date))
    or ((as integer! floor red-date/time / 3600.0) << 16)
]
>>
```

[5:52:43](#hdXC4FV4XdixB489I17x9vwZFRxfx1Lo2IC6PdJoVzs) <bubnenkoff (Dmitry Bubnenkov)>:
Note: first attempt was failed because `-c -u` Incompatible
```
>> do/args %red.r "-c -e -u %/d/code/app/app.red"
Script: "Red command-line front-end" (none)
*** Red command-line error: Incompatible compilation modes: -c -u
>>
>>
>> do/args %red.r "-e -u %/d/code/app/app.red"
Script: "Red command-line front-end" (none)
Script: "Get git version data" (none)

-=== Red Compiler 0.6.4 ===-

Compiling d:\code\app\app.red ...
...compilation time : 3259 ms

Target: MSDOS

Compiling to native code...
libRedRT-extras.r file generated, recompiling...

Compiling d:\code\app\app.red ...
Compiling libRedRT...
...compilation time : 2050 ms

Compiling to native code...
Script: "Red/System PE/COFF format emitter" (none)
...compilation time : 55082 ms
...global words     : 28400 (86.33%)
...linking time     : 410 ms
...output file size : 1821696 bytes
...output file      : C:\odbc\libRedRT.dll

...compilation time : 1304 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined symbol: DATE_GET_YEAR
*** in file: %/d/code/app/app.red
*** in function: exec/ctx||615~bind-parameters
*** at line: 500
*** near: [DATE_GET_YEAR (red-date/date)
    or (DATE_GET_MONTH (red-date/date) << 16)
    ts/day|hour: (DATE_GET_DAY (red-date/date))
    or ((as integer! floor red-date/time / 3600.0) << 16)
]
>>
````

[15:39:38](#woE3EkTXo7pGrNaEMBtiJguhTFkVGPG5v1gA20RCfGE) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) Having a bit of a déjà vu moment here: I have vague memories that at some point I was trying to use DATE_GET_.../DATE_SET_... macros to simplify things — but to no avail. And yesterday I was wondering again, made the change but didn't checked with `--compile` after seeing that the console was successfully compiling in `--release` mode. Please try again now with [commit 62801ce](https://github.com/gurzgri/red/commit/62801ce42406ff963fef516511f3d6390d6d46e1).

## 26-Feb-2023

[17:36:56](#y1PLpKdciXBZH7PjJa4Iks8oLP9WHVRjeIobS2bhhho) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: thanks! But it seems that it was some breaking changes in few last commits (`parser` part probably - there have been few commits about it). My code is now broken, so I can't check if it works now...

[17:50:46](#NKFqQWaPxYCwEIz_JIZNLjqUDrMl1IlG91r5jT6x_Gs) <bubnenkoff (Dmitry Bubnenkov)>:
it seems that merge `57245e0` bring something new... I will write when I will find what it's break...

[18:23:28](#XSRAFNyo4fhZcx1_LEDw2veS30mcO5XOx4rbOxICt_E) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: big thanks! Now code works! 

[18:24:17](#c8qw5KXK1dHIMlMPPVdVckAthiRG432ISqYSoD3ZiRs) <gurzgri>:
������️

## 4-Mar-2023

[7:44:08](#bJmxmaLUJHuNdhDi8HtadKfH1NcqjLaYLHZwjXT0F3Q) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: would it be hard to add support 64-bit version of odbc driver when Red x64 wold be released? 

[13:15:28](#g0uF61diXI4OazkM55MjX_nqV5A-cJT-3vkaeTjiKxg) <gurzgri>:
Would require mostly diligent but routine work, I think, but will offer higher degree of compatibility between Red and SQL datatypes here and there, too.

## 2-Aug-2023

[10:52:22](#qHZQJcQSwVvVwUl6te4fEVcUwfJFbcOGVU0zcM4x8dE) <bubnenkoff (Dmitry Bubnenkov)>:
Hi! One year ago I asked about plan to support Linux, you answered that currently do not have time for it, but I want ask again, because it would be cool to get my app work on Linux...
And thanks again for your work! I still use it in my project

[17:44:57](#hP0J87f2VDbtWR3HNOMksLrHhhSyNXV3CVDAJCLqftw) <gurzgri>:
You’re welcome, good to see it is of use to some people. Re: Linux?Well, sadly the answer I gave on Dec 24 above is still valid in all aspects. So, no plans for now and less time too for now.

[18:55:43](#c42u4A3Hjvf7O2EsMFS6ygWe64tMdNOeFxnHQCYXRAE) <bubnenkoff (Dmitry Bubnenkov)>:
Ok, maybe someday somebody will make binding at least for postgresql...

## 23-Sep-2023

[7:29:26](#GkcPcukSGPVNTkr5qBrO4UeQUfH_569NOXtANQWr1uE) <bubnenkoff (Dmitry Bubnenkov)>:
Ok, maybe someday somebody will make binding at least for postgresql...

## 15-Oct-2023

[14:46:19](#jswpBLoJWmSRRZKape-Nzi8oaTunXY6boiam-Hk6pXk) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) Finally found some time to set up an Ubuntu virtual machine and to try getting Red-ODBC running there:

```bash
ubuntu@vm:~/Development/red-odbc$ ./console
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

>> system/schemes/odbc/state/drivers
== [
    "MariaDB ODBC Connector" #(
        "Description" "MariaDB ODBC Connector"
        "Driver" "/usr/lib/libmaodbc.so"
    )
]
>> system/schemes/odbc/state/sources
== [
    "mariadb" "MariaDB ODBC Connector"
]
>> mariadb: open odbc://mariadb
*** Script Error: ODBC error: ["01000" 0 {[unixODBC][Driver Manager]Can't open lib '/usr/lib/libmaodbc.so' : file not found
```

Because, unsurprisingly:

```bash
ubuntu@vm:~/Development/red-odbc$ file /usr/lib/libmaodbc.so 
/usr/lib/libmaodbc.so: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, ...
```

So the hardest part probably will be finding / installing / setting up correctly an ODBC driver für i386 architecture 32-bit Red can use there. No luck so far and uncharted territory for me, to say the least ... 



## 16-Oct-2023

[21:33:15](#rypK90JHW_vdo_MzXxPE7oCWB8G_Hb9z6rylo4M6z78) <gurzgri>:
Woohoo! Red-ODBC works on Linux too!

Using a trial of the commercial Devart ODBC 32-/64-bit drivers for Linux I have just been successful in connecting to and querying a Postgres database now:

```bash
ubuntu@vm:~/Development$ red-odbc/console
--== Red 0.6.4 ==-- 
>> dvdrental: open postgres: open odbc://dvdrental ()
>> insert dvdrental "select * from actor limit 10"
== [actor-id first-name last-name last-update]
>> probe copy dvdrental
[
    [1 "Penelope" "Guiness" 26-May-2013/14:47:57.62] 
    [2 "Nick" "Wahlberg" 26-May-2013/14:47:57.62] 
    [3 "Ed" "Chase" 26-May-2013/14:47:57.62] 
    [4 "Jennifer" "Davis" 26-May-2013/14:47:57.62] 
    [5 "Johnny" "Lollobrigida" 26-May-2013/14:47:57.62] 
    [6 "Bette" "Nicholson" 26-May-2013/14:47:57.62] 
    [7 "Grace" "Mostel" 26-May-2013/14:47:57.62] 
    [8 "Matthew" "Johansson" 26-May-2013/14:47:57.62] 
    [9 "Joe" "Swank" 26-May-2013/14:47:57.62] 
    [10 "Christian" "Gable" 26-May-2013/14:47:57.62]
]
```

The best thing is: Relevant changes to the current implementation were a teensy 4 lines of code (not published yet).

[22:19:37](#d1dFUJlIuaUMszt_Ltbs5Pe-22EWvycBgoJ-KxLI_nY) <GiuseppeChillemi (GiuseppeChillemi)>:
This is a great news!

## 17-Oct-2023

[8:07:58](#cGxsv3L_XvT917iKptC42rpufvDtqKkARiU12fG1w9Q) <bubnenkoff (Dmitry Bubnenkov)>:
Wow! That very good news! Possible it's offtop for this thread, but is it hard to run Red on modern Linux distributions?

[8:17:26](#hErFj7vCWZBjDfLmkLQv6WoyzVAkL1EGHfy7nL2qcCU) <gurzgri>:
No.

[8:20:28](#VH6GXD-XEDxNHblsG2YlRrT2oAkTIeVlqD2k4mcz3g4) <rebolek (Boleslav Březovský)>:
If those modern distros support ancient 32bit architecture, you're fine.

## 18-Oct-2023

[18:17:18](#2yIR39J_DUHKBQqvSE1_FKmjJtdnlEB0-kN7dn0hOVw) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: could you please look at https://app.gitter.im/#/room/#red_red/gui-branch:gitter.im/$oSgGAvaCDZVwEzR4R-TP1-guYx22-fizjnfVKAbMl6U

Possible you need to rebase with master (I am not expert in git). boris said that it's issue related with old code version

## 21-Oct-2023

[21:33:35](#Ww5qSvFNBXRbgW4KVTVulLwu93XTFNmARn8Z9RVGcj4) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) Pushed [FEAT: Linux support](https://github.com/gurzgri/red/commit/dd447ddb3071fa321ab1fe1c27ee15a55a7a2d79) FWIW. If you manage to find and compile a driver, let me know.

## 27-Oct-2023

[14:50:00](#WlSStJ2pgfMA7PXDXO4KQVMnM4LMr-jGnvvvwtf2iwU) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: ok! Thanks! I will try to do it on next week. But why you used commercial Devart driver? Does it work with free?

## 24-Nov-2023

[6:41:44](#cHRAPsw_xK_lXL3Is_tfhB3qRpKhR-9S2f59RN_URnE) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: oh, I just tried the last ODBC version. 
The version which was done when I asked you aboute rebase is works fine. But current version is crush with `*** Runtime Error 1: access violation` when I am trying to connect to SQLite. I will try to create sample

[7:22:44](#MGe40JNnoiW2W5lkA6RCjjQhXqC9GwF23mC0NHtV4KA) <bubnenkoff (Dmitry Bubnenkov)>:
```
PS C:\red-odbc> .\app.exe

*** Runtime Error 1: access violation
*** at: 69A3794Fh
```
and:
```
PS C:\red-odbc-old> .\app.exe
Hello
abc
Connected
```

code:
```
Red [
    Needs: [View ODBC]
]

 db-file: %database.db
 sqlite-driver-name: "SQLite3 ODBC Driver"
 sqlite-db-path: "D:/code/test/database.db"
 source-db-odbc-connection-string: rejoin ["driver={" sqlite-driver-name "};database=" sqlite-db-path ";"]


sourcedb-connection: try [ 
        open make port! [
        scheme: 'odbc
        target: rejoin [source-db-odbc-connection-string]
    ]
] 

print "Hello"

xml-files-statement: open sourcedb-connection 

print "abc"
either not error? sourcedb-connection [ 
    print "Connected"
] [
    print "Not Connected"
]
```

[7:23:43](#gesXqMpqOQhV1_1EG-ATAQXXn9dAKzzRPp4UxX1fg6Q) <bubnenkoff (Dmitry Bubnenkov)>:
 * ```
PS C:\red-odbc> .\app.exe

*** Runtime Error 1: access violation
*** at: 69A3794Fh
```

and:

```
PS C:\red-odbc-old> .\app.exe
Hello
abc
Connected
```

code:

```
Red [
    Needs: [View ODBC]
]

 db-file: %database.db
 sqlite-driver-name: "SQLite3 ODBC Driver"
 sqlite-db-path: "D:/code/test/database.db"
 source-db-odbc-connection-string: rejoin ["driver={" sqlite-driver-name "};database=" sqlite-db-path ";"]


sourcedb-connection: try [ 
        open make port! [
        scheme: 'odbc
        target: rejoin [source-db-odbc-connection-string]
    ]
] 

print "Hello"

xml-files-statement: open sourcedb-connection 

print "abc"
either not error? sourcedb-connection [ 
    print "Connected"
] [
    print "Not Connected"
]
```

Compilation string: `do/args %red.r "-c -e %/d/code/test/app.red"`

[12:58:42](#1cDcChXW7-ksBK4YSNRHjHTT3p60nVWKzuNOjjY9ES4) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) Can confirm, thank you for noticing that regression! Pushed fix and sync'ed master to latest Red development.

[13:03:10](#EAlCeE7BXDn7Mu2v5beGkH4zF-eUge2_asRAq1k-m9M) <gurzgri>:
BTW, I really appreciate the effort you invested in providing a small example showcasing the problem instead of just throwing the whole app source code in here. ������️ Yet a _really minimal_ example would have been:

```Red
Red [Needs: 'ODBC]
open make port! [scheme: 'odbc target: "driver={SQLite3 ODBC Driver};database=D:/code/test/database.db;"]
```

������(no offense)

[13:07:35](#-8DpgfFxZzJtNdGl-n0_l2P1QyOw6OfW-LrXo3b_220) <bubnenkoff (Dmitry Bubnenkov)>:
Thanks for fix!

[13:07:56](#dzP88atH8lCXE_2VWv5eFYKIeBSmAGVJZ1YUde8IO-Y) <bubnenkoff (Dmitry Bubnenkov)>:
It seems that just now I get Red app work on Linux

[13:08:29](#d7Q-_prGqUxr--lLJQ-XkztiVMlWXiH4FtwErZu6Cm0) <bubnenkoff (Dmitry Bubnenkov)>:
it's look terrible, but work. Not sure about ODBC yet

[13:15:40](#VGZPtW4hhCPsaAkGuWYYSUDxV7S_B0RJ0t-r_yo4ikk) <gurzgri>:
The problem with ODBC you'll might face on Linux is: 

> So the hardest part probably will be finding / installing / setting up correctly an ODBC driver für i386 architecture 32-bit Red can use there. No luck so far and uncharted territory for me, to say the least ...

That's why I tested with Devart driver, it came with 32bit support.

[13:20:17](#nhlJUVWwHz_qG2eYXVLcoiMagJSgMLaGwyAErELP3N0) <bubnenkoff (Dmitry Bubnenkov)>:
heh... gui do not want start after merging)

## 29-Nov-2023

[13:07:37](#SdIQueXxU9LJnR0Cbt641FSU6NhPS-IxpO04mXpcWlk) <bubnenkoff (Dmitry Bubnenkov)>:
After many attempts I was not able to get all work at least on ArchLinux. It seems that better to wait when 64-bit version of Red will be released. Not it very hard to setup 32-bit libs on Linux.


[13:30:27](#iZYMS5rjj1QeqoarzMvKjoA4zPPt12omTx0yBLJ6Zis) <hiiamboris>:
Frow what I saw, it's the philosophy of ArchLinux to make everything as hard as possible to do.

[14:56:51](#eo-Y830XfHNWkXI0tZ4_UcSf1PHfj4T3boadrCT0RZA) <bubnenkoff (Dmitry Bubnenkov)>:
Possible, but I do not know where it would be easier (possible) to do. 32-bits is really problem now

[18:32:21](#iBxMemMrEPwbXmgF1wC3wtlTijEIhi-EpKEK4rY3vT8) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: if you setup driver on linux by instruction could you share link, with big help of hiiamboris  I was able to install sqlite-32 driver

[21:15:21](#bZtwujnCthzWlKrh0NsSCNqufgyOVeuzbOdUoGmDs9U) <gurzgri>:
I don't think I can be too much of a help here, all I remember is that — as I was using Ubuntu Jammy Jellyfish — was going with nixodbc:i386, unixodbc-dev:i386, libodbc1:i386 and  odbcinst1debian2:i386 because I expected to be required to compile some 32bit ODBC driver myself, but didn't manage to do so. Only thing which was working 32bit was Postgres-Devart one.

You'll need to set up sth. like
```
$ cat /etc/odbcinst.ini 
[PostgreSQL ANSI]
Description=PostgreSQL ODBC driver (ANSI version)
Driver=psqlodbca.so
Setup=libodbcpsqlS.so
Debug=0
CommLog=1
UsageCount=1

[PostgreSQL Unicode]
Description=PostgreSQL ODBC driver (Unicode version)
Driver=psqlodbcw.so
Setup=libodbcpsqlS.so
Debug=0
CommLog=1
UsageCount=1

[SQLite]
Description=SQLite ODBC Driver
Driver=libsqliteodbc.so
Setup=libsqliteodbc.so
UsageCount=1

[SQLite3]
Description=SQLite3 ODBC Driver
Driver=libsqlite3odbc.so
Setup=libsqlite3odbc.so
UsageCount=1

[ODBC Drivers]
Devart ODBC Driver for PostgreSQL=installed

[Devart ODBC Driver for PostgreSQL]
Driver=/usr/local/lib/libdevartodbcpostgresql.so
```

```
$ cat /etc/odbc.ini
[ODBC Data Sources]
DEVART_POSTGRESQL=Devart ODBC Driver for PostgreSQL

[DEVART_POSTGRESQL]
Driver=Devart ODBC Driver for PostgreSQL
Data Source=
Database=
User ID=
Password=
Port=5432
Schema=
```

That's probably a starting point for you, I cannot give more advise with that.  


 

## 30-Nov-2023

[6:17:12](#ufp1XQv3msUmwknoZra6hYZxy6BxeuKqUa-l_Elnfho) <bubnenkoff (Dmitry Bubnenkov)>:
thanks! I often see ANSI/UNICODE mention in drivers. What does it mean and when I should select one and when another?

[6:47:30](#HixHI9gltHu3SBN7XbMqLiqq3fkShlpL7UUl2USqEqA) <gurzgri>:
Oh, come on, man ������: https://stackoverflow.com/questions/25889046/difference-between-ansi-and-unicode-drivers-of-mysql

[7:44:24](#IBczuhnd19VlAHBB2VmGWSop4bh8EVqTr8CvVTTNeZ0) <bubnenkoff (Dmitry Bubnenkov)>:
But I thought Unicode is standard now. What the reason? Legacy? 

[7:56:50](#gCAjZNllvgGyyMyMwTDrLipG02nyAtW0v1OaoAJITyA) <rebolek (Boleslav Březovský)>:
of course

[8:40:09](#UJE7PLNOMcs81sj4S2jUiWjkHgHQnjQ3OIEisdr0Bvs) <bubnenkoff (Dmitry Bubnenkov)>:
Uf...! I get it work with standard ODBC SQLite driver. Later I will systematize how I did it

[11:37:52](#e59rtKMYYph8trVLRhlhcnfJF33ByX4I_kRfmq7NpVg) <bubnenkoff (Dmitry Bubnenkov)>:
Uncomment (if commented) multilib support:
```
/etc/pacman.conf

[multilib]
Include = /etc/pacman.d/mirrorlist
```

```
sudo pacman -Syu
pacman -S base-devel
sudo pacman -S lib32-gtk3
sudo pacman -S lib32-glibc
sudo pacman -S lib32-sqlite
sudo pacman -S multilib-devel
sudo pacman -S gcc-multilib
sudo pacman -S lib32-gcc-libs
sudo pacman -S yay
yay -S lib32-unixodbc
```

Then:

```
git clone https://github.com/softace/sqliteodbc.git
cd sqliteodbc
CFLAGS=-m32 LDFLAGS=-m32 ./configure
make
sudo make install
```

run
```
sudo nano /etc/odbcinst.ini 
```
and add this section if not exists (after manual install it don't):
```
[SQLite32]
Description=SQLite3 ODBC Driver
Driver=/usr/local/lib/libsqlite3odbc.so
Setup=/usr/local/lib/libsqlite3odbc.so
UsageCount=1
```
`SQLite32` name could be changed. But every project should use this name as name of `odbc` driver.


--
tested on Majiaro

[13:30:52](#8GHfiH5YIDrRXFIgukvaACsXEt6qfZtgqEKoofcgMh8) <rebolek (Boleslav Březovský)>:
bubnenkoff (Dmitry Bubnenkov): I can confirm it works, thanks!

## 1-Dec-2023

[12:39:44](#heyDRxFwLerjwgt_gQoWnBre_hyMV_ySkso0gcBvTwE) <bubnenkoff (Dmitry Bubnenkov)>:
bubnenkoff (Dmitry Bubnenkov): I can confirm it works, thanks!

[12:40:03](#D5Kvv2MO89tqcrEQN4Mbb0SuMzlpu7XPHz2a-gdYtSI) <bubnenkoff (Dmitry Bubnenkov)>:
 * Can't get it work on Ubuntu:

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgtk-3-0:i386
sudo apt install libcurl4-openssl-dev:i386
sudo apt install unixodbc:i386
sudo apt install odbcinst:i386
sudo apt install sqlite3:i386
sudo apt install libcanberra-gtk-module:i386

sudo nano /etc/odbcinst.ini
```
[SQLite32]
Description=SQLite3 ODBC Driver
Driver=/usr/lib/i386-linux-gnu/libodbc.so.2.0.0
Setup=/usr/lib/i386-linux-gnu/libodbc.so.2.0.0
UsageCount=1
```
error:

```
IM004 0 [unixODBC][Driver Manager]Driver's SQLAllocHandle on SQL_HANDLE_HENV failed

```

[13:16:26](#tE2C9_m0fZs8PMjofm-6glCS3qxQXpXh8C99X3O8etU) <bubnenkoff (Dmitry Bubnenkov)>:
```
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgtk-3-0:i386
sudo apt install libcurl4-openssl-dev:i386
sudo apt install unixodbc:i386

sudo add-apt-repository "deb [arch=x32] http://deb.debian.org/debian/ sid main"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793 0E98404D386FA1D9 648ACFD622F3D138

sudo apt install libsqliteodbc:i386
```

add to edit to be sure that 32 bit version have right driver path
```
sudo nano /etc/odbcinst.ini 
```

```
[SQLite32]
Description=SQLite3 ODBC Driver
Driver=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
Setup=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
UsageCount=1
```

Should work.

[13:16:52](#LL4mZ6LCkHyLRyR2hcthlsVBuUfz0lq9cZCo4pS8Vzs) <bubnenkoff (Dmitry Bubnenkov)>:
 * ```
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgtk-3-0:i386
sudo apt install libcurl4-openssl-dev:i386
sudo apt install unixodbc:i386

sudo add-apt-repository "deb [arch=x32] http://deb.debian.org/debian/ sid main"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793 0E98404D386FA1D9 648ACFD622F3D138

sudo apt install libsqliteodbc:i386
```

add to edit to be sure that 32 bit version have right driver path

```
sudo nano /etc/odbcinst.ini 
```

Ubuntu setup:
```
[SQLite32]
Description=SQLite3 ODBC Driver
Driver=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
Setup=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
UsageCount=1
```

Should work.

[13:17:10](#WtBhd3QbZpajx2Gzzq5irhYCi36Hjw6sebidMZIgkPA) <bubnenkoff (Dmitry Bubnenkov)>:
 * Ubuntu setup:
```
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgtk-3-0:i386
sudo apt install libcurl4-openssl-dev:i386
sudo apt install unixodbc:i386

sudo add-apt-repository "deb [arch=x32] http://deb.debian.org/debian/ sid main"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793 0E98404D386FA1D9 648ACFD622F3D138

sudo apt install libsqliteodbc:i386
```

add to edit to be sure that 32 bit version have right driver path

```
sudo nano /etc/odbcinst.ini 
```

```
[SQLite32]
Description=SQLite3 ODBC Driver
Driver=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
Setup=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
UsageCount=1
```

Should work.

[13:17:39](#O8yJ2Z8lsnedqdHe1y3Y2vzGNjG2rXUpDuczMlXaJRc) <bubnenkoff (Dmitry Bubnenkov)>:
 * Ubuntu setup:

```
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgtk-3-0:i386
sudo apt install libcurl4-openssl-dev:i386
sudo apt install unixodbc:i386
sudo add-apt-repository "deb [arch=x32] http://deb.debian.org/debian/ sid main"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793 0E98404D386FA1D9 648ACFD622F3D138
sudo apt install libsqliteodbc:i386
```
add to edit to be sure that 32 bit version have right driver path

```
sudo nano /etc/odbcinst.ini 
```

```
[SQLite32]
Description=SQLite3 ODBC Driver
Driver=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
Setup=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
UsageCount=1
```

Should work.

[13:19:41](#b1iYe8vVFYEZx214aKwtPNp4nroxLnpal2_c5k8xKzM) <rebolek (Boleslav Březovský)>:
bubnenkoff (Dmitry Bubnenkov): it would be a good idea to put this into a wiki, so it would be easier to find

[13:21:57](#LFctRNqlKz1KA7UqkTk5-jsX19IppZxNMWehPXqvAnw) <bubnenkoff (Dmitry Bubnenkov)>:
in what section?

[13:24:04](#lsqeTvGMei-owsGDN3uOEWAFdvOIKQcnXZ4297fBrh8) <rebolek (Boleslav Březovský)>:
Looking at https://github.com/red/red/wiki/ there's nothing DB related yet, so probably just add it to root as `[DOC] ODBC setup on Linux` or something like that and it can be moved later, once the section is added.

[13:36:05](#3wTxMD5pCW4vmxroXh4DDzJtJ4D1YfM7HvTvf_bn6y4) <bubnenkoff (Dmitry Bubnenkov)>:
 * Ubuntu setup:
```
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgtk-3-0:i386
sudo apt install libcurl4-openssl-dev:i386
sudo apt install unixodbc:i386

sudo add-apt-repository "deb [arch=x32] http://deb.debian.org/debian/ sid main"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793 0E98404D386FA1D9 648ACFD622F3D138

sudo apt install libsqliteodbc:i386
```

add to edit to be sure that 32 bit version have right driver path
```
sudo nano /etc/odbcinst.ini 
```

```
[SQLite32]
Description=SQLite3 ODBC Driver
Driver=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
Setup=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
UsageCount=1
```

For PostgreSQL:
```
sudo apt install odbc-postgresql:i386
```

Should work

[13:37:07](#jm7SW2mLi_mLoBajRvI2ap8Wwzwd5-yjGYak5WHitXg) <bubnenkoff (Dmitry Bubnenkov)>:
 * Ubuntu setup:

```
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgtk-3-0:i386
sudo apt install libcurl4-openssl-dev:i386
sudo apt install unixodbc:i386

sudo add-apt-repository "deb [arch=x32] http://deb.debian.org/debian/ sid main"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793 0E98404D386FA1D9 648ACFD622F3D138

sudo apt install libsqliteodbc:i386
```

edit next file to be sure that 32 bit version have right driver path:

```
sudo nano /etc/odbcinst.ini 
```

```
[SQLite32]
Description=SQLite3 ODBC Driver
Driver=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
Setup=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
UsageCount=1
```

For PostgreSQL:

```
sudo apt install odbc-postgresql:i386
```

Should work

[13:48:06](#j2mhXHFcz6k9ybTEoahlVwImESNSzgIoysNe8WoGvsQ) <bubnenkoff (Dmitry Bubnenkov)>:
 * Ubuntu setup:

```
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgtk-3-0:i386
sudo apt install libcanberra-gtk3-module:i386
sudo apt install libcurl4-openssl-dev:i386
sudo apt install unixodbc:i386

sudo add-apt-repository "deb [arch=x32] http://deb.debian.org/debian/ sid main"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793 0E98404D386FA1D9 648ACFD622F3D138

sudo apt install libsqliteodbc:i386
```

edit next file to be sure that 32 bit version have right driver path:

```
sudo nano /etc/odbcinst.ini 
```

```
[SQLite32]
Description=SQLite3 ODBC Driver
Driver=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
Setup=/usr/lib/i386-linux-gnu/odbc/libsqlite3odbc.so
UsageCount=1
```

For PostgreSQL:

```
sudo apt install odbc-postgresql:i386
```

Should work

## 4-Dec-2023

[14:26:42](#11SXxSnskc43Hzkb3lzZYGVLIQuNlLLgLgL8AGOzqDE) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: could you do merge please? There is few changes that important for me

[20:19:23](#0PL_45VXyqidOlCQg6JXJcFLD8O9DjanUvM4geonQh4) <gurzgri>:
fetched and merged from upstream red:master

## 5-Dec-2023

[0:44:20](#KTuSDlvC79Rd0n53R1GYS6I0ierejpzozuOZQ3StkiQ) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@gurzgri-56c25b3ae610378809c19713:gitter.im> fetched and merged from upstream red:master

Thank you 

## 27-Feb-2024

[7:24:16](#hBsjPTNY-5kyLK58uTTMVw0BlyH_jrSbqosCN5kQ6T8) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: hi! Could you merge please last changes?

## 17-Mar-2024

[10:34:29](#iN_6D7YaWliAOjF1ObPtRqSmj15DbhNVhMaHLEQzA-w) <bubnenkoff (Dmitry Bubnenkov)>:
Oh big thanks! Only one wish. There was one regression fixed today, I need it too. Could you merge it please?

## 19-Nov-2024

[13:32:37](#7R5JZ3hy1ACq6_uQr4puL-ZTAFeDE21AJ9THJgC0uVE) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: hi! Could you do new merge? it seems there was some important changes in red

[15:34:35](#RPB12mU0krjxfo11yvGgjwU7ooZnYVb2jUAuu34VPbI) <bubnenkoff (Dmitry Bubnenkov)>:
or maybe better to wait for branch rsc2 will be merged

[16:25:48](#fbxIYegh7oi3BVwpQP-3G9fwU1dBeqFCZP17U16dUhA) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@bubnenkoff-5978a39dd73408ce4f6edb60:gitter.im> or maybe better to wait for branch rsc2 will be merged

It will take months.

[16:26:08](#4G8bFdt_rKji_A0yeoZz86ogckfnne4yF4C6ANT2GKI) <GiuseppeChillemi (GiuseppeChillemi)>:
Just for curiosity, how are sales going? 

[16:36:22](#gk938LkFnaUckW3rXUmJmySzOc_r_s55AZzYb_n5FuE) <bubnenkoff (Dmitry Bubnenkov)>:
0 (ZERO!) I did not get 0 customers for all year. I am seeing around 1-2 downloads per day, but not sure if it's not bots

[16:40:24](#YubfoKFowk4hy71iWodEBDSTtj4MD-MgRbmXTynHAFU) <bubnenkoff (Dmitry Bubnenkov)>:
 * 0 (ZERO!) I did get 0 customers for all year. I am seeing around 1-2 downloads per day, but not sure if it's not bots

[16:49:46](#rF0ejenRHDp7hdXzZ20Qdrfe0eO3JD9QhmuPkjLY0LY) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) Nice to see around here. 

Due to the changes brought in by the TUI dialect I couldn't just fast forward my fork to red/red, github only offered me to create a pull request. But this wouldn't have the slightest chance of being accepted. So I had to manually merge the local repo with upstream master red/red and then push to gurzgri/red. Git will never cease to intimidate me, Git will never cease to amaze me.

[16:50:36](#gp4d63ixwDwKwssbkbT2vUO9ua7IXcpmrVHYd_6zWoY) <gurzgri>:
 * bubnenkoff (Dmitry Bubnenkov) Nice to see you around here.

Due to the changes brought in by the TUI dialect I couldn't just fast forward my fork to red/red, github only offered me to create a pull request. But this wouldn't have the slightest chance of being accepted. So I had to manually merge the local repo with upstream master red/red and then push to gurzgri/red. Git will never cease to intimidate me, Git will never cease to amaze me.

[18:09:12](#g1sXuhEzrOYQ-vKl1Iw6P8SKJc8k39HCuhJv_PNEnM8) <greggirwin (Gregg Irwin)>:
> Git will never cease to intimidate me, Git will never cease to amaze me.

Well said.

[18:23:08](#14o_98fF0DhnEhMV9g1JZ9-7wfQUkTjG5tol1wtu93k) <hiiamboris>:
Are you using `rebase`?

[18:46:51](#FywGpPo4oTVPd4l913GiDnkcTyiNUbtwgfAiU_BcfE0) <gurzgri>:
No. I've added the ODBC stuff in the master branch for better user experience. In order to follow red development, occasionally fast forwarding usually is enough for me to stay in sync. It's just a click in github UI. This time so, there was a conflict preventing this. Nothing special, I instantly had a very strong suspicion which code change it would be - but Github UI offers no way to identify / show you the conflicting code preventing a ff merge. Under this circumstance, Github just can't provide a diff. Well, sync'ing the fork in the command line instead (I don't use github cli, just git) wasn't particular challenging. But it's not in my muscle memory either.

[19:02:05](#_s1Z9sFmdLw7fhhIOEUxXWOor0_OUy5ICvgO15Gz-Ew) <hiiamboris>:
Knowiing how badass the git is, this workflow sounds like a recipe for disaster ;)

## 20-Nov-2024

[0:37:49](#DW-hk-fTbVp6RSVOyJI9ytMHsxwTlyLcRNyK4awJRZY) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@bubnenkoff-5978a39dd73408ce4f6edb60:gitter.im> 0 (ZERO!) I did get 0 customers for all year. I am seeing around 1-2 downloads per day, but not sure if it's not bots

Have you a version for me so I can look at it and trying to understand what is not working?

[7:22:12](#c5JXegV52H6oGv70Gq7tTPCb18xflPgY2ixacNzbZXU) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: big thanks!

GiuseppeChillemi (GiuseppeChillemi) after long debugging I released that it seems that my bug. I am not 100% sure, but it seems. It's very very hard to setup 32 bit ODBC version on modern Linux. I was able to do it only once -- around one year ago. But thanks for offer of help. Now most of what I possible to run -- is run SmartXML without ODBC. Honestly it's look terrible))





 

[7:22:44](#W1gPB8Ev7_XOf_dJMd9iYQ-8TTrtcrIMydHeNrZNESs) <bubnenkoff (Dmitry Bubnenkov)>:
![https://gitter.ems.host/_matrix/media/v3/download/gitter.im/a7727d84bc474f907b0ee1ced7cd532ea4f590271859135263213617152](https://gitter.ems.host/_matrix/media/v3/download/gitter.im/647f4c402bb6aab209441e755c1c6af9092b09c01859135268926259200)

[7:27:56](#_YuuIB_d8qH2MPC567Ist7wNEEvn5vFHgP8KdxwVOmk) <bubnenkoff (Dmitry Bubnenkov)>:
I think that main issue it's hard to use gui. People now prefer web-versions, but I am not sure that I would be able to create usable front-end for it. Now I am again without job, but when I will find it I would not have time to playing with JS...

But again thanks for everyone!

## 21-Nov-2024

[0:41:47](#ZKBLisUXUgHS83cDcNOuUDFjbVqEXj4dsuqiuO6Ph-0) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@bubnenkoff-5978a39dd73408ce4f6edb60:gitter.im> gurzgri: big thanks!
> 
> GiuseppeChillemi (GiuseppeChillemi) after long debugging I released that it seems that my bug. I am not 100% sure, but it seems. It's very very hard to setup 32 bit ODBC version on modern Linux. I was able to do it only once -- around one year ago. But thanks for offer of help. Now most of what I possible to run -- is run SmartXML without ODBC. Honestly it's look terrible))

I dind't offer an help on coding but on marketing, to try to understand what's wrong. You have put a lot of work in your product and also other memebers of our community, so if I can help, I am here for you.

[0:41:57](#N01r_TGIY9s0C6yZliUA1i59bMUqzoGaH6QLe8j75kE) <GiuseppeChillemi (GiuseppeChillemi)>:
 * I didn't offer an help on coding but on marketing, to try to understand what's wrong. You have put a lot of work in your product and also other memebers of our community, so if I can help, I am here for you.

[9:16:38](#zOgX5NfqSdZ-rkzs2nO33agrhhM7LQY-2G2s3mvNeyk) <bubnenkoff (Dmitry Bubnenkov)>:
GiuseppeChillemi (GiuseppeChillemi): yes if you can help it would be very good. I do not know how to find any customers. I know that people are still parsing XML by hands and on fiverr it's a lot of order fulfiller who take up to 40$ per documents, but all of them are doing it's on Python. All of them have good rate. So XML parsing is needed.

I tried to write to many companies that related with XML data. But got around 0 responses. 

And google do not want to range my site. It's impossible to find my target request related with XML.

I do not have any good ideas...



[9:18:01](#z2-8xaObBNYYEpvdNRyJgADeSBHleGq0J1nlTt-ey5k) <bubnenkoff (Dmitry Bubnenkov)>:
If you want you can download it from https://redata.dev/smartxml/ free version have only limited batch processing.

[19:09:37](#nCozxqxZv0Q36AxSn52ApInccd4cq84WiGRFfmQzXf8) <GiuseppeChillemi (GiuseppeChillemi)>:
> <@bubnenkoff-5978a39dd73408ce4f6edb60:gitter.im> GiuseppeChillemi (GiuseppeChillemi): yes if you can help it would be very good. I do not know how to find any customers. I know that people are still parsing XML by hands and on fiverr it's a lot of order fulfiller who take up to 40$ per documents, but all of them are doing it's on Python. All of them have good rate. So XML parsing is needed.
> 
> I tried to write to many companies that related with XML data. But got around 0 responses. 
> 
> And google do not want to range my site. It's impossible to find my target request related with XML.
> 
> I do not have any good ideas...

Let's move to CHITCHAT

## 17-Jan-2025

[15:59:48](#Q6uPiXSMelOabKfvFNXGTk5BMmvaYhfjGPBKZartM44) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: could you please do new merge. I have strange error and want to check on latest Red version

## 19-Jan-2025

[8:14:55](#xxd3ays8ScpdDhiVzFEGlVikd5QS8YZ3Ts-O3-kw-4c) <bubnenkoff (Dmitry Bubnenkov)>:
Big thanks!

[8:35:48](#h4Rfwce_ligpbNnLhDFFoCikXcd9s-wrmGdYrYhe3lI) <bubnenkoff (Dmitry Bubnenkov)>:
```
>> do/args %red.r "-r -t Windows %environment/console/GUI/gui-console.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)
Script: "Get git version data" (none)

-=== Red Compiler 0.6.5 ===-

Compiling C:\red-odbc\environment\console\GUI\gui-console.red ...
...compilation time : 3811 ms

Target: Windows

Compiling to native code...
*** Compilation Error: nested assignment in expression not supported
*** in file: %/C/red-odbc/environment/console/GUI/gui-console.red
*** in function: exec/ctx||573~open-environment
*** at line: 2989
*** near: [rc: 65535 and (sql/SQLSetEnvAttr sqlhenv
        sql/attr-odbc-version
        sql/ov-odbc3
        0
    )
    if any [rc = sql/error rc = sql/success-with-info] [odbc/diagnose-error sql/handle-env sqlhenv environment]
]
```

[23:26:42](#b4R2fwgt5-re4BqxwB-btVN5pkiZbAGjgHTMjUdFoa8) <gurzgri>:
Can confirm. Must be caused by some change to any one of the 124 files and  +3508 -1636 lines changed the recent Red development has introduced. For now, I don't see the `nested assignment in expression` in places the compiler complains about. That'll take some time to find. 

## 20-Jan-2025

[8:30:04](#vf7wrHHLwgw6AV70xkKpLr4j9I4dTNeyuvo3jQ2qGmw) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: thanks for your work!

[22:05:56](#H4lhtvp1NOizM03hUj6fVA8fImdaVAcKzgfeeIFhoEM) <gurzgri>:
Well, *maybe* the answer can be found in one of the following commits (out of 169 in total) merged into red/red master:

```
Christian Ensel@SurfacePro7 MINGW64 ~/Development/red (master)
$ for id in $(git log --oneline e5acdea87^..e5acdea87 | cut -d' ' -f1); do files=$(git diff-tree --no-commit-id --name-only -r $id); [[ $files == *"system/compiler.r"*
 ]] && git show --oneline --name-status $id | head -1; done
cea2f8b08 FIX: various issues related to introduction of frames chaining slot on native stack.
3582e8940 FEAT: adds PIC mode support to stack frames chaining.
5eb693b46 FIX: implements a workaround for walking through a broken stack frames chain.
b07105961 FEAT: applies CRUSH compression to pointer bitmaps table.
00c97227a FIX: compilation error when 'on-load/on-unload are defined.
142190a5d FEAT: stack pointers encoding now supports arbitrary number of args/locals.
360c1fde1 FEAT: preliminary support for accurate GC stack scanning.
```

These are the only commits I've merged with odbc-branch that contain changes to `system/compiler.r`.

Sadly, I'm not up to the task of `git bisect` ing me through all "offending" commits, because at every commit `bisect` not only would I have to `merge --no-commit` red-odbc and red-master branches, but would also need to `merge --no-commit` various red/red feature branches into red/red before doing so.

[22:06:20](#xUND9qCIpXAgEAtRYNx-gjQBBiNdK6OUpcmSP8brkck) <gurzgri>:
* Well, _maybe_ the answer can be found in one of the following commits (out of 169 in total) merged into red/red master:

```bash
Christian Ensel@SurfacePro7 MINGW64 ~/Development/red (master)
$ for id in $(git log --oneline e5acdea87^..e5acdea87 | cut -d' ' -f1); do files=$(git diff-tree --no-commit-id --name-only -r $id); [[ $files == *"system/compiler.r"*
 ]] && git show --oneline --name-status $id | head -1; done
cea2f8b08 FIX: various issues related to introduction of frames chaining slot on native stack.
3582e8940 FEAT: adds PIC mode support to stack frames chaining.
5eb693b46 FIX: implements a workaround for walking through a broken stack frames chain.
b07105961 FEAT: applies CRUSH compression to pointer bitmaps table.
00c97227a FIX: compilation error when 'on-load/on-unload are defined.
142190a5d FEAT: stack pointers encoding now supports arbitrary number of args/locals.
360c1fde1 FEAT: preliminary support for accurate GC stack scanning.
```

These are the only commits I've merged with odbc-branch that contain changes to `system/compiler.r`.

Sadly, I'm not up to the task of `git bisect` ing me through all "offending" commits, because at every commit `bisect` not only would I have to `merge --no-commit` red-odbc and red-master branches, but would also need to `merge --no-commit` various red/red feature branches into red/red before doing so.

[22:07:40](#2hVx5-TW0Nmqu51aus7z9ZdFGjPWxBuswxd_PUXQX_s) <gurzgri>:
* Well, _maybe_ the answer can be found in one of the following commits (out of 169 in total) merged into red/red master:

```bash
Christian Ensel@SurfacePro7 MINGW64 ~/Development/red (master)
$ for id in $(git log --oneline e5acdea87^..e5acdea87 | cut -d' ' -f1); do files=$(git diff-tree --no-commit-id --name-only -r $id); [[ $files == *"system/compiler.r"*
 ]] && git show --oneline --name-status $id | head -1; done
cea2f8b08 FIX: various issues related to introduction of frames chaining slot on native stack.
3582e8940 FEAT: adds PIC mode support to stack frames chaining.
5eb693b46 FIX: implements a workaround for walking through a broken stack frames chain.
b07105961 FEAT: applies CRUSH compression to pointer bitmaps table.
00c97227a FIX: compilation error when 'on-load/on-unload are defined.
142190a5d FEAT: stack pointers encoding now supports arbitrary number of args/locals.
360c1fde1 FEAT: preliminary support for accurate GC stack scanning.
```

These are the only commits I've merged with odbc-branch that contain changes to `system/compiler.r`.

Sadly, I'm not up to the task of `git bisect` ing me through all "offending" commits, because at every commit `bisect` suggests to check not only would I have to `merge --no-commit` red-odbc and red-master branches, but would also need to `merge --no-commit` various red/red feature branches into red/red before doing so.

[22:09:00](#Oi-amBiNRWze5vElAHXoUxmUPWQfeyx_WQpGayNMhvY) <gurzgri>:
* Well, _maybe_ the answer can be found in one of the following commits (out of 169 in total) merged into red/red master:

```bash
Christian Ensel@SurfacePro7 MINGW64 ~/Development/red (master)
$ for id in $(git log --oneline e5acdea87^..e5acdea87 | cut -d' ' -f1); do files=$(git diff-tree --no-commit-id --name-only -r $id); [[ $files == *"system/compiler.r"*
 ]] && git show --oneline --name-status $id | head -1; done
cea2f8b08 FIX: various issues related to introduction of frames chaining slot on native stack.
3582e8940 FEAT: adds PIC mode support to stack frames chaining.
5eb693b46 FIX: implements a workaround for walking through a broken stack frames chain.
b07105961 FEAT: applies CRUSH compression to pointer bitmaps table.
00c97227a FIX: compilation error when 'on-load/on-unload are defined.
142190a5d FEAT: stack pointers encoding now supports arbitrary number of args/locals.
360c1fde1 FEAT: preliminary support for accurate GC stack scanning.
```

These are the only commits I've merged with odbc-branch that contain changes to `system/compiler.r`. But I don't expect to be *that* easy ... ☹️

Sadly, I'm not up to the task of `git bisect` ing me through all "offending" commits, because at every commit `bisect` suggests to check not only would I have to `merge --no-commit` red-odbc and red-master branches, but would also need to `merge --no-commit` various red/red feature branches into red/red before doing so.

## 21-Jan-2025

[5:59:34](#FgDzH-fYJlpGGKniaZXbFyq45vCVI9T8RKq72G5eXWU) <hiiamboris>:
https://github.com/red/red/commit/9a6a2f18e64fc3397e24e159357a379bad0598ca#diff-df41b72ae0c14bae3a5fcec44adc77119091d41872265ccadc1a2eeb586d6facR28

## 22-Jan-2025

[6:34:57](#rn8CLI-0Sk1xIohIedoM1rNfdSHFoUa_kaQmancHi2s) <gurzgri>:
hiiamboris: I see, thank you very much! Wonder how you managed to identify that one so quickly …

And wonder what to do now. Using CLASS_NULL for the handles kind of works, but that value comes with the best before notice "to be removed". Am I supposed to add other handle classes to the enum, do you happen to know?

[11:58:33](#7z1W-exynI2IpDgkze5XN-GhHM7k6yDDhdQhxHINtjw) <GiuseppeChillemi (GiuseppeChillemi)>:
It happened to me with another coder I have found the solution to his VID drawing slowness. When you read each commit your mind thinks about what you have read and the current report and find the solution. (you was there in that discussion teach me how to test each change automatically using git)

[11:58:45](#qnCr5U8uff1sQbvTwqGbeSC7_Kmyn5xOsXkMrKYGQHw) <GiuseppeChillemi (GiuseppeChillemi)>:
* It happened to me with another coder, I have found the solution to his VID drawing slowness. When you read each commit your mind thinks about what you have read and the current report and find the solution. (you was there in that discussion teach me how to test each change automatically using git)

[12:59:35](#tvMfFirwu3BX02AMW6mmrY5gtv82p2nYR9-FO5VpyoU) <GiuseppeChillemi (GiuseppeChillemi)>:
* It happened to me with another coder, I have found the solution to his VID drawing slowness. When you read each commit your mind thinks about what you have read and the current report and find the solution. (you was there in that discussion, teaching me how to test each change automatically using git)

[14:19:07](#z9ug93CNJBLmA9ESz06L_6ZsWY9mFYwLuOKarYzjf-E) <hiiamboris>:
gurzgri from what I see in the code I guess the class is for molding purposes only.

[14:22:40](#NQDjecTnV2LlRZSUrZde7dxXJGrIUnIbkZiED_RSFJ8) <hiiamboris>:
> how you managed to identify that one

At first I scanned the code for double assignments, but only found (lots of) them in Red runtime. Appears that you *can* do multiple assignments as long as you're assigning a constant, not an expression.

Then it appeared to me that double assignment must be coming from one of the macros in the error report. But they contain only one set-word. So other set-word must come from skewed expression bounds, which can only come from wrong arity. So I just double-checked the function calls.

[17:12:54](#_QxdWOsS3XqAlDfxNZTDBHP7qGCKCeB4sQTVO7k6Arw) <gurzgri>:
> other set-word must come from skewed expression bounds

������ If only you wouldn’t make it sound so obvious … ������������

[19:07:56](#j4UW5fU7NIlBYb4K2UQy_7M9sRKzW5faZg-ZWIotat4) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov)  Pushed the fix.

## 23-Jan-2025

[9:27:01](#mCo4HI5Ny5oh0w2iaDXDAYvKyoFDWZjIGw9_yqY5geo) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: perfect! It works! Thanks!

## 27-Feb-2025

[7:03:45](#lqEurctCYb7mhi1rJUy5aVMIZdRdtaj_L2azdMdKP9w) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: hi! Could you do new merge? There is quite few new changes 

## 28-Feb-2025

[16:23:01](#QsBqKP7Lx-xh8E51INOzbeMXXhhFfEdIrr_8dwKceZc) <gurzgri>:
bubnenkoff (Dmitry Bubnenkov) Done.

## 1-Mar-2025

[9:22:39](#4c0wrSW0WF0W8CdDE7aXNyjlb9kPEFLYxbRU3m5bsAo) <bubnenkoff (Dmitry Bubnenkov)>:
bubnenkoff (Dmitry Bubnenkov) Done.

[9:33:53](#5-ZoR5vRzuzBU23JNdyHX6yXtebVBjhGIjE9AgZYp9k) <bubnenkoff (Dmitry Bubnenkov)>:
bubnenkoff (Dmitry Bubnenkov) Done.

## 2-Mar-2025

[21:23:50](#TalDb3BFYi2EG55tvTKAjTfMRE53Kmx0sgeXFLYhta8) <GiuseppeChillemi (GiuseppeChillemi)>:
I will wait another week and ask for a merge of the latest fixes, lets see if something new happen

[21:24:08](#se_SzihjyAKkPJbvT9neEKxkkz0EXlPLMRFzCGOj6cs) <GiuseppeChillemi (GiuseppeChillemi)>:
* I will wait another week and ask for a merge of the latest fixes, lets see if new bugs arise

## 12-Mar-2025

[8:47:18](#Fc5idlTC9fwOe9eaZcGUnaCbHUCb_hUQv8IN_xMIFp8) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: hi! I got crush without any error on follow code. Connection works fine. But extracting data crush app. I will try to PM SQL insert with sample of data.
```
Red [
    Title: "Tableau Login Names Extractor"
    Needs: [ODBC json]
]


; Configuration for connection
config: make object! [
    db-driver: "PostgreSQL ODBC Driver(ANSI)"
    db-server: "10.250.0.2"
    db-port: "5432"
    db-name: "postgres"
    db-user: "user"
    db-pass: "password"
]

; Variable to store the database connection
db-connection: none

; Function to connect to the database
connect-to-db: func [
    /local
    conn-str
    result
][
    ; Form the connection string
    conn-str: rejoin [
        "driver={" config/db-driver "};"
        "server=" config/db-server ";"
        "port=" config/db-port ";"
        "database=" config/db-name ";"
        "uid=" config/db-user ";"
        "pwd=" config/db-pass
    ]
    
    ; Try to establish the connection
    result: try [
        db-connection: open make port! [
            scheme: 'odbc
            target: conn-str
        ]
        true
    ]
    
    ; Output the connection result to the console
    either not error? result [
        print "SUCCESS: Connection successfully established!"
    ][
        print rejoin [
            "ERROR: Failed to connect^/"
            "Error message: " result/arg2
        ]
    ]
]

; Function to fetch login_name
fetch-login-names: func [
    /local
    statement
    query
    login-names
    result
][
    ; Check if the connection is active
    if none? db-connection [
        print "ERROR: Connect to the database first!"
        return none
    ]

    ; SQL query
    query: {
        SELECT
            id,
            login_name,
            user_id,
            user_name,
            permission,
            department,
            is_active,
            created_at,
            updated_at,
            effective_from,
            effective_to,
            log_diff
        FROM tableau.logins_permissions_hist
    }

    ; Try to execute the query
    result: try [
        ; Create statement for the query
        statement: open db-connection
        change statement [timeout: 2:00]

        ; Execute the query
        insert statement query

        ; Extract data
        login-names: copy []
        while [not tail? statement] [
            record: copy statement
            if not empty? record [
                append login-names record/2  ; login_name - second column (index 2)
            ]
            statement: next statement
        ]

        ; Close the statement
        close statement

        ; Output results to the console
        either empty? login-names [
            print "WARNING: No data found"
        ][
            print rejoin ["Found " length? login-names " records:"]
            foreach name login-names [
                print name
            ]
        ]
    ]

    ; Handle errors
    if error? result [
        print rejoin [
            "ERROR: Error executing query^/"
            "Error message: " result/arg2
        ]
    ]
]

; Main execution block
do [
    connect-to-db
    if db-connection [
        fetch-login-names
        close db-connection
    ]
]


; CREATE TABLE "tableau"."logins_permissions_hist" ( 
; 	"id" Integer DEFAULT nextval('tableau.logins_permissions_hist_id_seq'::regclass) NOT NULL,
; 	"login_name" Text,
; 	"user_id" Text,
; 	"user_name" Text,
; 	"permission" JSONB,
; 	"department" Text,
; 	"is_active" Integer,
; 	"created_at" Timestamp With Time Zone,
; 	"updated_at" Timestamp With Time Zone,
; 	"effective_from" Timestamp With Time Zone,
; 	"effective_to" Timestamp Without Time Zone,
; 	"log_diff" JSONB,
; 	PRIMARY KEY ( "id" ) );
;  ;
````

[21:50:11](#Mctt9bTD__ULjNqKGXH6gw_B6zQ8vSahelE1YUh-um0) <gurzgri>:
Best advice to give from the distance probably is: try to narrow it down to a specific row and maybe a specfic column. Eventually try with a `--debug` enabled console and remember to make use of `statement/state/debug?: on` (same as `change statement [debug?: on]` ).  

## 13-Mar-2025

[7:39:54](#h-fLKinKqgeady8ZoYWE9aXXqjowiOk3VT-a7_kz5_8) <bubnenkoff (Dmitry Bubnenkov)>:
```
>> do %/D/work/tableau/users_and_groups/app_test.red
actor/open: connection
init-odbc
OPEN-ENVIRONMENT [
        SQLAllocHandle 0
        henv/value = 56558800
        SQLSetEnvAttr 0
]
        init-odbc: 0
OPEN-CONNECTION [
        SQLAllocHandle 0
        hcon/value = 56614376
        SQLDriverConnect 0
]
SUCCESS: Connection successfully established!
actor/open: statement
OPEN-STATEMENT [
        SQLAllocHandle 0
        hstm/value = 56615704
]
INSERT actor
OPEN? actor
FREE-PARAMETERS [
]
FREE-COLUMNS [
FREE-STATEMENT [
        SQLFreeStmt 0
        SQLFreeStmt 0
        SQLFreeStmt 0
]
PREPARE-STATEMENT [
        SQLPrepare 0
]
EXECUTE-STATEMENT [
        SQLExecute 0
]
describe-result
AFFECTED-ROWS [
        SQLRowCount 0
]
COUNT-COLUMNS [
        SQLNumResultCols 0
]
DESCRIBE-COLUMNS [
        hstm/value = 56615704
        allocate nam-buf, 256 bytes @ 02D105B8 ok.

        col = 1
        SQLDescribeCol 0
        nam-len = 2, name = id, sql-type = 4, col-size = 10, digits = 0, nullable = 0
        c-type = 4, col-slotlen = 4

        col = 2
        SQLDescribeCol 0
        nam-len = 10, name = login_name, sql-type = 65535, col-size = 8190, digits = 0, nullable = 1
        c-type = 65528, col-slotlen = 8162

        col = 3
        SQLDescribeCol 0
        nam-len = 7, name = user_id, sql-type = 65535, col-size = 8190, digits = 0, nullable = 1
        c-type = 65528, col-slotlen = 8162

        col = 4
        SQLDescribeCol 0
        nam-len = 9, name = user_name, sql-type = 65535, col-size = 8190, digits = 0, nullable = 1
        c-type = 65528, col-slotlen = 8162

        free nam-buf @ 02D105B8 ok.
]
TAIL? actor
OPEN? actor
INDEX? actor
OPEN? actor
COPY actor
OPEN? actor
return-columns
BIND-COLUMNS [
        hstm/value = 56615704
        allocate row-buf, 2048 bytes @ 02D105B8 ok.
SET-STATEMENT [

*** Runtime Error 1: access violation
*** in file: /C/red-odbc-debug/runtime/datatypes/object.reds
*** at line: 81
***
***   --Frame-- --Code--  --Call--
***   011AE7FCh 0045DB11h red/object/get-values 04DE745Ch
***   011AE824h 005387B3h ctx||585~set-statement 04DE745Ch 5 0 0
***   011AE89Ch 0053BC83h ctx||585~bind-columns 04DE745Ch
***   011AE8F8h 0050D2C1h ctx||585~retrieve-columns 035045ACh
***   011AE940h 0049BB62h red/interpreter/call 04DE739Ch 035045ACh 0591C3B4h 0
***   011AE988h 0049DE2Bh red/interpreter/eval-code 0587C44Ch 0591C3F4h 0591C3F4h 0591C38Ch false 00000000h 00000000h 0587C44Ch 0 false
***   011AEA0Ch 0049E6D7h red/interpreter/eval-expression 0591C3C4h 0591C3F4h 0591C38Ch false false false
***   011AEA5Ch 0049ECDEh red/interpreter/eval 0591C38Ch true
***   011AEA90h 004872B4h red/natives/switch* true 2
***   011AEAD0h 00510006h ctx||585~dispatch 035045ACh
***   011AEAFCh 00510799h ctx||585~copy 035045ACh
***   011AEB44h 0049BB62h red/interpreter/call 0587C5BCh 035045ACh 04DC21BCh 32
***   011AEB74h 00476A92h red/port/call-function 059EB59Ch 04DC21BCh
***   011AEBA0h 00477700h red/port/copy 04DE72ECh 04DE72FCh 04DE72DCh false 04DE72DCh
***   011AEBD4h 00484746h red/actions/copy 04DE72ECh 04DE72FCh 04DE72DCh false 04DE72DCh
***   011AEC04h 004846DDh red/actions/copy* -1 -1 -1
***   011AED00h 0049DAADh red/interpreter/eval-arguments 04DE72DCh 059E56FCh 059E579Ch 04DE72BCh 00000000h 00000000h 0 false
***   011AED58h 0049DC4Eh red/interpreter/eval-code 056EFECCh 059E56ECh 059E579Ch 04DE72BCh true 00000000h 00000000h 056EFECCh 0 false
***   011AEDDCh 0049E6D7h red/interpreter/eval-expression 059E56ECh 059E579Ch 04DE72BCh false true false
***   011AEE50h 0049E2AEh red/interpreter/eval-expression 059E56DCh 059E579Ch 04DE72BCh false false false
***   011AEEA0h 0049ECDEh red/interpreter/eval 04DE72BCh true
***   011AEED0h 0048609Ah red/natives/while* false
***   011AEFC4h 0049DAADh red/interpreter/eval-arguments 04DE729Ch 059E55D4h 059E5644h 04DE728Ch 00000000h 00000000h 0 false
***   011AF01Ch 0049DC4Eh red/interpreter/eval-code 056EFE5Ch 059E55B4h 059E5644h 04DE728Ch false 00000000h 00000000h 056EFE5Ch 0 false
***   011AF0A0h 0049E6D7h red/interpreter/eval-expression 059E55B4h 059E5644h 04DE728Ch false false false
***   011AF0F0h 0049ECDEh red/interpreter/eval 04DE728Ch true
***   011AF124h 0048AF45h red/natives/try* false -1 -1
***   011AF220h 0049DAADh red/interpreter/eval-arguments 04DE727Ch 059E5464h 059E54A4h 059E5224h 00000000h 00000000h 0 false
***   011AF278h 0049DC4Eh red/interpreter/eval-code 056F031Ch 059E5454h 059E54A4h 059E5224h true 00000000h 00000000h 056F031Ch 0 false
***   011AF2FCh 0049E6D7h red/interpreter/eval-expression 059E5454h 059E54A4h 059E5224h false true false
***   011AF370h 0049E2AEh red/interpreter/eval-expression 059E5444h 059E54A4h 059E5224h false false false
***   011AF3C0h 0049ECDEh red/interpreter/eval 059E5224h true
***   011AF400h 0049BD60h red/interpreter/eval-function 04DE720Ch 059E5224h 059E306Ch
***   011AF448h 0049BAA0h red/interpreter/call 04DE720Ch 034F0038h 059E306Ch 0
***   011AF490h 0049DE2Bh red/interpreter/eval-code 056FC6ECh 059E307Ch 059E309Ch 04DE71FCh false 00000000h 00000000h 056FC6ECh 0 false
***   011AF514h 0049E6D7h red/interpreter/eval-expression 059E307Ch 059E309Ch 04DE71FCh false false false
***   011AF564h 0049ECDEh red/interpreter/eval 04DE71FCh true
***   011AF584h 00485D1Bh red/natives/if* false
***   011AF678h 0049DAADh red/interpreter/eval-arguments 04DE71DCh 059E30F4h 059E30F4h 04DE71CCh 00000000h 00000000h 0 false
***   011AF6D0h 0049DC4Eh red/interpreter/eval-code 056EFF0Ch 059E30D4h 059E30F4h 04DE71CCh false 00000000h 00000000h 056EFF0Ch 0 false
***   011AF754h 0049E6D7h red/interpreter/eval-expression 059E30D4h 059E30F4h 04DE71CCh false false false
***   011AF7A4h 0049ECDEh red/interpreter/eval 04DE71CCh true
***   011AF804h 004874F3h red/natives/do* false -1 -1 -1 -1
***   011AF908h 0049DAADh red/interpreter/eval-arguments 04DE71BCh 059E322Ch 059E322Ch 04DE719Ch 00000000h 00000000h 0 false
***   011AF960h 0049DC4Eh red/interpreter/eval-code 056F0CECh 059E321Ch 059E322Ch 04DE719Ch false 00000000h 00000000h 056F0CECh 0 false
***   011AF9E4h 0049E6D7h red/interpreter/eval-expression 059E321Ch 059E322Ch 04DE719Ch false false false
***   011AFA34h 0049ECDEh red/interpreter/eval 04DE719Ch true
***   011AFA74h 0048B6E1h red/natives/catch* true 1
***   011AFB14h 004C5B51h do-file
***   011AFB68h 004877BFh red/natives/do* false -1 -1 -1 -1
***   011AFC6Ch 0049DAADh red/interpreter/eval-arguments 04DE707Ch 059E095Ch 059E095Ch 04DE705Ch 00000000h 00000000h 0 false
***   011AFCC4h 0049DC4Eh red/interpreter/eval-code 056F0CECh 059E094Ch 059E095Ch 04DE705Ch false 00000000h 00000000h 056F0CECh 0 false
***   011AFD48h 0049E6D7h red/interpreter/eval-expression 059E094Ch 059E095Ch 04DE705Ch false false false
***   011AFD98h 0049ECDEh red/interpreter/eval 04DE705Ch true
***   011AFDD8h 0048B6E1h red/natives/catch* true 1
***   011AFE20h 0051DA9Bh ctx||688~try-do 03508E64h
***   011AFE7Ch 0051DF2Dh ctx||688~do-command 03508E64h
***   011AFEA8h 0051ED23h ctx||688~eval-command 03508E64h
***   011AFEE4h 0051F38Fh ctx||688~run 03508E64h
***   011AFF38h 0051FC8Dh ctx||688~launch 03508E64h
***   011AFF5Ch 0052131Ch ctx||707~launch 03509470h
***   011AFF74h 004244E9h <external>
***   011AFF84h 76F15D49h <external>
***   011AFFDCh 77E6CE3Bh <external>
***   011AFFECh 77E6CDC1h <external>
```
With `--debug` 


[12:00:57](#ePyA3rhcEgXthWZOrm2Jo7hUyns1nn1igTjUkHnsPOw) <gurzgri>:
At this point the only conclusion to draw from the debugging output is: an error happens if you do whatever your app_test.red I don’t know does.

[12:17:01](#vt2SGiNkiz7efADeHg4x_5Jza3K3_uU5CbUdNGETJG8) <bubnenkoff (Dmitry Bubnenkov)>:
please say in another words... I did not understand. Itried again. It seems that it crush in this code:
```
        while [not tail? statement] [
            record: copy statement
            if not empty? record [
                print login_name
                ;append login-names record/2  ; login_name - second column (index 2)
            ]
            statement: next statement
        ]

```

[12:30:13](#kdmXPxVvwoS3HVLCaT4x5wlR9Omm4sVln2K7AgN8BWM) <bubnenkoff (Dmitry Bubnenkov)>:
Same with next code:
```
insert statement query
records: copy statement
foreach record records [
    print "aa"
]
```

[14:24:32](#gNngV-eAv0kWK4It_fETTt3g4TbG-K5-2MS0BZMvnwQ) <bubnenkoff (Dmitry Bubnenkov)>:
```

; Function to fetch login_name
fetch-login-names: func [
    /local
    statement
    query
    login-names
    result
][
    ; Check if the connection is active
    if none? db-connection [
        print "ERROR: Connect to the database first!"
        return none
    ]

    ; SQL query
    query: {
        SELECT 1 + 1
    }

    ; Try to execute the query
    result: try [
        ; Create statement for the query
        statement: open db-connection
        ; change statement [timeout: 2:00]

        ; Execute the query
        insert statement query
        rows: copy statement  ; Получаем все строки сразу
        either empty? rows [
            print "WARNING: No data found"
        ][
            print rejoin ["Found " length? rows " records:"]
            foreach row rows [
                login-name: pick row 2  ; Второй столбец — login_name
                print login-name
            ]
        ]
        close statement

    ]

    ; Handle errors
    if error? result [
        print rejoin [
            "ERROR: Error executing query^/"
            "Error message: " result/arg2
        ]
    ]
]

; Main execution block
do [
    connect-to-db
    if db-connection [
        fetch-login-names
        close db-connection
    ]
]

```

same crush on SELECT 1 + 1

[15:32:44](#anMy4NiNJnSJmhU8XbWkq-HTAjBYC64EA5CoqWUcspw) <bubnenkoff (Dmitry Bubnenkov)>:
Same issue with local PG 15 and remote PG 16.


[21:20:00](#EkASDR6OpwVIzhd7TcVCkax4PasBB5hdt0BdxMnaYmA) <gurzgri>:
Looks like you're confusing `copy` and `next`, confusing retrieval of all rows vs. retrieval of just a window'ed row-set. `copy` doesn't return a single row, it returns a block of all rows in the result-set. `next` doesn't return a single row either, a first `next` returns a block of all the rows in the first row-set of the result-set only, a second `next` returns a block of all rows in the second row-set of the same result-set and so on, until a last `next` returns an empty block when there are no more row-sets in the result-set. So mixing `copy` and `next` likely is the culprit here.  
Does
```
      database:   "driver={PostgreSQL ODBC Driver(ANSI)};server=10.250.0.2;port=5432;database=postgres;uid=<username>;pwd=<password>"
      statement: open connection: open make port! [scheme: 'odbc target: database]
probe columns:    insert statement "SELECT id, login_name FROM tableau.logins_permissions_hist"
probe logins:     collect [foreach record records: copy statement [set :columns record keep login-name]]
```
work (that's the essence of what your 150+ lines are doing)?

[21:20:19](#g6-Tb4CJZl1EpNjh0-2HQKXgE6q0DTAgwqXG0qOY7mo) <gurzgri>:
* Looks like you're confusing `copy` and `next`, confusing retrieval of all rows vs. retrieval of just a window'ed row-set. `copy` doesn't return a single row, it returns a block of all rows in the result-set. `next` doesn't return a single row either, a first `next` returns a block of all the rows in the first row-set of the result-set only, a second `next` returns a block of all rows in the second row-set of the same result-set and so on, until a last `next` returns an empty block when there are no more row-sets in the result-set. So mixing `copy` and `next` likely is the culprit here.

Does

```
      database:  "driver={PostgreSQL ODBC Driver(ANSI)};server=10.250.0.2;port=5432;database=postgres;uid=<username>;pwd=<password>"
      statement: open connection: open make port! [scheme: 'odbc target: database]
probe columns:   insert statement "SELECT id, login_name FROM tableau.logins_permissions_hist"
probe logins:    collect [foreach record records: copy statement [set :columns record keep login-name]]
```

work (that's the essence of what your 150+ lines are doing)?

[21:52:06](#Vbt4S9Z7tIQFCauewY6mgivwFlYvgrd3vc7BUDnENlQ) <gurzgri>:
* Looks like you're confusing `copy` and `next`, confusing retrieval of all rows vs. retrieval of just a window'ed row-set. `copy` doesn't return a single row, it returns a block of all rows in the result-set. `next` doesn't return a single row either, a first `next` returns a block of all the rows in the first row-set of the result-set only, a second `next` returns a block of all rows in the second row-set of the same result-set and so on, until a last `next` returns an empty block when there are no more row-sets in the result-set. So mixing `copy` and `next` likely is the culprit here.

Does

```
      database:  "driver={PostgreSQL ODBC Driver(ANSI)};server=10.250.0.2;port=5432;database=postgres;uid=<username>;pwd=<password>"
      statement: open connection: open make port! [scheme: 'odbc target: database]
probe columns:   insert statement "SELECT id, login_name FROM tableau.logins_permissions_hist"
probe logins:    collect [foreach record records: copy statement [set columns record keep login-name]]
```

work (that's the essence of what your 150+ lines are doing)?

[22:31:12](#WswRDPQIDrR1K3ye-HbTwxx7dYQzIXABuvWVYQEC2Pk) <gurzgri>:
Especially be aware of the restrictions that apply when [Positioning the Current Rowset](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md#positioning-the-current-rowset-paging), e.g.:
> You can't use head?, tail? and index? prior to fetching at least one rowset with head, next, back, tail (or copy).

So `while [tail? statement] [records: next statement tail? statement]` isn't possible but `until [records: next statement tail? statement]` and `while [not empty? records: next statement] [...]` are — given you are *purposely* trying to work with row-sets and not just want to `records: copy statement` and then loop thru `records` row-wise over *all* rows.

And `statement: next statement` is just plain wrong: `statement` isn't a `series!` but a `port!` and `next statement` doesn't returns a `port!` but a mere `block!` , you're about to losing access to the statement with such an assignment.

## 14-Mar-2025

[12:45:57](#7Yn1aTLLbiVrsW9Vy3ADtwK8NREV2a_Xdp46zjsAMkI) <bubnenkoff (Dmitry Bubnenkov)>:
thanks for explanation 

## 20-Mar-2025

[7:13:05](#MdCInubgKEl_urFdz-ERjYiZC2AaJ88PVOvPnMJkhAk) <bubnenkoff (Dmitry Bubnenkov)>:
gurzgri: 0.6.6 released! Could you do new merge?

[17:24:07](#MLuFF0DpRzIE-w-M14CuLKvIXDdKOE-CDRV2NCq3UwU) <gurzgri>:
Done.

## 21-Mar-2025

[7:18:55](#E3YUHx5-2fOwzyDXtoEMBYtT2qSvHRTtK3auQQksaTs) <bubnenkoff (Dmitry Bubnenkov)>:
thanks!

## 15-May-2025

[23:20:51](#pdoV9Ed1bFcdaKjOhTSH0Wneq3VFg0KXK-R_IZaPT8I) <GiuseppeChillemi (GiuseppeChillemi)>:
I am resurrecting old code becase I need it in the following days.

[23:21:07](#CX1f6ttit8jPUtXbhoSCYAP7DaX0VRgjKQSk_tT2Mzg) <GiuseppeChillemi (GiuseppeChillemi)>:
What is this error:

```
*** Access Error: scheme is unknown: [scheme: 'odbc target: {driver={SQL Server};server=DIBI2012R2-01\SQL2016
```


[23:53:50](#u-FE9lYrAKA6QM1oCG0khnNGRI67IlM7FJLxV97WJ6M) <GiuseppeChillemi (GiuseppeChillemi)>:
Ok, I have find the cause: I have dpwnloaded the wrong archive

[23:54:09](#1SyC-S7l8vLr_s03ZftO3dO67GuP6TzTonOJJOo37JI) <GiuseppeChillemi (GiuseppeChillemi)>:
Could you please merge to the latest Red Version?

## 16-May-2025

[0:35:16](#3avTY1u3qLCsNzQ5FvKzgVtSmwq-ONGvEJF1Litbs5s) <GiuseppeChillemi (GiuseppeChillemi)>:
Forget my request. Lets wait for the bug fix on context

[0:35:45](#RDZsIHITlw0S2aZHbv-AkFncNZl_PZ3SqtixDbJ3f_Y) <GiuseppeChillemi (GiuseppeChillemi)>:
I am actually having creashes and need to run the debug console. Too much has changed

## 9-Jun-2025

[11:10:46](#nzTVqCYS4OSnELbpwN57upxplhBA2peVf4s8oScIat8) <bubnenkoff (Dmitry Bubnenkov)>:
GiuseppeChillemi (GiuseppeChillemi): hi! About "Lets wait for the bug fix on context" what bug do you talk?

[11:48:37](#tqcCoKvxnuXnfk56zk4tB2pmW1slReY71LF8kO-TTBI) <GiuseppeChillemi (GiuseppeChillemi)>:
A solved one. 

[11:49:30](#mpmKRyIOoPqbWrIVs1pMeDut5VLaTUoJuU-gS8gb2MM) <GiuseppeChillemi (GiuseppeChillemi)>:
Now it can be merged, we have a new text table too and its mantainer has survived and is alive.

[12:28:58](#yNlpRSS_0yQ2L1s97gKfglopxa3E_DZ81JlhnuZ18ew) <bubnenkoff (Dmitry Bubnenkov)>:
GiuseppeChillemi (GiuseppeChillemi):  Did you find bug in ODBC driver?

[13:58:56](#lwFToEs6pKkH374RJfNtB_SyMzsyyhBgSZlqS9a7RFQ) <GiuseppeChillemi (GiuseppeChillemi)>:
no, absolutely 

## 10-Jun-2025

[14:59:11](#kAdf63szqELmkv7gXOBeiHxijgjBXjK3W843iA6chqA) <gurzgri>:
GiuseppeChillemi (GiuseppeChillemi)  
> Now it can be merged
To your service. Fetched and merged recent development from upstream red:master.

[14:59:18](#r7kk13tv_rqcrhpcetth48k6L5O267yRTtBtmIXYWc4) <gurzgri>:
* GiuseppeChillemi (GiuseppeChillemi)

> Now it can be merged

To your service. Fetched and merged recent development from upstream red:master.

[14:59:33](#huENtNc-1K3QqSjxDteYXq9IpT7Wh2PFJOASsIlhgWs) <gurzgri>:
* GiuseppeChillemi (GiuseppeChillemi)

> Now it can be merged

To your service. Fetched and merged recent Red development from upstream red:master.

[18:28:36](#klrbpK4c6xdJXtbnrv6CEl3XtzOkh4UeNTYhoqfUORc) <GiuseppeChillemi (GiuseppeChillemi)>:
Mille grazie!

## 10-Aug-2025

[7:51:30](#FmpLZDczf-ADqpZIERF3XMHbNVpiWJfZWueHkhYkXno) <GiuseppeChillemi (GiuseppeChillemi)>:
Could you please make another merge? 

[8:56:43](#ZQlHt6SZsMw1wxdG0JzQIgutpFiiXYpPXYBsn0rhC_Q) <gurzgri>:
Last merge was 2 months ago, today Red was a only 8 commits ahead. I really wonder how you benefit from these, making you ask for another merge.

[12:38:53](#nUFSWQWAPdoEQ03HyMZnln_4Pcx9B4R2-e60pMFUYao) <GiuseppeChillemi (GiuseppeChillemi)>:
With that version I have had problems connecting to the database I need to use. So I want to debug with the lastest one to avoid a "have you updraded"? question.

[12:39:40](#CqrzZxjUvqQBXyEOgRJidaEvwjhprhPUJe93A6U0Z5s) <GiuseppeChillemi (GiuseppeChillemi)>:
* With that version I have had problems connecting to the database I need to use. So I want to debug with the lastest one to avoid  a "we should try with the latest one" 

[13:09:02](#l4ZJ6cTs3OIdUTx5FrwH-xmxrDstSO6cKr4QpD_poBQ) <gurzgri>:
Interesting. But there is no active development on that ODBC fork. Merging is for merging Red development into that stalled ODBC. So don‘t expect the merged version do anything other than before.

[13:22:04](#O9kypNX9SNza4Jl2PGtxWomq04mxLgvCmfAZtqq-t7k) <GiuseppeChillemi (GiuseppeChillemi)>:
OK

