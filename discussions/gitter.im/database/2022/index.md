# Archived messages from: [gitter.im/red/database](/gitter.im/red/database/) from year: 2022

## Friday 18th March, 2022

Respectech

[22:17](#msg623504ebddcba117a22b05b4)Hello!

[22:17](#msg623504f8d1b64840db7251c0)I want Red DB support for MySQL. :-)

GiuseppeChillemi

[23:36](#msg623517806b912423203e711a)Hooray! Thank you @Respectech and @greggirwin

[23:39](#msg6235183a9a09ab24f3aeec78)@gurzgri @rebolek We are waiting for you!

## Saturday 19th March, 2022

gurzgri

[00:46](#msg623527e209092523182f8bf8)Hi

rebolek

[06:48](#msg62357cca0909252318302136)Hello :)

[06:48](#msg62357cccf43b6d783f0b3fee)https://gitlab.com/rebolek/protocols/-/blob/main/mysql/mysql-client.red

[06:49](#msg62357d02c435002500fa9f30)This is an initial commit, able to connect to DB.

GiuseppeChillemi

[18:11](#msg62361cc2c435002500fbc5e2)We have R3 atronix and Doc code that could be used

[22:43](#msg62365c9c3ae95a1ec1a8d7a3)I mean: could be used to build on your code and shorten the development time

## Sunday 20th March, 2022

rebolek

[07:29](#msg6236d7e1090925231832908f)I know about previous efforts, thanks. Just for reference, here are the links:

\* \[Doc’s MySQL (R2)](https://www.softinnov.org/rebol/mysql.shtml)  
\* \[Atronix’ MySQL (R3)](https://github.com/zsx/mysql-r3)

gurzgri

[07:41](#msg6236dac56b91242320418d19)https://github.com/gurzgri/red/tree/odbc should do for MySQL too, even if untested against it.

## Monday 21st March, 2022

Respectech

[23:28](#msg62390a049a09ab24f3b62eb1)@rebolek Amazing!

## Tuesday 29th March, 2022

GiuseppeChillemi

[16:52](#msg624339613ae95a1ec1c11d40)@gurzgri I have compiled the Red Sources but I do not find the usage documentation, could you please help?

[18:06](#msg62434aa509092523184a3df6)Well, I have found the documentation:  
https://github.com/gurzgri/red/blob/odbc/environment/schemes/odbc.md

[18:07](#msg62434acbf43b6d783f255623)And queried: using

```
probe system/schemes/odbc/state/sources
```

[18:07](#msg62434aea99d94f5f0c7447de)All my sources where 64bit so I am ging to create a new DNS entry

[18:58](#msg624356bfe9cb3c52ae3c8c49)Well I have not gone beyond some connection attempts, because I have "runtime errors" and connection errors and also console hanging. Also the console outputs driver messages like a typewriter: on char by one  
Running `console.exe` I have been able to see the output errors.

## Wednesday 30th March, 2022

gurzgri

[17:34](#msg6244949c257a3578255496bd)@GiuseppeChillemi I might be able to provide some support for this, given you provide the full output of

```
probe system/schemes/odbc/state/drivers
```

and

```
probe system/schemes/odbc/state/sources
```

and provide the code you use to connect (via DSN and/or connection string, if DSN please accompany this with screenshots of the 32bit odbc admin pannel. Please supply the exact driver version(s) you're using) together with the output of such a failing connection attempt if run in a `console.exe` compiled in `---debug` mode.  
Put all this in a gist please or post it in private channel.

GiuseppeChillemi

[17:43](#msg624496a4257a357825549bc2)@gurzgri  
You already have a lot on the Ticket I have opened but I am going to add these additional info

[18:06](#msg62449c0e9a09ab24f3cc4358)Everything now there. Feel free to contact me for further questions.

gurzgri

[18:12](#msg62449d9d9a09ab24f3cc46ea):+1: Didn't knew about that ticket up until just now, because no notification email was configured. The gui-console "typewriter mode" is interesting, I practically never ever used the GUI console for anything. I'll have a look.

[19:03](#msg6244a96d257a35782554c113)Sadly, I have no access to a SQL Server DB. Is any of the following

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

a turn for the better? And if it is "=Yes" already, does "=No" help? Likely a ANSI&lt;&gt;Unicode issue, the odbc scheme is reliant upon receiving Unicode strings. Otherwise trying to treat buffers as `string!`s is bound to fail.

GiuseppeChillemi

[20:03](#msg6244b7a9f43b6d783f282096)I will return at home later and I will remotely connect to the office to try it

gurzgri

[21:42](#msg6244ceadc43500250017d810)I remember having a similiar issue with the Jet Engine / Text Driver. Tthere it was `CharacterSet=Unicode` what solved it, but these connection string params differ from database to database and/or from driver to driver. For SQL Server there is no option with this name and "AutoTranslate" being the closest fit.

GiuseppeChillemi

[22:01](#msg6244d31f0466b352a44387a0)No one has worked and everyone has returned an error, but...

[22:01](#msg6244d33fc43500250017e155)

```
connection: open make port! [
    scheme: 'odbc
    target: "driver={SQL Server};server=192.168.x.x;port=1433;database=ADB_RD32;uid=********;pwd=********;AutoTranslate=yes"
]
```

This one was able to hang the console

[22:02](#msg6244d370d1b64840db9055f9)Also, in the Admin panel I have "translate charaters" flagged for the data source.

gurzgri

[22:16](#msg6244d6cb0466b352a4438f2a)Would be nice to see where it hangs/failed in a —debug compiled (CLI) console

GiuseppeChillemi

[22:17](#msg6244d6e89a09ab24f3ccbbbc)One of the most interesting result come from these commands:

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

[22:17](#msg6244d711c43500250017e87c)I can try to compile it with debug on.

gurzgri

[22:38](#msg6244dbf8c43500250017f161)These two error message look like totally legit connections errors due to some misconfiguration re: the user auth method. See e.g. https://dba.stackexchange.com/questions/29992/odbc-data-source-sql-server-connection-login-failed-for-user , that seems to be an recurring ODBC issue with SQL Server, but not so much odbc:// scheme related.

GiuseppeChillemi

[22:39](#msg6244dc2e6b912423205c70eb)@gurzgri

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

[22:39](#msg6244dc34d1b64840db906838)But!....

[22:40](#msg6244dc706b912423205c7170)Please take a look at the line before the last:

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

[22:42](#msg6244dcba6b912423205c71fb)

```
....server=192.168.0.5;d}
```

[22:42](#msg6244dce9257a357825552398)Why does the server string has `d` as last char?

gurzgri

[22:42](#msg6244dced6b912423205c7249)afaik `*** Near` only cites so much from your code.

GiuseppeChillemi

[22:44](#msg6244dd313ae95a1ec1c469c7)Ok, so it is not a parsing problem

gurzgri

[22:47](#msg6244ddeac61ef0178e9b4818)And `select-key*` isn't a function belonging to the scheme.

GiuseppeChillemi

[22:48](#msg6244de4ae9cb3c52ae3f9e66)I don know where to search it but I remember such naming comes from Red source, so it could be a Port code Bug.

gurzgri

[22:49](#msg6244de61161ffc40d7de6dac)No, no parsing there. The connection string or the alternatively the DSN ist just passed as is to the driver. He handles all the parsing. What happens here is the odbc:// correctly advises the driver to connect, but the criver can't connect, so it fails. The scheme errors out with the error message it recieves from the driver.

[22:50](#msg6244de9a3ae95a1ec1c46c04)I do not assume a bug in nether Red nor the scheme's code given these error messages.

[22:50](#msg6244dea58db2b95f0a91c1c4)\*neither

GiuseppeChillemi

[22:50](#msg6244dec76b912423205c75b7)"Non-existant SQL Server", has led me to think it could be an erroneous server string damaged somewhere by the code.

gurzgri

[22:57](#msg6244e05299d94f5f0c777608)As per the system/schemes/odbc/state/sources you posted, you have two `DSN`ames `RD32` and `RD32B`. You sure that these can connect when you connection-test them in the 32bit odbc admin panell?

GiuseppeChillemi

[23:15](#msg6244e4a099d94f5f0c777de1)Yes, I can connect.

[23:15](#msg6244e4ae99d94f5f0c777deb)However, I was able to have a Red error:

[23:16](#msg6244e4d9d1b64840db9077d7)

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

[23:18](#msg6244e52ae9cb3c52ae3fac54)1) Removed `port=1433`  
2\) Change 'server=192.160.0.x`to`server\\sqservername\`

[23:18](#msg6244e547161ffc40d7de7ba2)It seems you cannot use the IP address but a full name.

[23:18](#msg6244e55909092523184d710d)Also `port` is not recognized as attribute.

[23:19](#msg6244e576ddcba117a2491824)So, as you can se, we have just a: `invalid UTF-8 encoding: #{C0C1C2C3}`

[23:21](#msg6244e5fcf43b6d783f287af2)I have the same error when I load an ASCII source in Red but with accented character which are ASCII &gt; 128

gurzgri

[23:23](#msg6244e66ec61ef0178e9b5861)That‘s the ANSI&lt;&gt;Unicode thing from above. But at least the connection is there, we can from there. But need to get some sleep now.

GiuseppeChillemi

[23:30](#msg6244e828c43500250018077c)Yes, it's very late here. See you tomorrow.

## Thursday 31st March, 2022

greggirwin

[17:46](#msg6245e910ddcba117a24b121f)Thanks for pushing on this @GiuseppeChillemi and @gurzgri. :+1:

gurzgri

[19:32](#msg624601eb09092523184f9481)@GiuseppeChillemi I pushed a commit providing more verbose debugging output whilst collecting connection information once the connection has been established. Please pull again and repeat your last successfull `switch 'b con` in a --debug CLI console (because the GUI won't provide debug information printed on R/S level).

And for the sake of completeness: What is this `switch 'b con` connection method looking like? You posted only the code for `'c` and `'d`.

Finally, regarding the GUI "typewriter" mode (I like that metaphor): I don't suffer from this here. It's not as fast as the CLI, but is not slow, not "typewriter slow", far from.

GiuseppeChillemi

[22:00](#msg624624809bd1c71ecaccdf6d)@gurzgri I have tried but console debug output is too long. How could I redirect it to text file?

[22:07](#msg62462621161ffc40d7e0e978)`b` is the following:

```
b-ok [
	connection: open make port! [
	    scheme: 'odbc
	    target: "driver={SQL Server};server=DIBI2012\SQL2014;database=ADB_RAVIOL_DORO;uid=*********;pwd=********;AutoTranslate=yes"
	]
]
```

[22:15](#msg624627f809092523184fe4bc)This is typewriter mode:

https://i.imgur.com/s25sMqi.gif

[22:15](#msg6246281b8db2b95f0a944e2b)(Note the sudden crash at the end)

[22:41](#msg62462e119a09ab24f3cf5a1e)Using copy&amp;paste I have captured the following: https://gist.github.com/GiuseppeChillemi/7072a84f997b9092e93601bc6056a6ad , more when I will know how to redirect the output of the console to a file.

## Friday 1st April, 2022

toomasv

[04:23](#msg62467e3c8db2b95f0a94ea1e)Conversion problem. Codes should be converted to integers first:

```
>> to-char to-integer #{c0}
== #"À"
```

gurzgri

[12:51](#msg6246f55c257a3578255936fc)@toomasv Kind of.

[12:56](#msg6246f663c61ef0178e9f6463)I erroneously wasn't using the unicode SQLGetInfoW in favour of SQLGetInfo. With the wide version no conversion is needed on Red/System's side, it can just `string/load` from UTF-16LE encoded buffer. Thanks anyway!

[12:59](#msg6246f725f43b6d783f2c8ad3)@GiuseppeChillemi Pushed a fix for that. Would be great if you can test it with and without AutoTranslate to see if makes a difference (it shouldn't, I'm attempted to say) and report back if this gets you over the "about-connection" step.

GiuseppeChillemi

[16:38](#msg62472a6e9bd1c71ecaceeb95)It seems the connection has been established. Now I will compile the console with no `--debug` and try some queries. Typewriter mode is still there, so I can't use the GUI.

gurzgri

[16:43](#msg62472b969a09ab24f3d143e7):+1: You might even want to rename a --debug enabled console, than you can try in both versions easily if you run into problems again.

GiuseppeChillemi

[16:43](#msg62472baff43b6d783f2cf7c4)Already did it

gurzgri

[16:43](#msg62472bc28db2b95f0a96535d)clever ;-)

[16:44](#msg62472bfcf43b6d783f2cf82f)"typewriter mode" I haven't addressed yet, but I might have an idea what's causing it.

GiuseppeChillemi

[16:48](#msg62472ce7ddcba117a24da2ed)Is a statement an object made with connection as a proto? I see they have the same words

gurzgri

[16:50](#msg62472d52257a35782559ac91)no. statements are statements, connections are connections. but they are both ports, that's the common denominator.

GiuseppeChillemi

[16:55](#msg62472e8d8db2b95f0a965a4d)I have the first results

gurzgri

[16:58](#msg62472f4ed1b64840db94fba8):tada: Congratulations!

GiuseppeChillemi

[16:59](#msg62472f5a99d94f5f0c7bfbf2)Please add to the following part of the documentation that "inserting a statement" you receive the column names as result and to get rows you have to use copy ;-)

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

gurzgri

[16:59](#msg62472f83e9cb3c52ae442b8f)that's there already

GiuseppeChillemi

[17:00](#msg62472f94257a35782559b1dd)I have thought that I was in front of another bug when looking at the columns, then have moved on in the documentation!

[17:00](#msg62472f980466b352a4482360)Yes but later.

gurzgri

[17:00](#msg62472fa8f43b6d783f2d0282)Yes but later. Sometimes reading comes first.

GiuseppeChillemi

[17:01](#msg62472fcf257a35782559b699)When you insert a query you expect to receive the query results!

&gt; Yes but later. Sometimes reading comes first.

;-)

[17:01](#msg62472ff3090925231851eaa0)Ok, let's start with a massive task: "select * from table" (100K rows)

[17:05](#msg624730dec4350025001c8556)@gurzgri

&gt;&gt; insert st "select * from dotes" probe length? copy st  
HY090 0 \[Microsoft]\[Driver Manager ODBC] Lunghezza della stringa o del buffer no  
n valida.

Translated: "Invalid length of the string or buffer"

gurzgri

[17:08](#msg6247319899d94f5f0c7c0387)for 100K rows, `statement/state/window` and `statement/state/flat?` will be usefull.

[17:10](#msg624732018db2b95f0a9665c5)Try to figure out which column is causing this error and post `probe statement/state/columns`.

GiuseppeChillemi

[17:12](#msg62473280ddcba117a24dadf3)`../window -> 10`  
`../flat= -> none`

gurzgri

[17:12](#msg6247329899d94f5f0c7c052c)consult the documentation please

[17:14](#msg624732f4f43b6d783f2d08d8)And don't try to work with BLOB columns and such.

[17:21](#msg6247347cc61ef0178e9fe595)The HY900 error \_might_ origin in column to large for 32bit Red, resulting in a negative buffer length.

GiuseppeChillemi

[17:22](#msg624734edddcba117a24db2b5)I have queried the document table columns of the company ERP, they are 108.

[17:23](#msg62473510e9cb3c52ae443690)I wll try to find which is failing

gurzgri

[17:25](#msg6247358addcba117a24db454)Start small with things working and move forward from there.

GiuseppeChillemi

[17:35](#msg624737e33ae95a1ec1c90085)I am using a small table with fewer column. Getting data with `copy`, I receive:

```
"01004 0 [Microsoft][ODBC SQL Server Driver]Troncamento a destra della stringa di dati."
```

Translation: Right trunction of the data string

[17:36](#msg62473805f43b6d783f2d123c)&gt; Start small with things working and move forward from there.

Yes, I will do this

[17:45](#msg62473a249bd1c71ecacf0c93)Please, if you know how to output the debug console text to a file, let me know: it would be really useful.

[18:08](#msg62473f88d1b64840db951ee4)@gurzgri  
This is the failing column:

[18:08](#msg62473f93c4350025001ca103)\[!\[image.png](https://files.gitter.im/6234feab6da037398492a62a/9MJg/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/9MJg/image.png)

[18:08](#msg62473face9cb3c52ae444b7f)It is an XML datatype

gurzgri

[18:22](#msg624742e2ddcba117a24dcbc0)Length -1. The SQL Server XML datatype might be up to 2 GB big. Negative column widths, I don't cater for this. Can the column be casted to varchar of a length Red can handle?

[18:30](#msg624744d0257a35782559e03b)I don't know of a way to log console session into a file. I'm using Powershell 7.2.x in Windows Terminal which is nice improvement over the old cmd.exe, copying all text in a buffer of adjustable size there is done with some double clicks + Shift key.

GiuseppeChillemi

[18:32](#msg62474534c4350025001cacb3)This works  
`cast(NoteXML as nvarchar(4000))`

gurzgri

[18:33](#msg6247456a161ffc40d7e31cdf)Sth. like `select cast(NotesXML as varchar(128000)) from ...` or whatever syntax SQL Server requires.

[18:33](#msg6247457ac4350025001cad04)Same idea :)

GiuseppeChillemi

[18:33](#msg62474586d1b64840db95294c)Yes :)

[18:36](#msg62474635e9cb3c52ae4459eb)Using this:  
`cast(NoteXML as varchar(8000))`

I get `invalid UTF encoding` again

gurzgri

[18:49](#msg6247491f0466b352a4485afa)Cool. Then invalid UTF encoding is to be considered an improvement here. Do you get this with sth. simple as in

```
> stmt: open conn: open odbc://whatever
> insert stmt "select cast(NoteXML as varchar(2000)) limit 3"
> probe copy stmt
```

and how do the column buffers look like in --debug mode (the hex dump debugging output) look like?  
"Normal" italien text columns (varchar) are ok?

GiuseppeChillemi

[19:00](#msg62474bce9bd1c71ecacf2f24)"sth" stands for..?

gurzgri

[19:06](#msg62474d4b99d94f5f0c7c3c29)for ... "something"

[19:07](#msg62474d858db2b95f0a969acf)https://dictionary.cambridge.org/de/worterbuch/englisch/sth

GiuseppeChillemi

[19:12](#msg62474e8de9cb3c52ae4469c1)https://gist.github.com/GiuseppeChillemi/67e337ff745c96b7975c733df7079abf

[19:12](#msg62474eac6b9124232061399a)Here is the result of the query:

`select cast(notexml as varchar(8000)) as n from dotes where notexml is not null`

[19:13](#msg62474ebe09092523185226a2)(`as n` not needed, forgot to delete it)

[19:15](#msg62474f52257a35782559f45c)&gt; I don't know of a way to log console session into a file. I'm using Powershell 7.2.x in Windows Terminal which is nice improvement over the old cmd.exe, copying all text in a buffer of adjustable size there is done with some double clicks + Shift key.

So you run Red debug console in powershell? If yes, how can I do this?

gurzgri

[19:22](#msg624750fee9cb3c52ae446f20)\[!\[image.png](https://files.gitter.im/6234feab6da037398492a62a/379B/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/379B/image.png)

[19:24](#msg624751630909252318522b32)https://www.microsoft.com/de-de/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab

GiuseppeChillemi

[19:24](#msg6247516ec61ef0178ea01fdb)I have also found way to crash the debug console:

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

gurzgri

[19:32](#msg62475331c4350025001cc6f8)re: your gist, geez, sorry, I remember having disabled the column buffer hex dumps when things started working, because they only made debugging output impractical big. For that to reactivate, you would have to uncomment the lines 2061 to 2070 in %environment/schemes/odbc.red and --debug recompile.

But do you have normal text columns and do these work?

[19:40](#msg6247554099d94f5f0c7c49a2)For the NoteXML column there probably happens no conversion to wide string and R/S again tries to treat no unicode data as unicode string data. Hopefully for other string/text colums that works. It does work with other databases, pesumably PostgreSQL, per my own tests and tests of @bubnenkoff

GiuseppeChillemi

[20:25](#msg62475fd59a09ab24f3d1ab2f)&gt; But do you have normal text columns and do these work?

I have just tried, they do not work

[20:43](#msg624763fd3ae95a1ec1c952fa)Here is the gist using a text column as output  
https://gist.github.com/GiuseppeChillemi/81a15c08f9bc9b575742ee6dbe05ab30

[20:43](#msg624764049bd1c71ecacf5da5)Do you need a casted XML too?

[20:46](#msg6247648cc61ef0178ea044d2)Here is the same string from the 2 sides of the coin:

"C.I.A. COSTRUZIONE S.R.L.ùàòè+ì'-.,!---" &lt;----- From Dump  
"C.I.A. COSTRUZIONE S.R.L.ùàòè+ì'-.,!---" &lt;----- From application frontend

They seem equal to me.

## Saturday 2nd April, 2022

gurzgri

[09:24](#msg624816680466b352a449c9e2)They \_are_ equal, that's the root of the problem. In the buffer, they need to be UTF-16LE encoded, they were latin-1 encoded.

[09:30](#msg6248179df43b6d783f2ea4d6)@GiuseppeChillemi Pushed fix \[ed03b3e](https://github.com/gurzgri/red/commit/ed03b3e99de53d72502d6c3978a653f3b556c8f0) for this. That should fix your `cast(notexml as varchar(8000))` case, too.

GiuseppeChillemi

[10:32](#msg624826279bd1c71ecad0aa57)I will try and report

[10:34](#msg624826acddcba117a24f6325)Just a question: will you support BLOB fields? I would need them to manage pictures and documents (pdf, word) stored in the document management system.

gurzgri

[10:44](#msg624829026b9124232062c199)No, I won't. That doesn't fit well with Red being 32bit. It won't fit into the API as well. I can image some special means to fetch BLOBs from a given column one Red supports 64bit, but even then BLOBs won't ever be fetched together with normal columns.

[10:53](#msg62482b23c61ef0178ea1a7ae)But ((long)var)binary are supported already. Maybe your documents fit into these types already if they aren't too big. You are the one using SQL Server, so you shoud know how big LONGVARBINARY can get. The 1^32-1 limit might apply here, because Red and R/S have no unsigned integers.

GiuseppeChillemi

[12:02](#msg62483b5b161ffc40d7e4d288)I know that this limitation comes from Red not being 64bit. Also, I know that in 100% of my data is below the long unsigned integers range as documents and pictures have 90MB maximum size, so are near all database installations I have met in my life in the ERP field.

[12:03](#msg62483b8ef43b6d783f2ee79c)\*long signed

gurzgri

[12:05](#msg62483c0c161ffc40d7e4d424)Then chances are the current implementation will alread work your you.

GiuseppeChillemi

[12:05](#msg62483c219a09ab24f3d33822)Would be possible to implement support for blob up to signed integer size and when it is over the maximum range return an error a conventional field value meaning "overflow"?

gurzgri

[12:10](#msg62483d43090925231853d365)Commit 122d3db might fix your typewriter.

[12:12](#msg62483da99a09ab24f3d33bc5)Of course it would be possible. It's just not a priority.

GiuseppeChillemi

[12:18](#msg62483f110466b352a44a13db)Let's wait, in the meantime I'll start creating some "toys".

gurzgri

[12:36](#msg6248433e6b9124232062f0c9)I can imagine returning a value of type `error!` in such a column, that could proof as a viable solution for other cases where no conversion is possible. But it wouldn't help you anyway, because given your NotesXML column, a buffer of size `statement/state/window * (2^31-1)` would have to be allocated in advance anyway if you don't limit the column size to something sufficient and more reasonable. The buffer would have to be allocated to that size before starting fetching rows into. Because before fetching the actual column values there is no way to know it's actual size in a particular row. Hence the above "it won't fit into the AP" well. What would be required here would be a way to retrieve a single BLOB without allocating a row buffer for that column. Far from impossible, but no priority and no plans for that.

## Sunday 3th April, 2022

GiuseppeChillemi

[21:54](#msg624a17ab09092523185709b9)@gurzgri  
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

## Monday 4th April, 2022

gurzgri

[20:41](#msg624b57f6c61ef0178ea77f35)@GiuseppeChillemi Thanks for pointing this out. Pushed ae47d3: FIX: fixes regression introduced with commit 122d3db.

GiuseppeChillemi

[21:00](#msg624b5c5f99d94f5f0c8390ce)I am trying it immediately.

gurzgri

[21:19](#msg624b60e10466b352a44fc1a9)Note that --debug in GUI console will still typewrite. I optimised the non-debug so, that hopefully GUI console is faster.

GiuseppeChillemi

[21:28](#msg624b62e10466b352a44fc4c9)GUI Console does not typewrite anymore

[21:28](#msg624b62fbddcba117a255513b)Also, the connection has worked flawlessy. I can see the text fields

[21:29](#msg624b631c090925231859820e)`port=1433` seems to not give error anymore

[21:31](#msg624b63ca6b9124232068ab0e)This:

```
d-DNS2 [connection: open odbc://RD32]
```

is now working

[21:33](#msg624b6424c61ef0178ea79533)This

```
c-DNS1 [connection: open make port! [scheme: 'odbc target: "dsn=RD32;AutoTranslate=yes"]]
```

and this

```
c-DNS1 [connection: open make port! [scheme: 'odbc target: "dsn=RD32"]]
```

Do not work!

[21:36](#msg624b64e69bd1c71ecad69f19)Also, I have ran the script many times and the console has not crashed at all.

[21:38](#msg624b6552c4350025002424b5)Great Work!

gurzgri

[21:44](#msg624b66c8257a357825616d13)Thanks ;)

greggirwin

[22:04](#msg624b6b5ec61ef0178ea7a26d)Indeed!

gurzgri

[22:04](#msg624b6b5f0909252318599214)The `target: "DSN="` form is largely untested. I guessed it should work already, but I haven't really tried this. If you like, open a ticket for this so the info doesn't get lost.

GiuseppeChillemi

[22:04](#msg624b6b73c61ef0178ea7a2a0)

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

[22:05](#msg624b6bbeddcba117a2556191)The same using `autotranslate=no`

[22:06](#msg624b6bc98db2b95f0a9e0ee0)Results are equal

gurzgri

[22:06](#msg624b6bcaf43b6d783f34b0d3)@GiuseppeChillemi That tells me nothing. `probe st/state/columns` might give some clues on the SQL types involved.

[22:06](#msg624b6bdb3ae95a1ec1d0b114)@greggirwin Thanks ;)

GiuseppeChillemi

[22:07](#msg624b6c306b9124232068b9a1)

```
[
    cd-cf "cd_cf" 1 7 0 0 handle! 16 handle!
    descrizione "descrizione" 12 80 0 0 handle! 162 handle!
]
```

[22:07](#msg624b6c393ae95a1ec1d0b1ca)Wait a minute

[22:20](#msg624b6f3bc43500250024358c)I am stressing it...

```
>> do %odbc-test.red
*** Internal Error: not enough memory
*** Where: a
*** Near : a: copy st halt cn: switch 'b-ok-notranslate
*** Stack: do-file
```

[22:21](#msg624b6f5fe9cb3c52ae4becac)

```
st/state/window: 1000000
```

gurzgri

[22:22](#msg624b6fc099d94f5f0c83b4ef)Easy fix ... buy more RAM (and wait for 64bit Red to be able to address it) :D

GiuseppeChillemi

[22:23](#msg624b6fd299d94f5f0c83b525)I can run the same big query 3 times, then it gives this error.  
But I have `recycled`

[22:25](#msg624b70548db2b95f0a9e172e)Also, I have again the console crash, it is easy: when you have an error on the query (mine was a wrong column name), if you restart the script the console closes.

[22:28](#msg624b710af43b6d783f34ba52)I have tried to run the big query in the debug console to have some output but it crashes at the third run..

gurzgri

[22:32](#msg624b71e33ae95a1ec1d0bac8)An error in handling errors then. In its current (pre-)alpha state that is a somewhat expected outcome.

GiuseppeChillemi

[22:38](#msg624b736f161ffc40d7eaa75c)I have compared the two big sets, they are EQUAL:  
Here you will find `st/state/columns`  
https://gist.github.com/GiuseppeChillemi/f5c0304f9a3a408f78ba3a95a50ce464

[22:48](#msg624b75b2c4350025002441cd)2 Last notes for tonight:

1\) If I run the same query 3 times with the clause `top 1000` (same as `LIMIT 1000`) I have the `not enough memory error`

If I run the above query 1 time with `TOP 100000` (one hundred, 100 times more) it works.

It is neither ODBC scheme nor Red being 32Bit and neither Lack of memory. It is Red not releasing memory because of a some bug.

2\) If I use `TOP 100000` and `st/state/window: 1500000` the consolle crashes while running the query, and this EACH TIME.

[22:50](#msg624b762fddcba117a2557506)So we have a repeatable behaviour for debugging.

[22:50](#msg624b7635161ffc40d7eaac7a)Good night!

## Tuesday 5th April, 2022

bubnenkoff

[08:50](#msg624c02c53ae95a1ec1d1bebf) What about `NULL`? Should I pass it's as (reduce) `none` ?

[11:31](#msg624c2892257a35782562d0f9)If I need add `ON CONFLICT ... DO UPDATE` how I could done it? Simply add after prepared-values? Like:

```
insert snowwhite [
    "INSERT INTO Dwarves (Num, Name) VALUES (?, ?)"
    [1 "Dopey"] [2 "Doc"] [3 "Bashful"] [4 "Sneezy"] [5 "Happy"] [6 "Grumpy"] [7 "Sleepy"]
   "ON CONFLICT ..... "
]
```

[11:43](#msg624c2b4b0466b352a4513a4f)I tried, but got an error: `Script Error: expected block! not string!`

gurzgri

[12:58](#msg624c3d086b912423206a3ddd)

```
insert snowwhite ["INSERT INTO Dwarves (Num, Name) VALUES (?, ?) ON CONFLICT ..." [1 "Dopey"] [2 "Doc"]]
```

[13:10](#msg624c3fb49bd1c71ecad82a79)@GiuseppeChillemi `st/state/window: 1'000'000` memory wise is about the most inefficient way you can come up with when rerieving a million rows: This requires the scheme to allocate a huge buffer of `1'000'000 * total-row-size` and additionally Red has to allocate a block of length `1'000'000 * num-of-columns` and `1'000'000 * num-of-columns` Red values in this block.  
It would be far more efficient to sport a smaller buffer of say 1'000 rows. However, with 'copy' that would still result in a Red block of length `1'000'000 * num-of-columns` and `1'000'000 * num-of-columns` Red values in this block.  
That's what `next` is for, that way you can "stream" rows, handle the first row set, process that, then `next` to the next row set and so on a thousend rows a time ... See https://github.com/gurzgri/red/blob/odbc/environment/schemes/odbc.md#retrieving-rows

[13:16](#msg624c41159bd1c71ecad82cec)@GiuseppeChillemi How exactly have you run your "same big query 3 times"? With (pseudo-code)  
`loop 3 [open connection open statement execute statement copy results close connection]`  
or with `open connection open statement loop 3 [execute statement copy results] close connection`?

[15:20](#msg624c5e21e9cb3c52ae4db5ba)@bubnenkoff NULL is passed as value of type `none!`, i.e. as `#[none]` or the composed/reduced word `none`.

bubnenkoff

[17:17](#msg624c799c9bd1c71ecad8a17e)is it possible to generate full plain text sql from prepared statement? I need to display it in UI to get user copy-paste it

gurzgri

[17:29](#msg624c7c7a257a357825638059)what have you tried already?

bubnenkoff

[17:40](#msg624c7f0f9a09ab24f3db0546)Heh, I already only tried to rewrite old plain-text sql generator (which passed sql to microservice) to your driver, but if you asking it seems that it's possible to do)

gurzgri

[17:47](#msg624c80c7d1b64840db9ec60f)Seems like the way to go. I don't even understand where the prepared statement you want to generate full plain text from should come from if not "from you". You're not asking for a way to combine the SQL string and the params / params array to a static long SQL statement without params, are you?

GiuseppeChillemi

[18:09](#msg624c85e9c61ef0178ea9b774)@gurzgri  
Questions::  
\* 1.000.000 is the size expressed in bytes or..?  
\* `Total-Row-Size` is bytes, length (num)

.  
.  
&gt; `1'000'000 * num-of-columns` and `1'000'000 * num-of-columns`Red values in this block  
Havee not undestood, seems the same

bubnenkoff

[18:12](#msg624c8685c4350025002644cc)Yes, I can create SQL (static long SQL statement without params) by string joins and generate insert part as " VALUES ( 'a', 'b', 'c' ) " or can pass prepared blocks like \["a" "b" "c"]  
So for example I am creating prepared query, but than want to view it's as "static long SQL statement without params", and if I right understand it's possible?

GiuseppeChillemi

[18:18](#msg624c87e9ddcba117a2577d60)@gurzgri

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

`sql-cols` is a string with &gt;100 cols

gurzgri

[18:40](#msg624c8d378db2b95f0aa045e5)You get what you deserve then :innocent: Seriously, you're not even closing the connection. No wonder uncleared low level buffers cannot be freed, eating all your precious memory. You need to learn to well-behave :stuck\_out\_tongue\_winking\_eye:

GiuseppeChillemi

[18:54](#msg624c904ce9cb3c52ae4e20db)I did it on purpose. When I betatest I work dirty so that developers have their code tested under the worst possible scenery ;-).

[19:39](#msg624c9afcc61ef0178ea9e330)Note: I have thought that reusing St the garbage collector would close the port and reuse memory

gurzgri

[19:46](#msg624c9c9bddcba117a257a5ca)You're NOT reusing `st`. You open a new statement in a new connection, losing access to the previous statement and the previous connection. Hence, these never get closed and can't release housekeeping low level buffers. You can close all statements attached to a connection by just closing the connection.

[20:04](#msg624ca0be8db2b95f0aa06fcc)But you probably happen to know a way how to advise the GC (via callback or other means) to call such cleanup routine before really freeing dangling references? I'd be very interested if there is.

greggirwin

[20:13](#msg624ca2f3ddcba117a257b48a)@qtxie or @hiiamboris can probably say.

gurzgri

[20:16](#msg624ca3a2d1b64840db9f0f58)@GiuseppeChillemi Yay! Obviously you hit a nerve recently and got me thinking ... And when I woke up on sunday morning, suddenly everything has fallen into place and I instantly knew how to implement BLOBs retrieval. So obvious! And it feels totally natural within the current API. Just got it working, first BLOB retrieved from PostgresSQL.  
Not quite ready to hand it over yet, least of all to someone testing as mean as you :stuck\_out\_tongue\_closed\_eyes:

[20:23](#msg624ca5546b912423206b13d8)For now, it will be "all or nothing", fetch the whole BLOB, but with IO branch merged in, a "streaming" approach will be well within reach, too. Such that one can stream a BLOB directly into a file without having it in-memory as a whole in a intermediate step.

hiiamboris

[20:23](#msg624ca558e9cb3c52ae4e49dd)&gt; @qtxie or @hiiamboris can probably say.

I tried to implement OS resource freeing in one PR, but it never got merged and with D2D became irrelevant. No way for now.

gurzgri

[20:25](#msg624ca5a18db2b95f0aa078db)Oh, that's sad.

hiiamboris

[20:25](#msg624ca5d20466b352a4523ed1)Yep :) And we have images and fonts currently not collected at all.

gurzgri

[20:26](#msg624ca5ea257a35782563d1ca)Well, sometimes then ...

greggirwin

[20:45](#msg624caa53c435002500268f87)Great work @gurzgri !

GiuseppeChillemi

[21:30](#msg624cb4f66b912423206b3324)&gt; And when I woke up on sunday morning, suddenly everything has fallen into place and I instantly knew how to implement BLOBs retrieval.

@gurzgri If you have found a way to easily manage BLOB columns you are ahead of a specialized tool I use to sync 2 companies' databases that do not manage BLOB columns at all. When it will be stable I will build a database sync utility. It is easy, I already know how to do it.

[21:32](#msg624cb564257a35782563f0a2)I have only another question: database column names are mapped to `WORD`. Why don't you map it to string as there are some DB engines which accept column names like `2WORK` which not legal in Red?

gurzgri

[21:38](#msg624cb6c0d1b64840db9f361e)Because words are nicer in Red to handle things with ;) You can get easily retrieve the original column name with

```
>> column-of: func [statement word] [copy select statement/state/columns] ()
>> column-of statement 'user-id
== "UserID"
```

In other words: see `statement/state/columns`

[21:46](#msg624cb8bb9a09ab24f3db7cac)And for illegal words it should fallback to the string, doesn't it? In queries I work with I like to `AS "..."` such column names so they adhere to what can be loaded as word.

[21:48](#msg624cb92c257a35782563f72b)much appreciated @greggirwin

GiuseppeChillemi

[21:56](#msg624cbb1709092523185c108d)&gt; And for illegal words it should fallback to the string, doesn't it? In queries I work with I like to `AS "..."` such column names so they adhere to what can be loaded as word.

I don't not whether it should fall back to a string and if could be possible or not. At least, the most important thing is the ability to retrieve the original column name and we have it. Some extra code is then needed when you want to handle tables without knowing their names. I will need an extra mapping table to write back the result to the original columns if I rename illegal columns automatically.

gurzgri

[22:34](#msg624cc3f0161ffc40d7ed285f)It already falls back to string, that‘s how it is implemented. You need no „extra code“, you can just as well `extract/index` all strings from `stmt/state/columns` in what‘s worth half a line of code.

## Wednesday 6th April, 2022

bubnenkoff

[06:50](#msg624d38343ae95a1ec1d41a84)@gurzgri sorry, I did not fully understand you mean that it's possible to generate static long SQL from prepared statement, right?

GiuseppeChillemi

[09:06](#msg624d58056b912423206c5cf2)@gurzgri I use the columns block to create a prototype object that rapresents the row, having also some Init function tied. Having strings does not let me create it, this is the reason I need secondary remapping and renaming illegal columns to legal ones.

gurzgri

[10:12](#msg624d67880466b352a453af47)@bubnenkoff No, that's not what I meant. You'll need to achieve that by yourself if you want to achieve that, is what I meant (at least I don't know of a way to accomplish it).

[10:18](#msg624d68f3257a35782565471e)@GiuseppeChillemi I don't get it. First you said you dislike the words, now it's strings that are in your way. Choose your way.

bubnenkoff

[10:19](#msg624d692e9a09ab24f3dcd09e)Ah! I understood! But do you have any ideas that I can to try?

gurzgri

[10:34](#msg624d6ca13ae95a1ec1d4859c)&gt; I don't know of a way to accomplish it

GiuseppeChillemi

[13:03](#msg624d8f97d1b64840dba0d7be)&gt; @GiuseppeChillemi I don't get it. First you said you dislike the words, now it's strings that are in your way. Choose your way.

Too many message, I understand I should explain better.

Having words used as column names is great but for full compatibility with any engine, strings are better. You have written that RED-ODBC automatically converts to string those "illegal" words and to me it is nice. No more words on this topic.  
My observation is towards myself. I use column names to create object prototypes in Red that contain the default values of a ROW. This because objects may have code to init them and they are perfect for initializing the ROW. So, when I create a ROW I use `make make object! [proto] [values]` where `[PROTO]` initializes the columns of the `ROW` and `[values]` sets all or part of them. Having strings as column name is not possible for objects, so I have observed to myself, I need to rename the "illegal" words to a legal ones and keep a map of `[orginal-name remapped-name]`. That's all, you don have to do anything, your code is pefect.

bubnenkoff

[16:44](#msg624dc368f43b6d783f39417a)I am not sure, but possible it's a bug. I did a lot of experiments with reduce/compose `none` and it's inserting as 1, not as `null`  
Also I tried `#[none]`

[16:44](#msg624dc369c61ef0178eac2ea3)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/37H3/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/37H3/izobrazhenie.png)

gurzgri

[18:16](#msg624dd90dc43500250028d901)@GiuseppeChillemi I see now. So you too have chosen to go the word! way and therefore have to deal with occasional string! column names. What I wanted to point out is that with

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

[18:26](#msg624ddb42161ffc40d7ef4c1c)@bubnenkoff Re: inserting `NULL` values with values of type `none!` - might be bug, but it may depend. PostgreSQL? What does `probe data-insert-statement/state/columns` look like? The 6th value out of 9 per column is the nullability of the column. Eventually your `currency_code` column allows no NULL values? A 0 (zero) means "no NULLs allowed".

bubnenkoff

[18:29](#msg624ddbf66b912423206d7817)@gurzgri sorry, I deleted message about error, I found why it's happens) I forgot breakets

gurzgri

[18:29](#msg624ddbffd1b64840dba17707)@bubnenkoff The correct form was `insert stmt ["some sql" [...] [...] [...] ...]` yesterday, it's the same today. You again have a block too much around your param values.

[18:29](#msg624ddc15e9cb3c52ae50ab81)Answered anyways ;)

bubnenkoff

[18:29](#msg624ddc1ed1b64840dba1774d)yeah) thanks)

gurzgri

[18:42](#msg624ddf273ae95a1ec1d57fd6)@bubnenkoff Can confirm: `#[none]` is inserted as `1` whether column is nullable or not. I'll address that.

bubnenkoff

[18:45](#msg624ddfcc0466b352a454b1c9)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/He23/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/He23/izobrazhenie.png)

[18:46](#msg624ddff2161ffc40d7ef55ac)I faced with this error. copy-paste to sample project get it's inserted correctly

[18:47](#msg624de024c43500250028e710)but in real project I am getting an error about `wrong syntax for timestamp with time zone: "1";^/`

[18:47](#msg624de0599bd1c71ecadb601e)Could the cause of an error be error with `none` above?

[18:50](#msg624de0dd99d94f5f0c888096)But very strange that it's give me insert data in sample project

[18:50](#msg624de0e03ae95a1ec1d5828c)It's inserting correctly:

```
insert data-insert-statement compose/deep [ 
                {INSERT INTO notifications ("purchaseNumber", "isGOZ", "docPublishDate", "responsibleOrg_inn", "responsibleOrg_regNum", "responsibleOrg_kpp", "responsibleOrg_fullName", "responsibleOrg_postAddress", "responsibleOrg_factAddress", "contactPerson_lastName", "contactPerson_firstName", "contactPerson_middleName", "responsibleInfo_contactEMail", "responsibleInfo_contactPhone", "specializedOrg_fullName", "specializedOrg_postAddress", "specializedOrg_factAddress", "specializedOrg_INN", "specializedOrg_regNum", "responsibleRole", "placingWay_code", "placingWay_name", "etp_code", "etp_name", "etp_url", "procedureInfo_collecting_startDate", "procedureInfo_collecting_place", "procedureInfo_collecting_endDate", "procedureInfo_scoring_date", "procedureInfo_bidding_date", "tag", "region", "xml_path", "fz_name") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ON CONFLICT ("purchaseNumber")
   DO UPDATE SET "purchaseNumber" = EXCLUDED."purchaseNumber", "isGOZ" = EXCLUDED."isGOZ", "docPublishDate" = EXCLUDED."docPublishDate", "responsibleOrg_inn" = EXCLUDED."responsibleOrg_inn", "responsibleOrg_regNum" = EXCLUDED."responsibleOrg_regNum", "responsibleOrg_kpp" = EXCLUDED."responsibleOrg_kpp", "responsibleOrg_fullName" = EXCLUDED."responsibleOrg_fullName", "responsibleOrg_postAddress" = EXCLUDED."responsibleOrg_postAddress", "responsibleOrg_factAddress" = EXCLUDED."responsibleOrg_factAddress", "contactPerson_lastName" = EXCLUDED."contactPerson_lastName", "contactPerson_firstName" = EXCLUDED."contactPerson_firstName", "contactPerson_middleName" = EXCLUDED."contactPerson_middleName", "responsibleInfo_contactEMail" = EXCLUDED."responsibleInfo_contactEMail", "responsibleInfo_contactPhone" = EXCLUDED."responsibleInfo_contactPhone", "specializedOrg_fullName" = EXCLUDED."specializedOrg_fullName", "specializedOrg_postAddress" = EXCLUDED."specializedOrg_postAddress", "specializedOrg_factAddress" = EXCLUDED."specializedOrg_factAddress", "specializedOrg_INN" = EXCLUDED."specializedOrg_INN", "specializedOrg_regNum" = EXCLUDED."specializedOrg_regNum", "responsibleRole" = EXCLUDED."responsibleRole", "placingWay_code" = EXCLUDED."placingWay_code", "placingWay_name" = EXCLUDED."placingWay_name", "etp_code" = EXCLUDED."etp_code", "etp_name" = EXCLUDED."etp_name", "etp_url" = EXCLUDED."etp_url", "procedureInfo_collecting_startDate" = EXCLUDED."procedureInfo_collecting_startDate", "procedureInfo_collecting_place" = EXCLUDED."procedureInfo_collecting_place", "procedureInfo_collecting_endDate" = EXCLUDED."procedureInfo_collecting_endDate", "procedureInfo_scoring_date" = EXCLUDED."procedureInfo_scoring_date", "procedureInfo_bidding_date" = EXCLUDED."procedureInfo_bidding_date", "tag" = EXCLUDED."tag", "region" = EXCLUDED."region", "xml_path" = EXCLUDED."xml_path", "fz_name" = EXCLUDED."fz_name"}
                ([["0376200000417000011" none "2017-03-21T14:41:58.534+03:00" "0105025965" "03762000004" "010501001" {ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ ЗДРАВООХРАНЕНИЯ РЕСПУБЛИКИ АДЫГЕЯ АДЫГЕЙСКАЯ РЕСПУБЛИКАНСКАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА} {Российская Федерация, 385000, Адыгея Респ, Майкоп г, УЛ ЖУКОВСКОГО, 4} {Российская Федерация, 385000, Адыгея Респ, Майкоп г, УЛ ЖУКОВСКОГО, 4} "Тлишева" "Мариет" "Анатольевна" "arkb.torgi@mail.ru" "7-8772-524957" none none none none none "CU" "ZKP44" "Запрос котировок" none none none "2017-03-22T09:00:00+03:00" {Республика Адыгея, г. Майкоп, ул. Жуковского, 4, каб. 15.} "2017-03-30T10:00:00+03:00" none none "is_lots" "Adygeja_Resp" none "fz44"]])
                
            ]
        ]
```

gurzgri

[18:50](#msg624de0f20466b352a454b482)Think so because of the \`wrong syntax ... with "1", that must be the 1 instead of NULL, and "1" is not valid timestamp.

bubnenkoff

[18:51](#msg624de137d1b64840dba181e0)But I do not see any "1" in my screenshot...

gurzgri

[18:53](#msg624de191f43b6d783f398227)Minimal examples please. I'm not going to examine a statement like your "It's inserting correctly" sample with soo much noise.

[18:53](#msg624de1949a09ab24f3ddcc10)I see the 1 in your screenshot.

bubnenkoff

[18:55](#msg624de239c43500250028eaab)Thanks! I will try too look deeper tomorrow. The problem that minimal example is work, but real project is not...

[19:00](#msg624de337c61ef0178eac7445)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/yPyv/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/yPyv/izobrazhenie.png)

[19:00](#msg624de33f161ffc40d7ef5c20)Do you mean this `1` ?

[19:01](#msg624de37a9a09ab24f3ddd091)is yes, it's very strange that it appears here.

gurzgri

[19:02](#msg624de3c409092523185e6986)Yes, because in the param block at pos #2 there's the corresponding `none`.

bubnenkoff

[19:07](#msg624de5073ae95a1ec1d58c7d)oh, so it's error about wrong evaluation of `none` to `1`. Understand

gurzgri

[22:55](#msg624e1a5899d94f5f0c88ef53)@GiuseppeChillemi I have a :gift: for you:

\* commit dada87f: "FEAT: Deferred fetching of TEXT/BLOB columns (longvarchar/longvarbinary)"  
\* commit 33adbcb: "DOCS: documentation for PICK on TEXT/BLOB columns"

If you want to try it please follow the documentation and the code sample therein. It would be cool if you can retrieve your PDF documents or whatever it was that way. I could do so already in PostgreSQL and Intersystems Caché, binary data and text documents.

[23:05](#msg624e1cadddcba117a25a996f)Note: you can `pick` (select), you can not `poke`(insert, update) yet.

## Thursday 7th April, 2022

greggirwin

[01:17](#msg624e3bb1d1b64840dba230ce)More great progress @gurzgri! And thanks for testing it @GiuseppeChillemi and @bubnenkoff!

GiuseppeChillemi

[07:23](#msg624e91869a09ab24f3df1cb6)Nice, I will try soon. How do you handle the situation where the data in the column become out of sync with the database? I mean, when it is updated or deleted. Will the scheme throw an error?

[18:00](#msg624f26c73ae95a1ec1d80199)@gurzgri Where I am wrong?

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

gurzgri

[18:17](#msg624f2acbc61ef0178eaef9bb)At line `probe a 'attributi`, but that's not your fault: There is a mistake in the docs, it must be `pick st 'attributi`, I'll fix that immediatly. You pick from the statement port as you do with other port functions.

[18:21](#msg624f2bbf090925231860fd4a)Fixed docs.

GiuseppeChillemi

[18:26](#msg624f2cb9257a35782568dde1)There is another problem:

[18:26](#msg624f2cd1d1b64840dba40e73)It seems I have to `select`, while I have used `insert`

[18:28](#msg624f2d350466b352a45742aa)Also....

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

gurzgri

[18:29](#msg624f2d75257a35782568dfc6)No, `insert` is correct, obviously it was too late yesterday for me :(

[18:31](#msg624f2df19a09ab24f3e068a3)You do the same thing as always, insert a statement, fetch results (here with `next`) and for TEXTs and BLOBs you get `deferred` word instead of the value. Then you `pick` the deferred columns' values.

GiuseppeChillemi

[18:31](#msg624f2e040466b352a457449e)It happens to mee too! In fact I have got: `Invalid port action`

[18:32](#msg624f2e23ddcba117a25cb82b)But no, it is not working:

[18:34](#msg624f2ea0c61ef0178eaf0191)

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

gurzgri

[18:34](#msg624f2eaa3ae95a1ec1d81173)`next` must be used, because with `copy` no cursor would be open and the low level SQLGetData requires a valid cursor.

[18:35](#msg624f2ed499d94f5f0c8b0eac)not `pick b 'attributi`, but `pick st 'attributi`

[18:35](#msg624f2efd161ffc40d7f1e546)You pick from the statement port, not from the rowset fetched.

GiuseppeChillemi

[18:37](#msg624f2f6b8db2b95f0aa58e34)But `b: next st`, so I should be on the statement port!

gurzgri

[18:37](#msg624f2f828db2b95f0aa58e62)Jesus, no!

GiuseppeChillemi

[18:39](#msg624f2fe63ae95a1ec1d81498)OMG! Let`s restart from scratch: is this correct in your documentation?`  
photos: open album: open odbc://album  
\`

gurzgri

[18:41](#msg624f3069257a35782568e5ef)My last comment addressed your assumption that `next st` would return a value of type `port!`. That's totally not true. It returns a block of rows.

[18:42](#msg624f3091ddcba117a25cbd75)

```
>> spec-of :next
== [
    "Returns a series at the next index"
    series [series! port!]
    return: [series! port!]
]
```

`next` takes a port and returns a series.

[18:47](#msg624f31b799d94f5f0c8b140a)All these functions used with ports are "polymorphic functions". You shouldn't think of them as the "same" functions from "your every days Red". In fact, each and every application of such a function is dispatched to a datataype specific implementation. They are generalisations to provide a common interface.

GiuseppeChillemi

[18:49](#msg624f322a6b91242320701a99)Yes, I know and this confuses things because standard Red working is returned by the mind

gurzgri

[18:49](#msg624f323a9a09ab24f3e07179)When you apply `next` or `copy` or `insert` etc. on a `port!` value, a corresponding function `next` etc. in the port's scheme is called. That can do whatever it want and return whatever it thinks makes sense.

GiuseppeChillemi

[18:49](#msg624f32520466b352a4574ce2)I have written to you here: https://gitter.im/red/database?at=624f2fe63ae95a1ec1d81498

[18:51](#msg624f329699d94f5f0c8b15db)&gt; When you apply `next` or `copy` or `insert` etc. on a `port!` value, a corresponding function `next` etc. in the port's scheme is called. That can do whatever it want and return whatever it thinks makes sense.

They remind me of LUA Metamethods, a partial implementation of them

gurzgri

[18:51](#msg624f329a0909252318610981)Well, that's how ports worked from day 1 even in Rebol 2 times. And that's the way the ODBC scheme in commercial Rebol/Command worked. My scheme follows (mostly) what REBOL did (and goes beyond).

GiuseppeChillemi

[18:53](#msg624f332599d94f5f0c8b168e)I know, your project has born deep in past Rebol time , when no one has explained in the docs that those words works differently in ports. In the past I have become crazy trying do understand communication ports topic.

gurzgri

[18:54](#msg624f33838db2b95f0aa596fe)"when no one has explained in the docs" How ports worked was well documented in REBOL 2 times and have nothing to do with my later works on REBOL 3

[18:55](#msg624f33bc99d94f5f0c8b178d)Above, try with `st/state/window: 1`

[18:56](#msg624f33d7c4350025002b8187)What's up with that `halt` there?

GiuseppeChillemi

[18:57](#msg624f341fc61ef0178eaf0d7e)Just an isolation attempt to figure out what was happening here: `invalid id field in spec block`

[18:57](#msg624f342cf43b6d783f3c21a8)It seems caused by `data: open st: open cn`

gurzgri

[18:58](#msg624f34670466b352a45750a3)You were able to connect before. Nothing has changed with that I know of.

GiuseppeChillemi

[18:59](#msg624f34a7d1b64840dba41e3c)It s different: I am opening the connection and opening the statement: there are 2 `open` while before I have used only one:

```
cn: switch 'b-ok con

data: open st: open cn ;<\\\\\\\\\\\\\\\\\\\\\\\\\\\\
```

gurzgri

[19:01](#msg624f3513d1b64840dba41f1f)But that is just you. You open your connection in `cn: switch 'b-ok con` for reasons unbeknownst to me, then on `cn` you open a statement with `st: open cn`. I didn't say you should open a "something" from the statement.

[19:02](#msg624f3548e9cb3c52ae53484a)When I say `photos: open album: open odbc://album` I open a statement on a connection opened beforhand. Only two `open`s.

[19:03](#msg624f35819a09ab24f3e07856)I swear to you that in `switch 'b-ok con` you already `open` the connection.

GiuseppeChillemi

[19:04](#msg624f35a36b9124232070204b)Pardon, you are right, the connection block already contains an `open make port!` statement

[19:04](#msg624f35b53ae95a1ec1d8217e)&gt; I swear to you that in `switch 'b-ok con` you already `open` the connection.

Right!

gurzgri

[19:04](#msg624f35be3ae95a1ec1d8218a);)

GiuseppeChillemi

[19:09](#msg624f36db161ffc40d7f1f795)So is this correct?

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

You perform `next` on `photo` statement, like I do in `st` statement

gurzgri

[19:10](#msg624f3737d1b64840dba42278):sparkles: You've got it!

[19:11](#msg624f37619bd1c71ecaddf7b5)Stop, no! Not again!

[19:12](#msg624f37959bd1c71ecaddf8f5)No, no, no `pick result 'attributi`, it is \`probe pick st 'attributi' please

GiuseppeChillemi

[19:12](#msg624f37963ae95a1ec1d82524)One monent! Your are picking on `photos`!

[19:12](#msg624f37a0e9cb3c52ae534d85)I have seen it!

gurzgri

[19:12](#msg624f37b10466b352a457566e)I was first!

GiuseppeChillemi

[19:13](#msg624f37d38db2b95f0aa59e47):D

[19:14](#msg624f3812e9cb3c52ae534e02)I get `Right truncation of the string` or something similar

[19:14](#msg624f38176b9124232070251d)Not what I have expected

gurzgri

[19:17](#msg624f38d3c4350025002b8dd2)enable `--debug` and put everything in a gist. do `probe st/state/columns` too. Would be too much to post here.

GiuseppeChillemi

[19:22](#msg624f3a02161ffc40d7f1fe0b)Here it is my lord! https://gist.github.com/GiuseppeChillemi/f2499589d7ae4645f500dc1ac1f2e53c

gurzgri

[19:34](#msg624f3cba0466b352a457606e)Add the lines `probe t/state/columns` and `st/state/debug?: yes` before `probe pick st 'attributi` and please rereun it a fresh session. The right truncation message is expected, the long data is read in chunks, hence low level SQLGetDate doesn't return SQL\_SUCCESS but SQL\_SUCCESS\_WITH\_INFO and that info is, that the chunk just read isn't the whole thing already, so read another chunk ... In the end the should be SQL\_SUCCESS though and no message.

[19:40](#msg624f3e2b257a357825690110)\*rerun

GiuseppeChillemi

[19:40](#msg624f3e443ae95a1ec1d833f2)Give me 30 minutes or less, I am having my lunch.

gurzgri

[19:41](#msg624f3e56c4350025002b998d)We're not in a hurry

GiuseppeChillemi

[19:41](#msg624f3e5d161ffc40d7f206f2)I am just back at home from my office.

gurzgri

[19:41](#msg624f3e7fe9cb3c52ae535c5f)enjoy your lunch

GiuseppeChillemi

[20:29](#msg624f49976b912423207049f8)Thank you, here is the requested debug information:  
https://gist.github.com/GiuseppeChillemi/cee814c15ae18211fd2bdd8b0b1f806f

[20:29](#msg624f49c0ddcba117a25cee86)`Indice del descrittore non valido`

=

`invalid index descriptor`

gurzgri

[21:23](#msg624f5661ddcba117a25d07a3)@bubnenkoff Pushed \[odbc dbde8e71a] FIX: issue #4 (Param of type NONE! gets inserted as "1" instead of NULL).

That should allow you to insert `none` values.

[21:53](#msg624f5d419bd1c71ecade4389)@GiuseppeChillemi So `"Attributi"` is of SQL type 65526 = SQL\_WLONGVARCHAR which should work and with size 1073741823 it's well in the integer! range, too. Why it's choking on the index with SQLSTATE `07009`I don't understand.

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

[21:54](#msg624f5d9eddcba117a25d1518)I'll have look again with that. But not today.

[21:56](#msg624f5e033ae95a1ec1d87166)But I noticed some improper column name translations in your columns, opened https://github.com/gurzgri/red/issues/5 for that. I'll address that too (but that's cosmetics only).

GiuseppeChillemi

[22:05](#msg624f60426b9124232070758a)If `SIZE` is expressed as bytes there us something strange. That colum contains attributes. which are composed of a group name, the group members and their flag. Actually max 50 members * 20 characters. Eve if they are stored as XML, I don't thing they could take 1 gigabytes. XML is big, but not do big 😁

[22:20](#msg624f63c0ddcba117a25d21ab)@gurzgri https://gist.github.com/GiuseppeChillemi/b945ca418dff41a77812a0c8c47d4461

Here is the result. Goodnight.

## Friday 8th April, 2022

gurzgri

[15:48](#msg6250596399d94f5f0c8d527d)@GiuseppeChillemi I'm a bit out ideas - the driver complains that I'm trying to fetch the long data in the wrong column. I pushed a minor modification with a bit more debugging output. Please try that. Issue #5 is fixed.

[15:50](#msg625059cc3ae95a1ec1da5fc9)1) Test with the above lines again please, and if this fails, please 2) do the same again but change `probe pick st 'attributi` to `probe pick st 1` beforehand.

[16:33](#msg625063e46b91242320727d59)Column Size is expressed in characters, 1'073'741'823 chars is exactly the maximum string length of an SQL Server NTEXT column. The actuals size in bytes is two times that length. Because (N)TEXTs and BLOBs "physically" aren't stored in the row they belong to but have their own out of line storage places in a database, restricting the length of such a column to a lesser number of characters often isn't necessary.

GiuseppeChillemi

[17:55](#msg62507708d1b64840dba699f3)@gurzgri https://gist.github.com/GiuseppeChillemi/03c68ca837718f12eeab01f8e5ddcf93  
None has worked

[17:57](#msg6250776c6b9124232072a657)If you need, I could give you anydesk access to my machine.

gurzgri

[18:33](#msg62507fdd257a3578256b8197)For your connection `cn`, what is the value of `cn/state/info/"getdata-extensions"`? It might be limitation of SQL Server, PostgreSQL e.g. describes its capabilities as `[any-column any-order]` there.

[18:33](#msg6250800ce9cb3c52ae55dde7)And SQL Server might be pickier eventually.

GiuseppeChillemi

[18:36](#msg625080a7e9cb3c52ae55dedc)

```
st: open cn: switch 'b-ok con
probe cn/state/info/"getdata-extensions"

>> do %odbc-test.red
[]
```

gurzgri

[18:43](#msg6250824df43b6d783f3ec6f2)Then I know what‘s causing this. Current implementation makes an assumption which is only correct when the above SQLGetData Extensions are available. That needs to be treated differently if the aren‘t.

GiuseppeChillemi

[19:03](#msg6250871cd1b64840dba6bbeb)I am here, call me when you need further testing. Database access is one of the pillars for Red professional use and as soon it goes out of alpha, (beta) as soon we could make nice business apps.

[19:07](#msg625087e0ddcba117a25f676e)Currently, on Rebol I have a table browser with auto column size, which needs just the connection data and DB name. It needs very few changes to port to RED odbc and it will be great to create professional apps once data-grid will be here.

## Saturday 9th April, 2022

gurzgri

[08:08](#msg62513ee18db2b95f0aa98732)@GiuseppeChillemi You might have another take on this:

```
insert/part st "SELECT TOP 1 Attributi FROM cf WHERE Attributi IS NOT NULL" 1
```

should work now,

```
insert/part st "SELECT TOP 1 Attributi, CodiceIPA FROM cf WHERE Attributi IS NOT NULL" 1
```

expectedly doesn't work.

```
insert/part st "SELECT TOP 1 CodiceIPA, Attributi FROM cf WHERE Attributi IS NOT NULL" 1
```

should work.

That is because of  
&gt; SQL\_GD\_ANY\_COLUMN = SQLGetData can be called for any unbound column, including those before the last bound column. Note that the columns must be called in order of ascending column number unless SQL\_GD\_ANY\_ORDER is also returned.  
SQL\_GD\_ANY\_ORDER = SQLGetData can be called for unbound columns in any order. Note that SQLGetData can be called only for columns after the last bound column unless SQL\_GD\_ANY\_COLUMN is also returned.

(That's from the Microsoft ODBC documentation, I do not write poetry.)

The consequences for you probably are: You won't be able to simply `SELECT * FROM` with long data columns anywhere in the selected columns, you'll have to explicitly do `SELECT NormalCol1, NomalCol2, ..., NormalColN, LongData1, ... LongDataN` to put the columns holding long data at the end of the columns list.

Note that this is a restriction the database driver imposes, not the scheme implementation.

GiuseppeChillemi

[08:19](#msg625141abc4350025002f6ebe)We have learnt something.

[08:20](#msg625141ba8db2b95f0aa98bd2)I am going to try it

dsunanda

[10:32](#msg625160ad0466b352a45b694f)SQLITE .... I've been playing with this recently. Red does not have anything as useful as Ashley's drivers for SQLite/Rebol \[ http://www.dobeash.com/sqlite.html ]. But SQLite is surprisingly usable via CALL to SQLite's command line interface.  
Very small example:

```
ut: copy ""
call/output {sqlite3 test.db  --csv "select * from demo order by country"} ut
load/as ut 'csv
== [["Alice" "Prof" "CA"] ["Bob" "M" "FR"] ["Eve" "Mx" "MX"]]
```

(For practical purposes it is probably better to have SQLite return JSON .... There's fewer issues when strings contain commas).

GiuseppeChillemi

[13:41](#msg62518d1eddcba117a2613b71)Thank you Sunanda. Ashley has always done a great work on Rebol. I use his Munge for everything. He has improved it over time and we are now at release 3.0.7. I have never used SQLite driver but I will take a look at using it on both Rebol and Red. Just to see different approaches.

dsunanda

[17:14](#msg6251bf01c435002500304aeb)SQLite complements Red very well - it is a lightweight, zero-installation system (under Windows, just unzip a .DLL into a folder, and it'll work). Single user only - unless you take great care.  
It's missing some useful parts of the latest SQL standard (I'd really like the temporal extensions right now) but it has pretty much everything else.  
Lightweight GUI front end to it here: https://sqlitebrowser.org/

GiuseppeChillemi

[17:26](#msg6251c1a999d94f5f0c8feeef)@gurzgri  
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

[17:34](#msg6251c392c61ef0178eb3dee3)Also;:  
ALL 3 version works! As obvious, where:

```
I have changed :
```

probe pick st 1

```
to
```

probe pick st 2  
\`

[17:34](#msg6251c3af9a09ab24f3e55409)It works even:

```
probe pick st 'attributi
```

[17:36](#msg6251c41c6b91242320750003)Last note: I have also tried `pick st 1`where `select CodiceIPA , Attributi` and I confirm it CORRECTLY returns `none`.

[17:54](#msg6251c857c61ef0178eb3e83f)I have tried this:

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

[17:56](#msg6251c8b9ddcba117a261a8f7)The english for the error on the buffer is `Connection string not valid`

gurzgri

[19:10](#msg6251da36c435002500307d6d)1. I'm pretty confident that the `If` which is missing it's condition argument isn't mine.  
2\. To make sense out of the debugging output I'd be interested in your code. The full code beginning at the `cn: open ...`, not just parts.  
3\. If your connection string is invalid then you probably should try with a valid connection string. I thought we'd left the connection step behind us already. How it is that this comes up again I can't tell without the code.

GiuseppeChillemi

[21:40](#msg6251fd36c43500250030bad3)

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

[21:40](#msg6251fd486b9124232075682e)Here it is

## Sunday 10th April, 2022

gurzgri

[09:02](#msg62529d293ae95a1ec1de71df)Tracked it down: The code handling the `insert/part`shorthand was somehow missing, the window therefore was still defaulting to 10 rows. These where fetched with the first `next st` and for the second `next st` there were no more rows left because of `TOP 10`. Hence "invalid cursor state". Pushed fix.

[11:25](#msg6252beac257a3578256f7446)And note that the design will change slightly with the next commits: You won't be forced to fetch with `insert/part ... 1` as I already have full cursor movements implemented here. After fetching a rowset of the size you like, you'll be able to move and position the cursor in the rowset whereever you want and can then `pick` the desired column from there.

GiuseppeChillemi

[11:25](#msg6252beb6257a3578256f744c)I am feeling like being 25 years ago, sending emails to Nils Bandener of Amiga DB Fiasco, debugging his software.

gurzgri

[11:27](#msg6252bf2ce9cb3c52ae59ed42)The database really was named "Fiasco"? Needs a good portion of humor to call your software so.

GiuseppeChillemi

[11:28](#msg6252bf546b9124232076b9b4)Cooperating, we have made a nice work and Fiasco was fully debugged. So I have adopted it in my company as the first DB to keep customers and print invoices.

gurzgri

[11:28](#msg6252bf6f9a09ab24f3e704ca)Well, ODBC gets really complex fast if won't support only the most basic stuff. Lots of possibilities for bugs ...

GiuseppeChillemi

[11:29](#msg6252bf85f43b6d783f42c5b7)Yes! http://nl.aminet.net/biz/dbase/Fiasco\_eng\_doc.readme

gurzgri

[11:31](#msg6252bff78db2b95f0aac3bd3)Cool, so you only need to implement a Fiasco ODBC driver and soon you'll be able to access your records from 25 years ago with Red ... :D

GiuseppeChillemi

[11:59](#msg6252c6b29a09ab24f3e712c0)The archive is lost but that's another story. Once my father come to the beach during summer and told me he has put the Amiga in the town trashcan. I asked him why and he has answered "because you have told me it is broken". It was just an Hard Drive CRC error. I have run with my car to recover it but when I have moved the pile of trash bags, I have seen it with trash liquid falling inside hit. It was impossible to recover. I still miss that Amiga 1200 with 68030, HD and 8MB. Pure nightmare for an Amiga lover. I still miss it!

gurzgri

[17:02](#msg62530da8161ffc40d7f91432)Yeah, that sounds bad indeed. I still have my Amiga 4000 in the basement, even if it hasn't been turned on for way more than a decade, I can't decide to throw it away.

GiuseppeChillemi

[17:43](#msg62531726c61ef0178eb634d1)Nooo, send it here! I have many Amiga things that are waiting a new home!

gurzgri

[17:47](#msg6253183e161ffc40d7f925c0)Sorry, but I can't decide to \*give* it away, too :)

GiuseppeChillemi

[18:13](#msg62531e3e0466b352a45e7e9c)Just check for battery leaks or your motherboard, as it could be destroyed from Varta daemon which plagues the old Amiga computers. Search on internet for Varta Amiga Battery Leaks, people have found holes when taking the machine out of basements.

[21:30](#msg62534c69090925231868a5f4)@gurzgri

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

[21:38](#msg62534e380466b352a45ed358)And I have a request: would you please add an option to let it output the debug info to a file? The consolle you have pointed it is only for Window 10

gurzgri

[22:08](#msg62535577ddcba117a2646992)Surely I won't, it's debugging output only, I have no need to reinvent the wheel for that. If you don't like copying from the console and don't like to \[increase the cmd.exe scroll buffer](https://superuser.com/questions/378313/windows-command-prompt-how-do-i-increase-my-buffer), then why not simply use Windows cmd stdout and stderr redirection as in `.\console.exe --do script.red > script.log 2>&1` instead of running the script interactively in the Red console?

[22:18](#msg625357ba257a357825708dc1)Sorry, the last fix was only one line and yet I managed to commit a typo. Pushed "FIX: typo in insert/part shorthand window setting" just now.

GiuseppeChillemi

[22:30](#msg62535a766b9124232077d963)Because I didn't know all those things can be done. 😉

gurzgri

[23:17](#msg6253656f0466b352a45efb0d)That‘s something every „modern“ OS can do. Amiga too was able to do it from day one.

GiuseppeChillemi

[23:51](#msg62536d6c9bd1c71ecae5b367)Yes, but msdos console was perceived from me as older than Amiga!

## Monday 11st April, 2022

GiuseppeChillemi

[00:08](#msg62537197f43b6d783f4404be)`if is missing its cond argument`  
https://gist.github.com/GiuseppeChillemi/32f11f8f28496f911d26f505e7914695

[00:09](#msg625371a4ddcba117a2649a32)It's late, time to go to bed.

gurzgri

[05:42](#msg6253bfe3161ffc40d7fa4a33)According to the log it already works. The If `*** Near: close cn If` seems to come from your code?!

GiuseppeChillemi

[07:42](#msg6253dbec257a3578257178fb)I will take a look, maybe it's an offscreen code problem.

[08:30](#msg6253e7219a09ab24f3e926b0)\[!\[image.png](https://files.gitter.im/6234feab6da037398492a62a/4CZV/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/4CZV/image.png)

[08:32](#msg6253e78bddcba117a2657116)I apologize, there was an `IF` camouflaged near a comment with near the same color of the comment.

[08:32](#msg6253e7af8db2b95f0aae55a9)And it was also too late to have full brain functionality :-(

[09:01](#msg6253ee7ef43b6d783f44e05d)I have just changed the script to test Red ODBC Further:

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

[09:02](#msg6253ee919bd1c71ecae69f9a)Ok, I have understood the working.

[09:06](#msg6253ef95d1b64840dbacd5cf)So, if I issue another:

```
probe records: next st
```

I get `[]` as results from the statement because there are no more records

[09:08](#msg6253f0128db2b95f0aae64e6)But, is it your intended working that if the code tries to `PICK st 1` when there are no more Records, it gets an `INVALID CURSOR STATE` from the ODBC driver and not `none` or a Red `error!`?

[09:09](#msg6253f03ec435002500342ee3)

```
*** Script Error: ODBC error: ["24000" 0 {[Microsoft][Driver Manager ODBC] Stato
 del cursore non valido.}]
*** Where: ctx||440~fetch-value
*** Near : pick st 1 close cn
*** Stack: do-file
```

bubnenkoff

[09:55](#msg6253faf79bd1c71ecae6b6bb)Remember me please steps to get odbc-branch work. After `git pull` I run next command and got an error:

```
>> do/args %red.r "-c -e --debug %/d/code/zakupki/parser-v2/XMLParser.red"
** Access Error: Cannot open /C/red-odbc/system/red.r
** Near: do/args %red.r {-c -e --debug %/d/code/zakupki/parser-v2/XMLParser.red}
```

GiuseppeChillemi

[12:08](#msg62541a48f43b6d783f453749)Go in the `red-odbc` directory, copy there `Rebol` open it, and write one of these: (just one)

\*Console*

```
do/args %red.r "-r %environment/console/CLI/console.red"
```

\*Debug Console*

```
do/args %red.r "-r --debug %environment/console/CLI/console.red"
```

\*Gui console*

```
do/args %red.r "-r -t Windows %environment/console/GUI/gui-console.red"
```

bubnenkoff

[13:11](#msg625428e4d1b64840dbad4ae1)thanks!

GiuseppeChillemi

[13:49](#msg625431d9e9cb3c52ae5c98b6)You are welcome

bubnenkoff

[16:22](#msg625455bd9bd1c71ecae774ca)I rewrote my code to prepared statements .But now on big file (long time to parsing) I am getting error:

```
*** Script Error: ODBC error: ["HY000" 1 {server closed the connection unexpectedly^/^-This probably means the
*** Where: ctx||610~execute-statement
*** Near : 'any-string!
```

[16:22](#msg625455c29a09ab24f3ea0cdb)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/K6oA/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/K6oA/izobrazhenie.png)

gurzgri

[19:16](#msg62547e7dd1b64840dbae01cc)@bubnenkoff No idea. I don't know what it means that you rewrote to "prepared statements". With odbc://, all statements get prepared, I never SQLExecDirect. So, only two hints: First, the `/deep` refinement as used in your screen shot is superfluous. Second, insert values of type `unset!` aren't (and probably won't ever be) supported, I can't image a matching SQL type.

[19:17](#msg62547ed2161ffc40d7fbd10f)At minimum I gave you two times the tip to `probe` more, yet you always come with code `print`ing things.

[19:21](#msg62547fc2257a35782572c545)@GiuseppeChillemi Polishing things now would be throw away work before design and functionality haven't settled.

GiuseppeChillemi

[20:51](#msg625494b4f43b6d783f463e8a)So, no definitive answer for the error of `pick` on "no record". It's not a problem, I will wait for the time when things will stabilize.

gurzgri

[20:59](#msg625496a0c61ef0178eb917cb)Well, if you think it thru then you should see that returning a value of type `none!` is not an option, as it would be indistinguishable from a `NULL` value in a column, because these are returned as `none`. The remaing question is: What difference do you see between the current `Script error` and a Red `error!`? There is none.

[21:03](#msg62549787161ffc40d7fc03b0)BTW: You're `pick`ing by number. Meanwhile, have you tried `pick`ing by column number, too? It should work equally well and make your code more readable.

GiuseppeChillemi

[21:06](#msg6254986cd1b64840dbae3593)I have kept using `pick` just because you have initially suggested using it, so I have "obeyed" and on all the following tests I have used `pick`, when there was the need to debug. But, I prefer using column name too!

gurzgri

[21:17](#msg62549afce9cb3c52ae5d7037)That was suggested only to check if "by number" makes a difference over "by column word" for you. As soon as it became clear that none of them worked, that reasoning has gone. Readability is so important, you just can't overestimate it when writing.

GiuseppeChillemi

[21:18](#msg62549b223ae95a1ec1e2340a)In fact, I don't like the number option.

[21:22](#msg62549c0cddcba117a266e868)About this:  
&gt; What difference do you see between the current Script error and a Red error!? There is none.

I was unsure you were handling the ODBC error as aRed error. It could be an unhandled one that crashed the whole Red. Red error on `Pick` is a good option, but if coders use `attempt` to pick a column, they end in the same `none` return value.

gurzgri

[21:24](#msg62549c99f43b6d783f464dcb)If coders `attempt` to pick column, they would obfuscate the error no matter how it is thrown, now you're contradicting youself, aren't you?

GiuseppeChillemi

[21:27](#msg62549d3de9cb3c52ae5d742a)I am telling exactly the same thing. They have to handle it a different way, even if `attempt` is the most used shortcut check about possible errors. But...

[21:27](#msg62549d48257a357825730122)Have you seen this difference?

[21:28](#msg62549d868db2b95f0aafc980)

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

gurzgri

[21:29](#msg62549daf6b912423207a5363)`attempt` is not a shortcut to check for possible errors, `try` with `error?` is. `attempt` is a means to hide errors where not interested in failure reasons.

GiuseppeChillemi

[21:30](#msg62549e089bd1c71ecae808ee)You can distinguish from `none!` as block content than `none!` returned by `pick` on `tail`

[21:31](#msg62549e1ac43500250035902a)One is `word!` the other is `none!`

gurzgri

[21:31](#msg62549e3b6b912423207a5419)These samples are Red 101. Both `none` and `none!` are just words your picking. Picking after tail returns a value of type `none!`.

GiuseppeChillemi

[21:33](#msg62549e8e9bd1c71ecae809a7)In fact, what does `pick` return on Red ODBC on `none` column? Isn't it `word!`?

gurzgri

[21:33](#msg62549e8f161ffc40d7fc12c6)

```
Red
y: reduce [none none!]
type? pick y 1 ;== none!
type? pick y 2;== datatype!
type? pick y 3;== none!
```

[21:33](#msg62549ec0257a357825730350)`odbc://` returns values of type `none!`, everything else would drive anyone nuts.

[21:37](#msg62549fb29bd1c71ecae80b86)If a word `none` of type `word!` would be returned, you wouldn't be able to test a column result for `none?`.

GiuseppeChillemi

[21:37](#msg62549fb6f43b6d783f46551a)But my example is on `y: [none none!]` if you keep it working as Red does, where they are both `word!`, and past tail `pick` is `none!` type, you have a perfect 1:1 match on the way Red handles block content and past tail picking.

gurzgri

[21:40](#msg6254a05e161ffc40d7fc15f4)Just no, this leads nowhere. I'm not doing that, I gave the reasons. It wouldn't be "working as Red does" in my book.

[21:43](#msg6254a0ec161ffc40d7fc16f7)That there are no rows to pick from after `empty? rows: copy st` and you're still picking, you can't blame `pick`.

GiuseppeChillemi

[21:45](#msg6254a184c435002500359641)I do not blame `pick`. I am just telling that under Red logic it returns `none!` of type `none!` at tail, which differs from `none!` inside a block which is of type `word!` if you `pick` it. So you can distinguish `end of rows` from column content, just using `type?`!

gurzgri

[21:51](#msg6254a2eac61ef0178eb92e26)Like it or not, it will stay the `none? none ;== true` way ;)

GiuseppeChillemi

[21:52](#msg6254a329e9cb3c52ae5d7fd5)It's your code and your freedom ;-)

[21:54](#msg6254a3aaddcba117a266f88b)But...

```
>> y: [none none!]
== [none none!]
>> none? pick y 1
== false ;<<------
```

It is outside Red standard.

gurzgri

[21:57](#msg6254a44fc61ef0178eb93051)That's what I was saying:  
&gt; If a word none of type word! would be returned, you wouldn't be able to test a column result for none?

That is a major argument for my point of view, seconded by means to test for no more rows with `empty? rows: next st`.

GiuseppeChillemi

[22:09](#msg6254a6ff6b912423207a644d)I fully understand your first POV.

[22:09](#msg6254a72ce9cb3c52ae5d87f6)But you can test, it is just lengthier:

```
>> y: [none none!]
== [none none!]
>> if all [word? c: pick y 1 object? context? c none? get c]  [print "Yes, I am NONE! type!"]
Yes, I am NONE! type!
>>
```

[22:14](#msg6254a83b9a09ab24f3eab438)(Ok, it is not perfect, I have to better review it ;-) )

[22:18](#msg6254a91f6b912423207a6840)Ok, this is the correct way of testing it:

```
>> all [(first [none]) = (c: pick y 1) none? get c]
== true
>>
```

gurzgri

[22:20](#msg6254a9929a09ab24f3eab6a7)You're kidding, are you? :) `'none = pick y 1`

GiuseppeChillemi

[22:21](#msg6254a9fa257a357825731663)As I have written elsewhere, I just didn't know about `'none = pick y 1` but if you know this, why you keep writing:  
&gt; If a word none of type word! would be returned, you wouldn't be able to test a column result for none?

There is a way to test it and it is super easy!  
;-)

gurzgri

[22:50](#msg6254b0c00466b352a46179ae)Because you can‘t test for `'none` with `none?`.

GiuseppeChillemi

[22:51](#msg6254b0f46b912423207a7635)I don't have the energy needed to think! It's too late Christian, see you tomorrow and good night!

## Tuesday 12nd April, 2022

bubnenkoff

[09:58](#msg62554d35161ffc40d7fd4ee3)&gt; I don't know what it means that you rewrote to "prepared statements"

I mean that before I used plain text SQL.

I tried again, and every few minutes I am getting `Runtime Error 1: access violation`

[09:58](#msg62554d3c09092523186c6fa2)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/qkQP/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/qkQP/izobrazhenie.png)

[10:09](#msg62554fe40466b352a462a0ef)prepared:

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

[10:11](#msg62555048d1b64840dbaf8e45)And by the error: `Runtime Error 1: access violation` is's possible that it's GC issue, but I am not sure.

[10:13](#msg625550bee9cb3c52ae5ecaa8)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/NnbD/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/NnbD/izobrazhenie.png)

[10:34](#msg625555be3ae95a1ec1e38bb4)Sometimes it give me to process few files, sometimes it crush immediately

gurzgri

[11:00](#msg62555bb199d94f5f0c968db7)"Parametrized" vs. "unparametrized" statements. The access violation looks like a memory issue, it fails at the buffer allocation step with `allocate` (which essentially is a call to `malloc`). For now, I don't check for success on `allocate`, as it is often to be seen in the Red runtime codebase. Can you split your data into smaller chunks and in between sometimes `recycle` some memory?

bubnenkoff

[11:41](#msg6255655e0466b352a462c7ad)&gt; "Parametrized" vs. "unparametrized" statements

Will know!

&gt; Can you split your data into smaller chunks and in between sometimes recycle some memory?

Good idea! I've added `recycle` between generation each statements and it's seems that it works. At least not crush every time, but I will continue testing....

[12:59](#msg625577ccd1b64840dbafe28b)Small inserts works. I tried to run big parameterized insert requests and it's failed

[13:00](#msg625577d69a09ab24f3ec3984)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/fwyd/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/fwyd/izobrazhenie.png)

[13:02](#msg62557857d1b64840dbafe3df)&gt; At minimum I gave you two times the tip to `probe` more, yet you always come with code `print`ing things.

Ok. I will try to add more `probe`

gurzgri

[14:02](#msg625586879bd1c71ecae9bc30)But the error message is right there, have you considered reading it? ;)

[14:42](#msg62558fefddcba117a268b2d5)Joking aside: Tell me what you think is going wrong and how you try to debug it. I do not think it's directly odbc:// scheme related. The error message is giving away two reasons why the statement fails and I do expect content over size being the reason for failure. Hopefully that's cryptic enough? :J

bubnenkoff

[16:45](#msg6255aca59a09ab24f3eca83b)&gt; But the error message is right there, have you considered reading it? ;)

"before or while processing the request" I did dump of prepared and insert SQL part before crush, and tried to run them in tiny project. Work fine, but crush during processing in real app...

## Wednesday 13th April, 2022

bubnenkoff

[09:09](#msg6256933c161ffc40d7ffdd57)I turned on full logging in PG and found next message: `Р’РђР–РќРћ: Р·Р°РєСЂС‹С‚РёРµ РїРѕРґРєР»СЋС‡РµРЅРёСЏ РёР·-Р·Р° С‚Р°Р№Рј-Р°СѓС‚Р° РїСЂРѕСЃС‚РѕСЏ СЃРµР°РЅСЃР` after decoding I got "connection timeout. connection was closed"

[09:11](#msg625693c5161ffc40d7ffdea4)I remember that when I installed PG I did some settings tuning. I will check it. Also I googled about this error, and there some issue in python drivers. The solution - driver should recreate connection if it's closed

[09:19](#msg62569584f43b6d783f4a12fa)Strange. The settings is ok. I revert all of them to defaults few month ago

gurzgri

[10:35](#msg6256a7889a09ab24f3ee81e4)That it’s the server who closed the connection is no news, that's right there in your screenshot already

bubnenkoff

[11:54](#msg6256ba0de9cb3c52ae619666)I just realized it, I thought it wrong request, but it seems that connection is closing before any requests. Or you think it's problem in request?

gurzgri

[22:42](#msg625751b86b912423207fbade)Don't know. Either try to narrow it down to a problematic param-set/param or pull again and try with statement without a query timeout or query timeout long enough (not sure if it will make a difference):

```
open statement: open connection odbc://my-dsn
change statement [timeout: 2:00]           ;-- timeout after 2 hours
insert statement ["INSTERT INTO ..." [...] [...] [...] [...] ...  [...]]
```

## Thursday 14th April, 2022

bubnenkoff

[10:30](#msg6257f7dde9cb3c52ae642231)Yeah!! It's seems that I have found problem. There was settings: `idle_session_timeout = 120000`. But I need test more, it worked only with tiny example

gurzgri

[16:14](#msg6258484f9a09ab24f3f1be56)But wasn‘t that commented out in the pg.conf you‘ve showed?

bubnenkoff

[16:38](#msg62584df33ae95a1ec1e96d6d)It was my error, I have two instance and looked at wrong config. Btw I do not know why, maybe because it's debug build and too many logs on screen, but inserting of 20K of VALUES still not finished. It already 3 hours. If It will not end in next 2 hours I will try to run not debug build, possible it would work faster

[16:48](#msg625850690909252318727c62)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/xJE5/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/xJE5/izobrazhenie.png)

[16:48](#msg6258506e257a3578257a38fa)Currently output ^

gurzgri

[17:31](#msg62585a6ef43b6d783f4da28a)Can you give some impression of the data you want to insert? How many rows with how many values per row (param array n x m), what datatypes? What are the column you insert into? NULL values in between? How long are values, long strings and such? What is the code you execut? You can post in private channel and obfuscate sensible data.

## Friday 15th April, 2022

bubnenkoff

[07:13](#msg62591b293ae95a1ec1eaeac3)I will,  
1\. I just found bug with `unique`and report about it.  
2\. I need to do more testing to be sure that problem in driver, not in DB

GiuseppeChillemi

[08:27](#msg62592c7b3ae95a1ec1eb0c8b)Red has also `UNIQUE`, so I don't understand whether you ar talking about Red `unique` or no.

bubnenkoff

[08:38](#msg62592ef9161ffc40d704f8b9)Second meaning is `UNIQUE` in context of SQL query argument?  
Yes, I found a but in Red. My app is crush because of him. (I used them to delete dups from parameters)  
Now I am doing some tests, and it seems that multiple values are inserted successfully. I will write when I am done

GiuseppeChillemi

[11:18](#msg6259549fc61ef0178ec27e8e)I still don't understand.

[11:19](#msg625954c7d1b64840dbb76be4)Have you requested data and used `UNiQUE` in Red and it crashed?

bubnenkoff

[11:21](#msg62595526e9cb3c52ae66d56f)Yes, exactly!

GiuseppeChillemi

[11:22](#msg625955689a09ab24f3f3c116)So, it's a Red Problem. If you can reproduce the bug, write a bug report in a ticked.

[11:22](#msg6259556b8db2b95f0ab8fe8b)Ticket

bubnenkoff

[11:23](#msg625955a6257a3578257c247d)Yes, I already did it in bug chat group and here https://github.com/red/red/issues/5123

GiuseppeChillemi

[11:23](#msg625955ba257a3578257c24ad)Perfect!

bubnenkoff

[16:14](#msg625999db99d94f5f0c9eef0a)After some inserts code fail with an error:

```
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

The error occurs before execution prepared statements. I will try to look maybe debug build will show more info

[16:36](#msg62599f210466b352a46b250a)hm... obviously it's GC issue, but it crush at random place

[16:41](#msg6259a0539a09ab24f3f458aa)https://gist.github.com/bubnenkoff/5b2c0d00e8e3a96fe4bde7a0fa983605#file-app-red-L51

Here is my code. I tried to turn GC on\\off - it did not helped. App do not crush only if I use not parameterized statement

[17:23](#msg6259aa2fc61ef0178ec331c5)40 minutes passed not parameterized statements insets works fine

GiuseppeChillemi

[17:51](#msg6259b0926b91242320844b5f)I have not understood. Does it work or it does not work?

bubnenkoff

[17:57](#msg6259b1f73ae95a1ec1ec1f4b)It works only with not-parametrized statements. With parameterized it crush with `access violation` in random places. Sometimes it process few files before crush, sometimes it crush on first.  
But I can't use not-parameterized statements, because the have size limit

gurzgri

[18:46](#msg6259bda1161ffc40d7061ab9)Show me the output of `probe compose [ (insert-part) (prepared-values-part) ]`.

## Saturday 16th April, 2022

bubnenkoff

[06:23](#msg625a60d8ddcba117a271f168)code:

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

[06:23](#msg625a60e999d94f5f0ca0593f)\[samples\_data.zip](https://files.gitter.im/6234feab6da037398492a62a/SX2B/samples\_data.zip)

gurzgri

[08:57](#msg625a85013ae95a1ec1ed90b3)The data you provided doesn't match the required format in so many ways, that I don't even know where to start. That is so obvious from the sample data that I cannot help but think that you haven't even had a look into that data by yourself. The only two recommendation I give is: 1) put a single parametrized statement together and if you can insert this 2) comment out the `insert data-insert-statement ...` statement and instead probe the data to the screen until you see for sure that you've got the format right before throwing it at the database.

[09:04](#msg625a8693d1b64840dbb9af4b)

```
Red
insert snowwhite [
    "INSERT INTO Dwarves (Num, Name) VALUES (?, ?)"
    [1 "Dopey"] [2 "Doc"] [3 "Bashful"] [4 "Sneezy"] [5 "Happy"] [6 "Grumpy"] [7 "Sleepy"]
]
```

[09:04](#msg625a86a1f43b6d783f51c01c)is the format

bubnenkoff

[09:06](#msg625a870b090925231876acba)Ok, I will try tomorrow evening

[09:13](#msg625a88b0257a3578257e6d13)I was in a hurry when I was preparing the data. I had to leave. I'll check them again tomorrow or Monday.

## Monday 18th April, 2022

bubnenkoff

[09:26](#msg625d2ed36b912423208abb6f)@gurzgri good news! I was able to create minimal app to reproduce an error:

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

gurzgri

[09:45](#msg625d3339f43b6d783f56b222)For further testing purposes, change the line

```
insert data-insert-statement compose [{INSERT ...} ([[0 "0376200006316000009" ...]])]
```

to

```
argument: compose [{INSERT ...} ([[0 "0376200006316000009" ...]])]
probe new-line/skip collect [foreach row next argument [foreach param row [keep type?/word param]]] on length? second argument
insert datat-insert-statement argument
```

What's the output of the `probe`?

bubnenkoff

[09:51](#msg625d34950466b352a471d3c6)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/C1xf/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/C1xf/izobrazhenie.png)

[09:51](#msg625d349b09092523187ba949)first run

[09:51](#msg625d34bf8db2b95f0ac03370)others attempts five same result

gurzgri

[10:00](#msg625d36c18db2b95f0ac03705)Expected. Parameters of type `word!` aren't supported as per documentation. Admittedly, the scheme could fail more gracefully in such a case, but that's polishing. The problem is with the params provided.

bubnenkoff

[10:03](#msg625d378fc435002500460f9d)So you `none` in my params is not `none!` but is a word?!

gurzgri

[10:04](#msg625d37c0161ffc40d70c771c)Literally ;)

[10:06](#msg625d38146b912423208accdd)The param blocks need to be reduced. The scheme only reduces the `value` argument of `insert`, not inner param blocks.

bubnenkoff

[10:07](#msg625d386b99d94f5f0ca5a249)Is it possible to reduce here?

```
insert data-insert-statement compose [ 
             (insert-part)
             (prepared-values-part)
        ]
```

gurzgri

[10:07](#msg625d38786b912423208acd5b)No.

[10:08](#msg625d38adc435002500461196)`prepared-values-part` has to reduce each block it returns in the outer block.

bubnenkoff

[10:14](#msg625d39f1ddcba117a277270d)That's very strange. I am generate values in next way:

```
append/only flat-data/(parent-table-name)/values reduce values-of words-in-block
```

So my `prepared-values-part` is reduced

I checked how it should work:

```
>> type? second reduce values-of #(a: 1 b: none )
== none! ; so it should be reduced correctly
```

[10:17](#msg625d3aa2ddcba117a2772824)

```
x: []
append x second reduce values-of #(a: 1 b: none )
probe x
print type? x/1
none
```

What `x/1` here? I can't figure out

gurzgri

[10:24](#msg625d3c528db2b95f0ac04276)Well, at least in the above literal example the blocks weren't reduced, but maybe `prepared-values-part` \*does* reduce. Test with

```
argument: compose [(insert-part) (prepared-values-part)]
probe new-line/skip collect [foreach row next argument [foreach param row [keep type?/word param]]] on length? second argument
```

and you'll see.

bubnenkoff

[10:26](#msg625d3cc33ae95a1ec1f28da0)One moment. I will test. I tried:

```
append/only flat-data/(parent-table-name)/values reduce values-of words-in-block 

xxx: values-of words-in-block 
foreach x xxx [
    probe x
    print type? x
 ]
```

And yes, none here is `word`

[10:32](#msg625d3e3e8db2b95f0ac04655)

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

gurzgri

[10:40](#msg625d402a9bd1c71ecaf88754)Now you're running in circles. Test with the real `prepared-values-part`, not a literal one. With a literal one, what else do you expect than literal values?

bubnenkoff

[10:49](#msg625d422a8db2b95f0ac04da2)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/Sf3C/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/Sf3C/izobrazhenie.png)

gurzgri

[11:01](#msg625d4519ddcba117a2773c8a)Why is this a block with 25 * 8 = 200 values? It must be 20 blocks of 8 values. At least for the SQL statement cited above, which only lists 8 columns and 8 parameter markers?

[11:13](#msg625d47d7161ffc40d70c954c)sorry, that's only the debuggig output, my mistake.

bubnenkoff

[11:17](#msg625d48b799d94f5f0ca5c0cd)do you sure? I thought it's mine) I am not sure if I run right copy of app

[11:18](#msg625d491a8db2b95f0ac059aa)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/oz5b/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/oz5b/izobrazhenie.png)

[11:19](#msg625d493f0466b352a471fe79)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/dz2I/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/dz2I/izobrazhenie.png)

[11:30](#msg625d4bc3c4350025004637a3)\*The above output is with another data in probe

[11:40](#msg625d4e2a8db2b95f0ac06200)that's very strange that if I re-run my app it sometimes work and process several files. Look at ouput:

[11:40](#msg625d4e2d0466b352a472079f)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/nz4R/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/nz4R/izobrazhenie.png)

[12:35](#msg625d5afb8db2b95f0ac07c17)Also I have got question, how correctly to wrap connection in try-catch?

```
connection: open make port! [
            scheme: 'odbc
            target: "driver={PostgreSQL Unicode};server=127.0.0.1;port=5432;database=dbname;uid=postgres;pwd=123"
        ]
```

I cant print if connection status is ok, or write about error.

I have only one idea to do like: `either not error? connection [...] [ ... ]`  
But maybe there oe better approach?

gurzgri

[12:39](#msg625d5c0ac435002500465584)`help "error"`

[12:40](#msg625d5c3cf43b6d783f56fd0a)How do you check if `1 / 0` results in an error?

bubnenkoff

[12:46](#msg625d5d92c4350025004658fd)I get confused every time if Red have same behavior of try-catch with another languages.

```
if error? try [1 / 0] [print "errror" ]
```

Here `try` work in another manner, it's just try to evaluate block and return result or errror

[12:56](#msg625d5fefddcba117a2776f78)

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

gurzgri

[13:18](#msg625d652a3ae95a1ec1f2dc33)What's wrong with `either error? connection: try [open make port! [...]] [handle error] [do something with connection]`?

bubnenkoff

[13:25](#msg625d66d2d1b64840dbbf1e83)I made a syntax mistake, thanks

GiuseppeChillemi

[13:48](#msg625d6c33257a35782583c884)Just a note about column names like `2data`: I have seen that in Rebol they can be created with `to word` but in Red give error. It would be nice addition on Red

## Tuesday 19th April, 2022

gurzgri

[05:28](#msg625e48829a09ab24f3fd255e)What happens when you insert each set of params one after another? Does each one fail? Do some succeed?

```
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

bubnenkoff

[06:27](#msg625e564ae9cb3c52ae7025d8)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/iA0C/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/iA0C/izobrazhenie.png)

[06:28](#msg625e56920466b352a4740567)It works already 5 minutes, no crush, but it seems that it do not insert nothing

gurzgri

[12:19](#msg625ea8ba99d94f5f0ca86899)At which commit is this? Please update the branch with latest commits and rerun. Same errors?

bubnenkoff

[12:48](#msg625eaf9e0466b352a474b224)@gurzgri on the last commit it seems that your code above works. at least it work already 2 minutes and I see result in DB

[12:49](#msg625eafea3ae95a1ec1f557f5)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/lA4H/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/lA4H/izobrazhenie.png)

[12:55](#msg625eb15cd1b64840dbc19ecc)I tried my old code again - it have same problem as before.  
I do not fully understand what your code is doing? It done only for testing bug and then I will be able to use original insert function?

gurzgri

[13:42](#msg625ebc33ddcba117a27a06d1)&gt; when you insert each set of params one after another

[13:43](#msg625ebc7509092523187e9b73)And what's with inserting multiple param sets at once with

````
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
````

bubnenkoff

[16:35](#msg625ee4ca09092523187ef0d5)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/R5dy/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/R5dy/izobrazhenie.png)

[16:35](#msg625ee4de8db2b95f0ac38b8f) I got next error ^

gurzgri

[19:23](#msg625f0c2b09092523187f3cb3)So we're getting closer ;) Two things come to mind: 1) it may fail with multiple rowsets in general (rather unlikely) or 2) it may fail for specific param types (a bit more likely, I have a little suspicion about floats).

Please run my last code suggestion again in a `--debug` enabled console and redirect the full output of your script with Windows cmd stdout and stderr redirection as in `.\console.exe --do path\to\your\script.red > path\to\your\script.log 2>&1`. Please provide to log and your script as private gist, these screenshots are really sub-optimal for debugging.

## Wednesday 20th April, 2022

bubnenkoff

[06:57](#msg625faef50466b352a4769e2b)@gurzgri done https://gist.github.com/bubnenkoff/26de6da79a2bb6e7efd82d34284a5395

gurzgri

[21:10](#msg626076bae9cb3c52ae745f62)Thanks for that. There really must be some kind of buffer related bug with float params — I crafted me some more tests and observe some "random" access violations with these, too.

As a work around, eventually you might have more luck if you convert `float!` values to `string!` values.

In the example code above, you can do that e.g. like so:

```
...
    params: either unique? [unique value/values] [value/values]
+++ parse params [some [into [some [param: change float! (form first param) | skip]]]]
    types: collect [foreach row params [forall row [keep type? first row]]]
    ...
```

Just add the line marked with `+++`, it will form every float value it comes across, leaving all other values untouched.

[21:12](#msg626077418db2b95f0ac6ba5a)Hunting down the bug and fixing it will take some time, I'll have to find some time for working on that.

## Thursday 21st April, 2022

bubnenkoff

[07:18](#msg6261052e8db2b95f0ac7b7ac)Big thanks! And thanks for providing work around. I am going on vocation soon, and I will be back only 15 of May, so hope that you will find solution, if not -- I will try to use this work around

GiuseppeChillemi

[18:30](#msg6261a2d5161ffc40d715302d)When it will be more stable I will try it in an unconventional scenery: I will ask for a 1 month trial of Excel ODBC interface and we will use Red ODBC on it.

[18:31](#msg6261a2fdc4350025004ec813)Pardon (I am on mobile) : Outlook/Exchange ODBC

gurzgri

[20:22](#msg6261bcfe257a3578258c497e)@bubnenkoff Good catch with that `float!` bug thing! Pushed a commit which should fix it already.

[20:23](#msg6261bd28161ffc40d715634d)Happy holidays!

## Friday 22nd April, 2022

bubnenkoff

[08:11](#msg6262631f257a3578258d77a8)Perfect! I am still here, pulling!

[12:35](#msg6262a113161ffc40d7171746)It's seems that it's works! But I will continue testing

greggirwin

[19:52](#msg6263078cc61ef0178ed50835)Thanks, all, for continuing to work on and test this!

GiuseppeChillemi

[22:36](#msg62632dd00466b352a47d83d1)It is 1 of the 4 pillars we still needs

[22:36](#msg62632debe9cb3c52ae799f13)\*need

## Wednesday 4th May, 2022

GiuseppeChillemi

[07:39](#msg62722dcb949ae940068db351)@gurzgri Have you seen this in Gui-Branch group?

[07:40](#msg62722dd0eaf3267f854466a7)https://gist.github.com/GiuseppeChillemi/049a1ae7397aef600ea30845606b46a0

[07:40](#msg62722df741f4560c6f83d3e3)It is little part of a 10000 rows query.

[07:41](#msg62722e36cd35b566afcbc01f)For some strange reason, some lines are split in multiple parts and there are CR/LF on the.

gurzgri

[19:25](#msg6272d32ca687887f8d8cd5ad)Never experienced this myself. I recommend using `change statement [debug?: yes]` before fetching, then examine the raw binary transmitted strings, look out for byte codes of unprintable characters and such.

## Friday 6th May, 2022

gurzgri

[16:17](#msg627549ffeaf3267f854a849d)@GiuseppeChillemi So, not as urgent as it seemed to be then?

GiuseppeChillemi

[18:07](#msg627563c7d30b6b44ebd6ee0b)@gurzgri Christian, the answer is simpler: the last days have been very stressful and at night I have had just the force to make some simple coding and messaging. I will be back on the topic tomorrow.

gurzgri

[18:41](#msg62756be361f5ca3feeec0201)Okay ;) So let me know if I can help. Probably not before next week, this weekend is busy for me.

## Monday 16th May, 2022

GiuseppeChillemi

[17:03](#msg628283e1eaf3267f85636541)@gurzgri @hiiamboris @greggirwin

As written here https://gitter.im/red/database?at=62722dcb949ae940068db351 , I have some unexpected CR/LF on my query result which I have visually inspected after saving it on a file.  
I have done some further investigations and...

... The problem does not happen when using the DOS console but has appeared randomly on the gui-console;  
I have changed the query size from 10.000 to 1.000-3000 and it has not triggered;  
I have then tried to save the query result obtained in the console version of RED on `FILE-A` and save the output of the query run in the gui-console on `FILE-B`. I then I have tried `difference FA FB` in the GUI-Console nd I have received a `stack overflow error`.  
After this, without closing the gui-console, I have tried to rerun the query and save it , every file was PERFECT, without any error!  
I have then tried again obtaining a predictable result:  
If you run the query and save it on the GUI-CONSOLE you have few CR/LF on the first run and MANY on the subsequent  
If you have a stack overflow, than no more error of any kind

[17:04](#msg62828439949ae94006ac9ebc)How could I further investigate?

[17:10](#msg6282856ceaf3267f856368c2)Guess what has happened with `recycle/off`!

hiiamboris

[17:12](#msg628285e341f4560c6fa2c4a2)Find a way for @gurzgri to reproduce it, what else is there to say

GiuseppeChillemi

[17:13](#msg6282862141f4560c6fa2c565)I think the garbage collector does not beling to @gurzgri

[17:13](#msg6282863c10cfc315bc80f56a)But yes, he could have made changes which impact on it

hiiamboris

[17:13](#msg62828640eaf3267f85636a99)We still have `mold` producing garbage, but I've only encountered 1 garbage byte in last half a year.

[17:13](#msg628286509db19366b22fd535)So most likely it's DB code.

[17:15](#msg62828695eaf3267f85636b0e)Of course, since you're saving and loading big files you will hit this more often

[17:18](#msg62828752d4ef6e15af4c1923)You should consult @qtxie on the quirks of the GC and how to get on it's good side. He fought it a lot.

GiuseppeChillemi

[17:18](#msg6282877061f5ca3fee04aa49)Well, another discovery: if I do a `recycle/on` I have again garbage but it if I do a second `recycle/off` I have still garbage the first run of the query after `recycle/off` but no more garbage after on the second run an subsequent

[17:19](#msg628287aa949ae94006aca6cd)All of this is repeatable, so I have solid base for debugging.

[18:11](#msg628293b4bb0de60c7241377a)I have checked a couple of rows from both good and bad save. They are equal, there are only some spurious CF or LF

greggirwin

[19:09](#msg6282a159949ae94006ace0a0)This is not going to be a fun problem, though I hope @gurzgri can dupe it and that it can be worked around on that side. It's still important to know about \*any* GC issues.

[19:34](#msg6282a72b89dcc96e9c0606dd)Something we should do is test @toomasv's `table` style against different data sources (ODBC, SQLite, CSV, simple JSON, native blocks). I will also press for a simple native datastore later this year. One goal of alt-testing is to narrow down where bugs occur. Another is to flush them out and find real-world limits as they relate to memory use, data conversion, GC, and `table` style. The style itself will likely not be a bottleneck because it's all virtual data as far as it's concerned.

To this end, having identical test datasets will be great. If anyone wants to champion that R&amp;D, let me know.

GiuseppeChillemi

[20:08](#msg6282af4d89dcc96e9c061695)Is there any way to change stack limit? `DIFFERENCE` hits the ceiling and give `stack overflow`

[20:18](#msg6282b18889dcc96e9c061ac2)@greggirwin I have my company dataset which contains a real life dataset. When RED-ODBC will be stable I could spread and convert part of it to different destinations. Then I could use either Red and Rebol2 (maybe Rebol 3 because of Latin characters) to test everything.

gurzgri

[20:32](#msg6282b4dad4ef6e15af4c7819)@GiuseppeChillemi I'm really having trouble following you on your mental jump from problems with `new-line`s in the result set to stack-related problems with `difference`. Are you aware that there \*is no* `difference` between `a: head new-line next [1 2] on` and `b: [1 2]`?

hiiamboris

[20:49](#msg6282b8e2eaf3267f8563d3a5)&gt; Is there any way to change stack limit? `DIFFERENCE` hits the ceiling and give `stack overflow`

you can report your finding here https://github.com/red/red/issues/5123

GiuseppeChillemi

[22:07](#msg6282cb3d949ae94006ad3598)@gurzgri It's simpler than I have written:

My query returns 10000 blocks. On the `gui-console`, about 2% of those blocks are split with newlines, while in `DOS debug console` this does not happen

[22:09](#msg6282cbb5cd938f6ea24d7889)If I use `difference` to compare the `DOS console` query and the `GUI-Console` query `saved` files, I have discovered I get a `stack overflow` and this event fixes the `GUI-Console` which does not split blocks anymore on every instance of the query.

[22:12](#msg6282cc66d30b6b44ebf0260b)What I mean for splitten blocks? There are `newlines` between values but you can `LOAD` this block even if it spans 2 or 4 lines. The `newline` are not inside values but, as I said, between them.

[22:14](#msg6282cccfa687887f8dab387b)If compare a split ROW in by `gui-console` , with the same ROW in the `dos version` there is no diference. Trying `DOS-BLOCK = GUI-SPLITTED-BLOCK`, Red returns `TRUE`

[22:21](#msg6282ce7ecd35b566afeb9945)@greggirwin There is another important source we could use: \*open data\*. They have big datasets for everything

[22:25](#msg6282cf4f949ae94006ad3ce1)@gurzgri I have just tried to search for `difference` loading the two sets in `REBOL2` and the result block is empty. So the only differences are the spurious `newlines`

greggirwin

[23:00](#msg6282d792d4ef6e15af4cb918)Let's make a wiki page for data sources.

## Tuesday 17th May, 2022

gurzgri

[05:49](#msg6283376746495f47cfe4cf61)@GiuseppeChillemi The odbc scheme inserts a `new-line` (not a `newline`) on every row block of a result set fetched in block mode and adds a `new-line` on every value in the first column of a result set fetched in `change statement [flat?: yes]` mode \*on purpose* for improved readability in the console (whether GUI or not), but adds no `new-line`s on values in block mode. That is there since your earliest attempts and trials using the scheme, so I don‘t expect that you are talking about these?

GiuseppeChillemi

[06:13](#msg62833d0f10cfc315bc82535d)No, I am not talking about this, but this: https://gist.github.com/GiuseppeChillemi/049a1ae7397aef600ea30845606b46a0

[06:15](#msg62833d6e41f4560c6fa42857)As you can see some blocks have a line feed somewhere in the middle, even multiple ones. This does not happen in dos console, or in gui console after there is a `stack overflow` which seems to fix the problem

[06:42](#msg628343f214df4e44f22bed24)And to I avoid any confusion: \*this is not an output of the console* but a query result obtained with the following code:

```
the-query:  "SELECT top 10000 * from dotes"
	st: open cn: switch 'b-ok con
	insert st the-query
	x: copy st
	save %direct-query.txt x
```

[07:09](#msg62834a2ffa846847c96bc266)If you open in an editor `%direct-query.txt` obtained running this code on the GUI console, you get the result with LF in the middle. If you run this code on the debug console, you get a perfect save!

[07:10](#msg62834a5e89dcc96e9c073708)Also, you get a perfect save if you cause a `stack overflow` before running this code in the GUI Console.

## Wednesday 18th May, 2022

GiuseppeChillemi

[10:05](#msg6284c4e3db3fe1746f04fbc0)@greggirwin  
&gt; Let's make a wiki page for data sources.

Please, create it and I give myself volunteer for this task.

[10:07](#msg6284c546887b1a635ba80063)I will also create it on my Github to keep a local repository.

## Friday 20th May, 2022

bubnenkoff

[17:32](#msg6287d0aadb6f627d2590a23a)@gurzgri hi!  
I want to wrap code to handle error if it will happen during insert. How to do it? Should I place this code it `try` block?

```
insert data-insert-statement compose [ 
  (insert-part)
  (prepared-values-part)
]
```

[17:35](#msg6287d15cf8daa71e078c54b4)The error that I got is `Script Error: ODBC error: ["23505" 1 ERROR: repeating key value violates uniqueness restriction` I forgot set some DB restriction, but I want to handle this error and print request on with it caused it

[17:45](#msg6287d3ad7df86c141e951b58)This code works, but is it's good?

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

greggirwin

[19:30](#msg6287ec6fdeea5616bbb984cc)You can capture the error as well. e.g. `if error? set/any 'res try cmd: [1 / 0] [print [mold cmd 'caused mold res]]`

## Saturday 21st May, 2022

gurzgri

[16:37](#msg62891549ef00bd1dc6f11457)Just as Gregg said, except that because of `insert` always returning a value, there's no need for `set/any`:

```
if error? result: try [insert statement sql] [probe result]
```

will do fine.

## Monday 23th May, 2022

gurzgri

[18:05](#msg628bccfaef00bd1dc6f63b74)@toomasv @GiuseppeChillemi : Retrieving deferred columns (BLOB, TEXT) is already implemented, but isn't properly documented yet:

`pick`ing from a statement port by column word, column name string or column index number is possible, but is restricted to retrieving blobs/texts from the first row only in the current rowset. If your `statement/state/window` size is greater than 1 and the rowset is positioned on row \*n\*, with this you're not able to pick from row \*n+1* and further. And setting the window size to 1 of course isn't efficent either.

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

[18:11](#msg628bce57deea5616bbc0f539)Writing BLOB/TEXT isn't possible yet, just as Giuseppe said. It probably will be done by `poke cursor 'invoice-pdf load/binary %invoice000333.pdf`.

toomasv

[18:12](#msg628bce9bdeea5616bbc0f5bc)Thanks, @gurzgri ! I'll try this out tomorrow. It is great tool you have done!

gurzgri

[18:16](#msg628bcf634e38f759e284e28f)Thanks, have fun playing. If you experience problems or crashes, they are likely driver/database related and probably related to specific datatypes. So far, the scheme has been tested with Intersystems Caché, PostgreSQL, SQL Server.

GiuseppeChillemi

[18:49](#msg628bd753e393a31806200ddb)@gurzgri If you create some documentation on debugging, Toomas and other developers could help.

gurzgri

[19:02](#msg628bda404aa6c31dca17ba63)It doesn't take more than a console compiled in `--debug` mode to see what's going on, additionally or alternatively a statement with `statement/state/debug?: on` to inspect binary buffers transferred and the usual discipline and systematic approach which Toomas undoubtedly has in abundance ;)

GiuseppeChillemi

[19:21](#msg628bdec306a77e1e184f13ce)Toomas is a newbie in Red, I think you should help him in every step. Maybe with some patience, we will bring him to do great things!

toomasv

[19:27](#msg628be00a06a77e1e184f16cf):baby:

gurzgri

[19:28](#msg628be044ef00bd1dc6f663bf)An \*outperforming* newbie :baby:, if any. ;)

[21:02](#msg628bf66467db9a59dbe3d380)Silly me :open\_mouth:  
&gt; Actually RED ODBC is capable of reading but not writing them.

Have you ever tried writing them, @GiuseppeChillemi ? :smirk: I for sure never tried. I better should have tried ...  
&gt; Writing BLOB/TEXT isn't possible yet

is obviously just plain wrong and no `poke statement` is needed (at least as long as we aren't talking \*really large* blobs and texts). Just now I could easily insert BLOB/TEXT of moderate sizes (the source of https://www.red-lang.org and a 150Kb PDF) into a PostgreSQL table in columns of dataype `text` and `bytea` without further ado ...

GiuseppeChillemi

[21:04](#msg628bf6cdc61b987d33c304e9)??? Is it ALREADY working?

gurzgri

[21:05](#msg628bf705da83520ac3466d1a)That is what I just ... well ... discovered ... :grinning:

GiuseppeChillemi

[21:05](#msg628bf720c61b987d33c30579)But you are the author!!! OMG!!! :-DDDD

[21:05](#msg628bf737e393a318062051dc)However, it is a fantastic news.

[21:06](#msg628bf760c61b987d33c30603)Do you think it could work in SQL Server BLOB column?

gurzgri

[21:07](#msg628bf7ac7df86c141e9d179a)You're probably better off checking on your own, as I'm obviously not an authority regarding the capabilities of my own code ...

GiuseppeChillemi

[21:08](#msg628bf7d14e38f759e28534b1):-D

[21:08](#msg628bf7dbda330517ff8eaa81)Tomorrow I will check.

[21:09](#msg628bf7f64aa6c31dca17f5e2)Why are you writing "of moderate size"? what established the limit?

gurzgri

[21:11](#msg628bf884f8daa71e0794465c)Because your usual 15 Gb disk image is likely not to work.

GiuseppeChillemi

[21:14](#msg628bf91f4aa6c31dca17f7c8)Could 20MB work ?

gurzgri

[21:14](#msg628bf947c61b987d33c309ef)I don't know.

GiuseppeChillemi

[21:14](#msg628bf950deea5616bbc14ce9)I'll try and report

[21:15](#msg628bf96d4aa6c31dca17f84e)Could I ask if you have any news on the LF problem?

gurzgri

[21:19](#msg628bfa69da330517ff8eafbe)No news. And likely no further investigons on this. I'm still not convinced it's realy scheme related if happening only in/with gui console. I don't know of a way to reproduce it.

[21:21](#msg628bfabc67db9a59dbe3dbbc)There is zero gui / cli only code in the scheme, it either happens in both consoles or it likely happens in gui console for reasons out of my reach.

GiuseppeChillemi

[21:21](#msg628bfac309eea00adeac2185)If you want we could schedule a meeting and I give you access to my server machine, where I can always reproduce the problem

gurzgri

[21:21](#msg628bfaecf8daa71e07944a5e)Sorry, I am not available for that.

GiuseppeChillemi

[21:23](#msg628bfb39e393a31806205b1f)It is out of my knowledge why there is a LF between values save ONLY in GUI console.

[21:24](#msg628bfb7a7df86c141e9d1e75)&gt; Sorry, I am not available for that.

Ok, It was just a proposal. I would like to have the knowledge needed to debug it.

## Tuesday 24th May, 2022

rebolek

[11:19](#msg628cbf45e393a3180621da56)@toomasv I couldn’t resist and wrote proof-of-concept of CSV scheme for Red, so it’s possible to open large CSV files without loading whole file in memory.

The usage is of course different from the CSV codec, it works like any other scheme:

```
port: open csv:///data.csv
port: skip port 200 ; go to line 200 in CSV data
data: copy/part port 10 ; return 10 records (lines) from CSV
```

The scheme first must scan the file for newlines, so it knows where each record begins (of course, it ignores newline inside cells). This is done in the `open` action, so there is some overhead.

The scanning is buffered, only a part of file is read into memory and searched. How long this phase takes depends on the size of data and size of the buffer. For the `%WDIData.csv` from your example dataset (around 200MB), scanning takes around 1:20 with buffer size about 0,5-1MB (that’s the optimal size I found). Once the scanning is done, random acces is instant.

It may seem that about one and half a minute is a long time, but because the scanning is buffered, with the new IO, it can by done asynchronously and the CSV may be partially accesssible even before the scanning is finished. This would need more work of course.

[11:21](#msg628cbf9fc9382316a61df13b)Another optimalization could be for example saving index for each scanned file, so subsequend `open`ing would be much faster. As I wrote, it’s just a PoC now.

GiuseppeChillemi

[11:21](#msg628cbfb6f8daa71e0795c141)Nice experiment, great!

toomasv

[12:47](#msg628cd3d4deea5616bbc2eec1)@rebolek Sounds good, thanks! Can I try it? A link?

rebolek

[13:39](#msg628ce001f8daa71e07960661)@toomasv of course: https://gitlab.com/rebolek/schemes

[13:40](#msg628ce050da83520ac3484117)It’s an initial release and currently it just collects lines from CSV and doesn’t convert them to Red values so you get block of strings. I also accidentally added the dataset to the repo so it’s hugu, sorry for that :) I’ll remove it.

toomasv

[14:42](#msg628ceed867db9a59dbe5bb38)Thanks, @rebolek !

rebolek

[14:57](#msg628cf252ef00bd1dc6f87b08)@toomasv you’re welcome! Let me know what you think of it and what you would want to see implemented there.

toomasv

[15:10](#msg628cf57bda83520ac3486e2f)@rebolek So, `copy/part` returns number of lines and each of these has to be separately csv-loaded. Would it be better/possible to return single string of n lines to be loaded once? Or may be I am missing something.

rebolek

[15:50](#msg628cfed7c9382316a61e7abd)@toomasv it should return a block of block with converted values, the conversion just hasn’t been implemented yet. I need to backport the loader from the CSV codec. This is really just a first version with a lot of things missing, but the main point, fast random access, is there.

[15:51](#msg628cfef3c61b987d33c5116f)Once it’s implemented, I let you know

toomasv

[15:51](#msg628cff07ef00bd1dc6f897e2)Ok, thanks a lot for your effort!

rebolek

[15:58](#msg628d00924e38f759e2874315)The first version will certainly be read-only (no `insert`/`append`/`write`/...). That’s going to be a separate challenge :)

gurzgri

[16:52](#msg628d0d5dc61b987d33c53061)Couldn't resist either and had an ODBC Text Driver go on that WDIData.csv:

```
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

```
>> dt [copy wdi] ;== 0:01:22.7897
```

which coincidentally seems to resemble your scanning time.

[16:59](#msg628d0ee7db6f627d259ac281)@GiuseppeChillemi And there's the chance for you to try to come up with something reproducible for your LF problem! Does is happen width the WDI sample data @toomasv used for his table-template, too, in gui-console that way with the Text Driver? Then provide the minimal reproducible example code and I'm more than happy to have another go on debugging.

rebolek

[17:07](#msg628d10c5da330517ff90d804)@gurzgri time is similar but that’s where the similarity ends :D I can just get offsets of each relevant newline in that time :D

GiuseppeChillemi

[17:08](#msg628d10fbd126691416b24614)@gurzgri I will try to anonymize the data of my company in respect to my customer's privacy and if the problem will be reproduced using your text loader, I will send you the archive.

[17:08](#msg628d1112e393a31806228635)Another great work! Thanks!

toomasv

[17:37](#msg628d17df4e38f759e28771c2)@gurzgri Thanks for the example! My times:

```
dt [change wdi: open conn: open odbc://text [access: 'dynamic]] ;== 0:00:00.0109964
dt [insert/part wdi "select * from WDIData.csv" 50] ;== 0:00:00.038935
dt [head wdi] ;== 0:00:00.0129694
dt [tail wdi] ;== 0:00:04.114
dt [close conn] ;== 0:00:00.0496009
```

gurzgri

[18:05](#msg628d1e68c61b987d33c551ba)A lot of examples are in `tests\source\environment\odbc-test.red` (even if a bit contrived by times to suit the test suite)

toomasv

[18:09](#msg628d1f3d7df86c141e9f5cf6)Aah, good, thanks!

## Wednesday 25th May, 2022

GiuseppeChillemi

[14:30](#msg628e3d6bc9382316a621000f)@rebolek What does this mean?  
`User Error: "Data are not aligned"`

I have tried to load the `CSV` dataset saved from SQL Server into RED

toomasv

[14:59](#msg628e446fef00bd1dc6fb1a0f)Not correct field (or line?) separators.

GiuseppeChillemi

[15:14](#msg628e47b8c61b987d33c79d8f)Is there a way to change it? I have ";" as field separator

toomasv

[16:05](#msg628e53ce4aa6c31dca1cb206)Can you show a part of your csv, just few lines?

GiuseppeChillemi

[17:28](#msg628e675867db9a59dbe8c213)@toomasv Here is the \[sample](https://gist.github.com/GiuseppeChillemi/b7a3412cac0882425e41dbb9b2e592e9)

toomasv

[17:38](#msg628e697eef00bd1dc6fb6f04)Here are number of elements on these 10 lines:

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

GiuseppeChillemi

[17:38](#msg628e699adb6f627d259d6a14)I am testing while writing to you

[17:38](#msg628e69b3d126691416b4fd87)If I remove about 3500 lines, it loads

gurzgri

[17:43](#msg628e6aceda83520ac34b5ff1)\[!\[image.png](https://files.gitter.im/6234feab6da037398492a62a/yd98/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/yd98/image.png)

[17:44](#msg628e6ae806a77e1e18542a9e)... there it get's distorted.

GiuseppeChillemi

[17:44](#msg628e6b044aa6c31dca1ce3ce)I was missing a READ in the middle of LOAD. Just a crazy attempt

[17:44](#msg628e6b11deea5616bbc61529)Now, the data always fails

[17:45](#msg628e6b52d126691416b50138)But it is SQL Server exporting the data, without any middleman, I can't believe it buggy, but it is.

toomasv

[18:03](#msg628e6f79da330517ff939f16)Yeah `serve123r\server123;mycompany\ammin;In Volus` (i.e. 3 elements) gets duplicated in longer lines instead of single integer in shorter lines. So, 2 excess fields. Is the duplication intentional?

GiuseppeChillemi

[18:11](#msg628e713f4aa6c31dca1cf056)No, it is not inteded. They sould be just 2: `USERINS`, `USERUPD`

[18:13](#msg628e71c906a77e1e18543881)Wait, maybe I have understood what is happening.

[18:16](#msg628e7270e393a31806253fbc)Both fields contains connection string which have the separator inside. I have seen it in the query result browser, they are not 4 fields but 2 with 2 connection inside, separated by `;`!

[18:16](#msg628e7292e393a31806253ff7)So SQL does not escape it the inner column characters

[18:17](#msg628e72c14e38f759e28a2c91)You have had eagle eyes!

[18:33](#msg628e765d7df86c141ea21d57)Is there a way to convert from block of blocks to CSV? I would query using RED DEBUG CONSOLE and save to CSV (If Red correctly escapes the separatos)

[18:34](#msg628e76a509eea00adeb11b3f)@rebolek Could you please add the line number where the first alignment error occurs?

[18:34](#msg628e76aeda83520ac34b79d5)Not now, in the future

[18:34](#msg628e76cf4e38f759e28a3415)Because it is very helpful for debugging purpose. It would be nice that any errors come with line number.

gurzgri

[18:43](#msg628e78c267db9a59dbe8e73c)

```
Red
>> collect [foreach row rows: [[1 "a;b"] [2 "c;d"]] [keep to-csv/with/quote row #";" #"^""]]
== [{1;"a;b"^/} {2;"c;d"^/}]
```

[18:44](#msg628e78fd4e38f759e28a38f9)with `rows: [[1 "a;b"] [2 "c;d"]` fetched thru ODBC ...

[18:53](#msg628e7b45db6f627d259d8f0d)No! Just `to-csv/with/quote rows #";" #"^""` is enough. Result is one big string.

[21:01](#msg628e9931f8daa71e0799798f)\[!\[image.png](https://files.gitter.im/6234feab6da037398492a62a/BHvA/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/BHvA/image.png)

[21:06](#msg628e9a67e393a3180625972a)@toomasv Over in https://gitter.im/red/red/gui-branch you wrote that odbc access with your %try-odbc.red  
&gt; tends to die at times

I think I've seen it too in a slighty modified script, sometimes it crashes with a `*** access violation` when wildly clicking thru different tables — is that the symptom you've discovered?

I therefore compiled a `%console.red` with `Needs: [View JSON CSV ODBC]` header including the View component with `--debug` switch `do/args %red.r "-r --debug %environment/console/CLI/console.red"`.

Then I tried again ... and I tried and tried and ... switched tables like mad (screenshot above).

Somehow debugging turned on seems to make this bug disappear :disappointed:

GiuseppeChillemi

[21:08](#msg628e9ac77df86c141ea26607)@gurzgri I have tried. I have saved the query result successfully but `load/as ... 'csv` creates a block where each line is a block with a big string inside. Is there the need to change the delimeters on load?

gurzgri

[21:21](#msg628e9dd47df86c141ea26c99)`help "csv"`, `help load-csv`. Chances are that in order to successfully parse the CSV the same delimiters have to be used as the ones used in the file.

[21:45](#msg628ea380ef00bd1dc6fbe1d2)If, however, you do not want to load it from Red but access it via ODBC Text Driver, you'll probably need a `schema.ini` file in folder where the csv is placed. More info here: https://docs.microsoft.com/en-us/sql/odbc/microsoft/schema-ini-file-text-file-driver?view=sql-server-ver16

[22:41](#msg628eb0b4ef00bd1dc6fbf993)Hm, @toomasv, now I finally sometimes manage to reproduce the crash. Fun thing is, that my EXECUTED-STATEMENT routine executes the API function SQLExecute, the API under circumstances returns an error, the error \*is* properly detected and only then when I try to R/S–`fire` an error, firing that error crashes ... :thinking: :dizzy: :zany\_face:

```
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

GiuseppeChillemi

[23:00](#msg628eb516e393a3180625c73f)You have solved the reason why I have not used the ODBC text driver. I have found no page that describe the delimeters in the connection string. With `schema.it`I can bypass this problem

[23:01](#msg628eb53def00bd1dc6fc00a3)`schema.ini`

[23:02](#msg628eb5a006a77e1e1854c5e6)But if you have a good page with all the connection string parameters for the text odbc driver, I will accept it too

greggirwin

[23:37](#msg628ebdd1da330517ff9434f0)Thanks for the continued improvments @gurzgri. Maybe @qtxie will have an idea on the error issue.

## Thursday 26th May, 2022

qtxie

[01:21](#msg628ed616c9382316a6222ed3)

```
***   stack: red/fire 0 010AE560h
```

How do you use `fire`? The first parameter of `red/fire` should be at least 2.

toomasv

[05:31](#msg628f10a367db9a59dbe9ff45)@gurzgri Thanks for looking into this! I tried to reproduce it also, but now it happened much less than before! But one place I now get consistent errors and occasional crashes is a mysql table having a field with type `geometry`:

[05:31](#msg628f10a7d126691416b63c1e)\[!\[image.png](https://files.gitter.im/6234feab6da037398492a62a/P841/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/P841/image.png)

[05:51](#msg628f15534e38f759e28b5bbb)Here is the error:

```
*** Script Error: ODBC error: ["HY000" 517 "[MySQL][ODBC 8.0(w) Driver][mysqld-8.0.29]"]
*** Where: execute-statement
*** Near : port/state describe-result port/state
*** Stack: do-file context view do-events do-actor do-safe
```

[06:28](#msg628f1e0606a77e1e18558444)\[Full debug session](https://github.com/toomasv/table-template/blob/main/try-odbc.debug) with shortest path to the error.

[06:29](#msg628f1e5dd126691416b653eb)Also, I notice constant warnings about "Invalid cursor state".

gurzgri

[10:18](#msg628f53f267db9a59dbea8154)@toomasv Thanks for the effort you put into this! Regarding the invalid cusor state, that was an annoying warning regression of the latest additions implementing cursor movement in current rowset. Pushed a fix for that and another.

The MySQL geometry datatype thing is a deeper issue with probably no other way to circumvent it than excluding it from a `SELECT` statement's result columns list — because of that datatype not being supported by ODBC at all from what I see, e.g. https://stackoverflow.com/questions/52058228/odbc-prepared-statement-for-table-with-a-geometry-column-type-throws-exception#comment91067758\_52058228. It's a good thing at least to me that it throws a (not so particular) error instead of crashing, the hopes however that unknown columns will just be returned as a string (I do that/try that) have not been fulfilled in this case.

But did I get that right, so far you've had no `*** access violation` errors?

toomasv

[10:26](#msg628f55bbc61b987d33c9ad71)@gurzgri Thanks for the info! And yes, I don't get any more `access violation` errors.

gurzgri

[10:44](#msg628f5a2bdeea5616bbc7e378)@qtxie The one argument to `fire` is a block, I think the call itself is legit: https://github.com/gurzgri/red/blob/5e5bc196cebc235b7434a4f619b0c9fc26d5c916/environment/schemes/odbc.red#L1622 with `odbc/odbc: word/load "ODBC"` and `odbc/common-field-errors`being an enum defined in https://github.com/gurzgri/red/blob/5e5bc196cebc235b7434a4f619b0c9fc26d5c916/environment/schemes/odbc.reds#L2701

[11:10](#msg628f6015e393a318062708ec)@GiuseppeChillemi Another thing you might try is compiling the CLI console %console.red with `Needs: [View JSON CSV ODBC]` header including the View component, then rerun your retrieval code and see if saving results intruduces the LF problem. If so and if it reliably doesn't happen when View is not `Needs:`ed, that I think would point to a problem with/in the View engine itself and not so much the GUI console.

[19:02](#msg628fced106a77e1e1856efe5)@toomasv Played a bit with MariaDB's various geometry datatypes: These  
\* \*can* be retrieved as deferred values, picking the deferred value gives `binary!` values like `#{00000000010100000000000000000024400000000000003440}`,  
\* \*can* be deferred as text with `select ST_AsText(g) as geo from gis_geometry` and  
\* \*can* directly be retrieved casted to varchar from text like so `select cast(ST_AsText(g) as varchar(256)) from gis_geometry`.

So not all hope is lost. But of course all this doesn't lend itself for a generic tool like your "table browser", which needs to be as schema agnostic as possible.

And now I'm curious why it doesn't work with MySQL, guess I finally need to install that too.

[19:21](#msg628fd3344e38f759e28cdde4)BTW, the whole `deferred` columns thing is a bit of a rushed design I'm not too happy with, but was a low hanging fruit to provide a way for Giuseppe to retrieve e.g. the PDF invoices from BLOB columns of his coporate database.

Fetching rows is done thru preallocated binary buffers of window size * num of columns bound to the API functions to write into, of course there is no way to preallocate 4294967294 bytes for each single BLOB/TEXT cell. That's why they are deferred, then they can be streamed thru a single buffer of reasonable size.

Instead of burdening the user with that, that process \*could* work automagically under the hood. But then inevitable there needs to be a some compromise in form of a configurable upper column size up to with BLOB/TEXT values will implicitly be loaded by the scheme.

And this threshold violates the principle of least surprise, because for the average user it will work without him knowing how and why, but suddenly the day will come where it "randomly" doesn't work because he stumbles over a value beyond that threshold ...

toomasv

[20:13](#msg628fdf5606a77e1e1857104b)@gurzgri Good news! Thanks for researching this. You are right of course, that the more general a tool strives to be the more it needs to deal with differences and quirks of diverse sources and hide these. I see this trying to make some common interface for different datasources. Or rather, trying to integrate these datasources through your odbc tool with the table widget.

gurzgri

[20:18](#msg628fe081e393a31806281030)Have you seen the `system/schemes/odbc/state/sources` function already? It lists all datasources configured in the (32bit) odbc panel. That way you wouldn't have to hardcode them. And then theres `insert statement [table]`, listing all tables.

[20:35](#msg628fe490c9382316a62446f2)@toomasv `columns: insert change stmt: open conn: open odbc://dsn [flat?: yes] 'tables probe tables: copy stmt probe columns close conn` lists all tables in datasource agnostic way, provides columns `[table-cat table-schem table-name table-type remarks]`.

[20:43](#msg628fe66ce393a31806281c3d)

```
Red
>> databases: unique extract/index tables length? columns 1
== ["information_schema" "mysql" "performance_schema" "sample" "sys"]
```

And the tables in only one database you can get with :

```
db: "sample" insert stmt compose [tables (db)] copy stmt
```

## Friday 27th May, 2022

toomasv

[02:58](#msg62903e45ef00bd1dc6ff07f8)@gurzgri Thanks! A lot to learn :baby\_bottle: :baby:

[08:47](#msg6290903ee393a3180629707d)@gurzgri Your docment says

&gt; Note that insert with catalog functions doesn't reduce the block, but will rather silently compose it to allow for easier dialecting.

But it seems not to `compose` it. Not a problem, it can be explicity composed, just a notice.

gurzgri

[10:58](#msg6290aeebf8daa71e079d9ba5)Thanks for noticing that, pushed fix for docs, dropped that sometime ago.

[11:01](#msg6290af8ec61b987d33cc6b2e)\*Misleading* docs are worse than \*no docs* ;)

[11:50](#msg6290bae8e393a3180629daad)I haven't really put too much effort in catalog functions for now, so they pretty much just follow the signature of the corresponding ODBC catalog functions like SQLTables, SQLColumns etc.

[11:59](#msg6290bd23e393a3180629df41)Better stay away from `strict` mode for now. It's \*very* picky if not buggy and it sometimes requires an `""` empty string instead of `none`:

```
>> insert maria [tables none none "gis_%line"] ;== finds me two tables
>> insert maria [tables none  ""  "gis_%line"] ;== finds no tables
>> insert maria [strict tables none "" "gis_%line"] ;== finds no tables (which is correct), but
>> insert maria [strict tables none "" "gis_line"] ;== finds no tables (in my case I somehow think it should), but
>> insert maria [strict tables none none "gis_%line"] ;   throws error HY009 "Invalid use of null pointer", which is far from obvious
```

toomasv

[15:33](#msg6290ef5c67db9a59dbedd1de)@gurzgri I rewrote it using \[odbc-only](https://github.com/toomasv/table-template/blob/main/try-odbc-only.red) with minimal hardcoded values. Still, could not avoid these entirely, because (1) there are more odbc drivers I care to use (some different versions etc.), and (2) I couldn't make `mariadb` behave without explicitly pointing out which database I want to see. Radio box at right changes view from data to columns, but again `mariadb` crashes on this transfer (occasionally `sqlite` too). Others seem to be stable.

gurzgri

[19:16](#msg62912384da83520ac350dc3b)So @toomasv has just recreated 75% of HeidiSQL / WinSQL in 75 LOC, how cool is that? :sunglasses: I will have a deeper look into the issues, but likely not before Pentecost, I'm on vacation for a week.

toomasv

[19:33](#msg6291277409eea00adeb67d3c)Well, yeah, + few K of your and my code in odbc and table :). But yes, when these get in place, it is piece of cake.

## Saturday 28th May, 2022

greggirwin

[17:27](#msg62925b6af8daa71e07a0e47e)Exciting stuff!

## Monday 6th June, 2022

bubnenkoff

[17:00](#msg629e32a1ef00bd1dc61a27fa)What of current status of this branch? I do not see branch named `-odbc` does it mean that it it now have another name? Or I am looking at wrong place?

greggirwin

[17:01](#msg629e32f8da83520ac369d412)There is no official Red branch for this.

[17:02](#msg629e33434e38f759e2a89472)@gurzgri took the initiative and we're cheering him on. Eventually I think it will be a very important module in the Red ecosystem.

gurzgri

[17:25](#msg629e388dda330517ffb26ada)@bubnenkoff `odbc` branch has been merged into `master` of \[gurzgri/red](https://github.com/gurzgri/red)

## Wednesday 8th June, 2022

gurzgri

[16:36](#msg62a0d0247df86c141ec5b8bb)@toomasv  
&gt; Radio box at right changes view from data to columns, but again mariadb crashes on this transfer

Looks like MariaDB with \[SQLColumns](https://docs.microsoft.com/en-us/sql/odbc/reference/syntax/sqlcolumns-function) makes \[SQLDescribeCol](https://docs.microsoft.com/en-us/sql/odbc/reference/syntax/sqldescribecol-function) return a `ColumnSize` of 536'870'911 `WCHAR`s, i.e. 1 GByte for column `"TYPE_NAME"`, leading to a `system/cpu/overflow?` when trying to preallocate a column buffer sized 1GByte × window size (1024 rows).

In effect, the scheme allocates a buffer of size `0` and a `*** access violation` being the inevitable result when \[SQLFetchScroll](https://docs.microsoft.com/en-us/sql/odbc/reference/syntax/sqlfetchscroll-function) was trying to write into that buffer.

I'm in the process of adding a check for that just now. But in essence it will be a showstopper for using the `'columns` catalog function with MariaDB, because with that check in place it will always `cause-error 'internal 'limit-hit`. Which is better than crashing, but ... sigh.

&gt; I couldn't make mariadb behave without explicitly pointing out which database I want to see

To set the catalog, use `change connection [catalog: "database"]`. Microsoft Text Driver doesn't like doing so if a statement has been opened already. Other datasources may be even pickier, not allowing doing so \*after* the connection itself has been established. And there is currently no way to do so \*before* the connection connects with the scheme.

[17:18](#msg62a0d9e4e393a31806492420)Pushed these fixes and some.

[18:31](#msg62a0eb044aa6c31dca40bfe3)@toomasv `try-odbc-only.red` \[gist](https://gist.github.com/gurzgri/a75c23b5e32fda1d3a5d7f62c23ecb46), with said MariaDB limitation (MySQL, SQLite not tested).

## Thursday 9th June, 2022

toomasv

[07:48](#msg62a1a5b3f8daa71e07be72ac)Thanks @gurzgri ! Will try soon.

gurzgri

[15:37](#msg62a213d0f8daa71e07bf6c12)Hacked gist so that it works for MariaDB, too.

## Friday 10th June, 2022

toomasv

[06:26](#msg62a2e4144aa6c31dca44a5bd)Interesting, thanks! Hmm, mariadb still crashing here.

gurzgri

[06:54](#msg62a2ea8d4e38f759e2b1fc30)Your're using gurzgri/red on commit 8a9606c and gurzgri/try-odbc-only.red on rev. 4? Sigh ... again.

[07:04](#msg62a2ecee67db9a59db10d589)I'm using MariaDB ODBC 3.1 Driver version 3.01.15.00 from 2021-11-15 here.

toomasv

[07:33](#msg62a2f3c07df86c141ec9f7f6)Ok, I fetched your updates and now it works. Thanks again!

gurzgri

[07:37](#msg62a2f49eda83520ac3733c36):relieved:

[09:14](#msg62a30b5d4aa6c31dca44faf1)\[!\[image.png](https://files.gitter.im/6234feab6da037398492a62a/pkI3/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/pkI3/image.png)

[09:14](#msg62a30b77c61b987d33f00c33)Rev. 5

## Sunday 19th June, 2022

bubnenkoff

[11:13](#msg62af04d876cd751a2f479727)@gurzgri I am trying to run my app and server is run on another IP. And I am getting next error:

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

[11:16](#msg62af059f568c2c30d3d55f3d)so it's connecting, but fail on execution of request. And by the log it's hard understand what happens

[12:12](#msg62af12928fe56a38b5a3265f)Same build work when DB is running on same host

[12:25](#msg62af15a69a314a3ec4b7196b)It's strange that it's not only from new server, from old server I am able to connect to DB and it's working

toomasv

[13:45](#msg62af2897b408e830dc1b60ad)@gurzgri Great! I'm back from a little trip. Are you really updating tables here?!

bubnenkoff

[14:14](#msg62af2f5c9f73251a2c60423d)I can't reproduce error above. After some success run my app from old server new instance begin work. I have one idea and will write if I would be able to reproduce error

[16:46](#msg62af52f33bbb38488985f292)Again error above... do not understand what's wrong...

[16:48](#msg62af5369d3c8894f71918c8f)what mean error `port/state describe-result port/state` ?

[16:59](#msg62af55fd9f73251a2c608b3a)For unknown reason this code is crush App on new server:

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

But `INSERT` statement work on both servers without error. The problem only with `DELETE`.

And I am use build from last commit. I tried downgrade, but same issue.

[17:50](#msg62af61fcef5ee44882b6f9b6)If to run App on same server where PG installed (I talk about new server) I am getting same error.

[19:11](#msg62af74e6fe909e3ec7dabcb1)prepared statement version:

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

## Monday 20th June, 2022

bubnenkoff

[07:17](#msg62b01f1aef5ee44882b860af)I tried to upgrade my dev PC to PG 14.4 it's works fine. Error happens only on new prod server

[07:48](#msg62b0266076cd751a2f49b700)debug version:

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

[08:07](#msg62b02acc76cd751a2f49c36e)After some testing: the error happens on every instance. I used old build without this code so I thought it work. After updating all App I got error on every server

[14:01](#msg62b07db5b408e830dc1df351)Continue trying to get more info about an error:

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

gurzgri

[17:29](#msg62b0ae91ab6b634f7352c2e7)@bubnenkoff `SQLExecute 100` means executing the statement returns `SQL_NO_DATA`. I've by myself stumpled upon that recently and had fixed it already, but hadn't yet pushed the fix. Made up for just now, please pull again.

[17:34](#msg62b0af993bbb384889889994)@toomasv  
&gt; Are you really updating tables here?!

Yes, odbc:// not only supports `SELECT` but `INSERT`, `UPDATE` and `DELETE` statements, too. If your table template allows for some sort of "on-cell-change" handlers, writing back edits to the database should be quite possible.

bubnenkoff

[19:25](#msg62b0c9999f73251a2c63714b)&gt; @bubnenkoff `SQLExecute 100` means executing the statement returns `SQL_NO_DATA`. I've by myself stumpled upon that recently and had fixed it already, but hadn't yet pushed the fix. Made up for just now, please pull again.

Big thanks! It seems that now it's working!

## Tuesday 21st June, 2022

bubnenkoff

[11:25](#msg62b1aabb76cd751a2f4ced43)I am getting some strange crush.

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

[11:27](#msg62b1ab3222c53438bcb04fc1)The crush if very strange. Few instance of app it working fine. Few is failing at DB insert stage with an error:

```
Runtime Error 1: access violation
```

It seems that there that difference in parameters. I am trying to dump them.

[13:05](#msg62b1c20e3bbb3848898ada73)I am trying to find reason of crush. I wrote next code.

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

[13:28](#msg62b1c77a76cd751a2f4d2f01)Bingo! The reason of

```
*** Runtime Error 1: access violation
*** at: 54B6282Eh
```

is different parameters types!

Real app is crushing with `access violation` error, but example just show error above.

greggirwin

[16:18](#msg62b1ef469a314a3ec4bcd8f4)Thanks for the continued testing and reports @bubnenkoff. :+1:

gurzgri

[18:00](#msg62b2073a1227f62be3ae0406)@bubnenkoff The `*** Script Error: values must be of the same type` error is intentionally thrown when the paramaters in a given parameter column are of different types (not counting `none`, which \*is* allowed). Of course that error should \*not* result in a `*** Runtime Error 1: access violation` — is that really what's happening (script error + access violation)? I'll have to investigate wether this is a possible situation.

But what might cause the `*** Script Error: values must be of the same type` here is probably your `prepared-values-part`: Could it be that `true` and `none` are again of type `word!` instead of type `logic!` and `none!`? If so, the `"appRejectedReason"` parameter would consist of `string!` and `word!` and the parameters would be rejected.

bubnenkoff

[18:39](#msg62b2105c0a522647985ba50a)That's very strange I am getting random crush if run app many times on same file:

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

[18:48](#msg62b21281904f20479a145cff)interesting moment. If text is long (200-300 symbols) it's crush 10 times from 10 attempts. If text is short there is some chance that it do not crush

gurzgri

[18:50](#msg62b212db9a314a3ec4bd2591)\[!\[image.png](https://files.gitter.im/6234feab6da037398492a62a/s1R5/thumb/image.png)](https://files.gitter.im/6234feab6da037398492a62a/s1R5/image.png)

[18:50](#msg62b212e40a522647985baa54)@toomasv Finally! By casting some pagan magic spells from the Ancient Book of Kernel the 32th instead of calling upon Malloc from the Depth of Red/System I finally unleashed the ODBC Powers of SQLite thru the Aethers of the SQLite ODBC Driver.

In other words: Now even SQLite / \[SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) works :tada:

[18:52](#msg62b213653bbb3848898b7e0b)(probably minus some occasional crashes every now and then)

bubnenkoff

[18:52](#msg62b2137a0a522647985bab5f)

```
INSERT INTO applications ("lotNumber", "purchaseNumber", "admitted", "appNumber", "appRating", "increaseInitialPrice", "offer_price", "firstOffer_price", "firstOffer_increaseInitialPrice", "lastOffer_price", "lastOffer_increaseInitialPrice", "bestPrice", "finalPrice", "journalNumber", "lastOfferPrice", "participant_contactEMail", "participant_address_post", "participant_address_fact", "participant_phoneNumber", "participant_fullname", "participant_inn", "is_individualPerson", "individualPerson_address", "individualPerson_phone", "individualPerson_contactEMail", "individualPerson_inn", "winnerPrice", "appRejectedReason") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
[[0 "0176200005516000137" true none none none none none none none none none none "1" none none none none none none none none none none none none none {Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.}] [0 "0176200005516000137" none none none none none none none none none none none "2" none none none none none none none none none none none none none none]]
```

For example this peace is crush real app every time. I am trying to find length when inserting begin work.

[18:55](#msg62b214160a522647985bac6e)with:

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
```

5 crush with `Runtime Error 1: access violation` and 1 success

[19:06](#msg62b216bd76cd751a2f4dd57b)\[!\[изображение.png](https://files.gitter.im/6234feab6da037398492a62a/N2Dr/thumb/izobrazhenie.png)](https://files.gitter.im/6234feab6da037398492a62a/N2Dr/izobrazhenie.png)

gurzgri

[19:16](#msg62b219130a522647985bb688)Insert `foreach row prepared-values-part [probe collect [foreach prm row [keep type? prm]]]` there, post the output here.

bubnenkoff

[19:21](#msg62b21a4d1227f62be3ae2e24)in place of `here` on screenshot?

[19:27](#msg62b21ba71227f62be3ae3038)

```
INSERT INTO applications ("lotNumber", "purchaseNumber", "admitted", "appNumber", "appRating", "increaseInitialPrice", "offer_price", "firstOffer_price", "firstOffer_increaseInitialPrice", "lastOffer_price", "lastOffer_increaseInitialPrice", "bestPrice", "finalPrice", "journalNumber", "lastOfferPrice", "participant_contactEMail", "participant_address_post", "participant_address_fact", "participant_phoneNumber", "participant_fullname", "participant_inn", "is_individualPerson", "individualPerson_address", "individualPerson_phone", "individualPerson_contactEMail", "individualPerson_inn", "winnerPrice", "appRejectedReason") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
[[0 "0176200005516000137" true none none none none none none none none none none "1" none none none none none none none none none none none none none {Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.}] [0 "0176200005516000137" none none none none none none none none none none none "2" none none none none none none none none none none none none none none]]
------------------------------------------------------
[integer! string! logic! none! none! none! none! none! none! none! none! none! none! string! none! none! none! none! none! none! none! none! none! none! none! none! none! string!]
[integer! string! none! none! none! none! none! none! none! none! none! none! none! string! none! none! none! none! none! none! none! none! none! none! none! none! none! none!]
here
```

gurzgri

[19:33](#msg62b21cf876cd751a2f4de5b8)Okay so, that's legit. Turn `date-insert-statement/state/debug?: on` then in this particular line and let's see how the param buffer looks like.

bubnenkoff

[19:34](#msg62b21d2e76cd751a2f4de5f4)I should to add this line to header of app?

[19:35](#msg62b21d750a522647985bbf9f)

```
data-insert-statement: open connection
        date-insert-statement/state/debug?: on
```

Would it ok?

gurzgri

[19:36](#msg62b21dd3fe909e3ec7e02ada)Well, probably just about everywhere \*before* line 421 in the above screenshot would be okay.

bubnenkoff

[19:40](#msg62b21ec4ab6b634f7355e6b3)https://gist.github.com/bubnenkoff/e4003a75a2f328740ceffcf6bf51db7e

greggirwin

[19:40](#msg62b21ec9ef5ee44882bcafe9)@gurzgri :clap:

gurzgri

[19:53](#msg62b221ac9f73251a2c6639b1)Thanks, Gregg.

bubnenkoff

[20:09](#msg62b2257ad3c8894f71974a74)interesting:  
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

gurzgri

[20:09](#msg62b2259222c53438bcb15f11)@bubnenkoff The buffer

```
04F94628:  4c00                               L.
04F948B8:  6900 6100 ffff ffff                i.a.ÿÿÿÿ
```

allocated for the param really looks fishy. It's only 2 bytes big instead of `(length? {Lorem ipsum ... est laborum.}) + 1 << 1 ;== 892 bytes` big. And I might already have an idea why. It's probably an artefact of the `none` param in row 2. I'll have a look.

[20:52](#msg62b22f9ab408e830dc219664)Definitly a regression, pushed a fix for that. Please pull and try again, @bubnenkoff .

## Wednesday 22nd June, 2022

bubnenkoff

[07:10](#msg62b2c05c904f20479a15a6fc)@gurzgri perfect! It Works!

toomasv

[07:15](#msg62b2c18176cd751a2f4f1921)Great news, @gurzgri , thanks! :+1:

## Tuesday 28th June, 2022

gurzgri

[15:24](#msg62bb1d49b408e830dc540b05)So here's a story from an intense bug huntig journey - you've all have been there before:

The ODBC scheme had some instability with crashes due to access violations every now and then. But without any noticeable pattern. Most of the time it just worked fine.

Then I tried to get it to play with SQLite. Everything worked fine with SQLite except retrieving results. And retrieving results worked fine with every other database I've tried so far. Somehow, I've managed to trace it down to some process heap memory issue, but wasn't up to the task of debugging it further and really got no hold of the error. The allocating/freeing logic looked okay, e.g. I wasn't freeing memory still in use and other such things.

So I've replaced all `allocate`/`free` calls with direkt calls to HeapAlloc/HeapFree. And .. SQLite results suddenly could be retrieved. Of course I didn't thought the underlying problem as being solved though, it was more like post-poned. But the problems went away and I ccontinued with cleaning up and refactoring the code. Fine.

Then suddenly the error came back. Now SQLite result retrieval wasn't possible in 10 out of 10 trials, yet again it was working with other databases. All the same symptoms as before. And creating a new heap next to the processes `GetProcessHeap` default heap didn't help either. So I finally wrote my own heap walker function which allowed me to have an eye on every allocation I've made and surrounded all API calls with functions inspecting the Heap validity before and after calling them.

Doing this made it really became clear that the Heap was intact before a call to `SQLDescribeCol` and wasn't intact after.

So it wasn't exactly \*me* who invalidated the heap, but it was SQLite. But of course I couldn't just assume that it's the SQLite drivers fault, which worked fine with other tools. Somehow it \*must* have been \*me* allowing it to overwrite some buffer ...

And so it was: I erroneously told `SQLDescribeCol` that the buffer to return a column name in was `len` wide chars big whilst it really was only `len` bytes big (half the size). The buffer still was large enough to keep all column names I've encoutered so far, but the driver wrote past its end anyways.

Fixing the buffer size parameter to the correct wide char length made SQLite behave nicely. With the fix in place, I'm e.g. not able to get Toomas' table browser to crash anymore.

Working out all this low lowel stuff ate 2-3 weekends in a row and every minute of spare time in between.

In hindsight, the solution was just simple buffer size math. But what a relieve to know that the problem is solved! And I for sure learned myself a lesson or two on the way.

PS: The fix hasn't been pushed yet. Now that I know that I can get rid of the HeapAPI functions and rewrite it to just use Red/System's `allocate`/`free` again ...

Respectech

[15:31](#msg62bb1eb99f73251a2c98f650)Wow, great work!

GiuseppeChillemi

[16:01](#msg62bb25cd904f20479a478c5e)I have read every line like it was an intense adventure. Great work, I know what is working with passion and you have it.

toomasv

[16:49](#msg62bb31379f73251a2c997ff0)Congratulations, @gurzgri, great adventure !

greggirwin

[18:38](#msg62bb4ab51227f62be3e2806a)Fantastic work @gurzgri! Thank you for all your efforts.

[18:39](#msg62bb4acad3c8894f71cc0e31)And thank you for sharing the story. It will help others so much.

## Monday 4th July, 2022

GiuseppeChillemi

[20:37](#msg62c34f9c1227f62be31bd3e2)@gurzgri Is there any reason why this column `s.importodare` is translated to `importo-dare` in Red ODBC? (note, `s` is an alias)

gurzgri

[20:46](#msg62c351b53bbb384889f8e84d)What does statement/state/columns look like \*for this specific* column? And what do you expect instead?

GiuseppeChillemi

[21:00](#msg62c3550bab6b634f73c339c5)

```
[
   ...
   importo-dare "ImportoDare" 2 1 38 2 1 handle! 39 handle!
   ...
]
```

[21:02](#msg62c3554fd3c8894f7105e2c0)But I can see all the others having this behaviour too

[21:02](#msg62c3557a0a52264798c823e6)It seems they are split at each change from lowercase to uppercase

gurzgri

[21:03](#msg62c355acb408e830dc8ed627)See \[Column names](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md#column-names)

GiuseppeChillemi

[21:08](#msg62c356ebfe909e3ec74d6c1d)I thought it was only intended for `My Column` which are then translated to `my-column` but why on `MyColumn` too?

gurzgri

[21:16](#msg62c3589d3bbb384889f91c31)Because that is uncommon casing in Redbol languages since the very beginning, see e.g. \[Hyphenate Multiple Word Names](http://www.rebol.com/r3/docs/concepts/scripts-style.html#section-9)

GiuseppeChillemi

[21:23](#msg62c35a6e3bbb384889f92749)In this situation, we are in a different scenario. Column names are meant to be keys, so I think it is important to maintain a 100% equivalence.

[21:26](#msg62c35b21d3c8894f71060ded)I use a query to retrieve column names and datatypes. I create an automatic object using those words and also the update/insert query creation code is fully automatic.

[21:28](#msg62c35b80568c2c30d349a825)However, having the second column as the original name solves this situation but I think many will fall into this problem as you don't expect it.

## Tuesday 5th July, 2022

GiuseppeChillemi

[00:22](#msg62c38455568c2c30d34acdb9)Also: is it possible to have other information on the query result query like the column datatype, length, if it is nullable... ?

[07:39](#msg62c3eab1ab6b634f73c75964)I have a bug, confirmed in the latest version I have just downloaded. If I write a query with this malformed where clause (a placeholder has not been replaced) the interpreter crashes and closes:

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

gurzgri

[10:50](#msg62c4177a9a314a3ec4303648)Please open a ticket with a minimal reproducible example and proper debug output of --debug compiled console.

[10:55](#msg62c418beab6b634f73c8ac56)@GiuseppeChillemi The `statement/state/columns` block keeps an internal copy of such information with layout as defined from https://github.com/gurzgri/red/blob/3289753aef4a15f7bdc9e3e9092ca40bd9ab15c5/environment/schemes/odbc.reds#L2738 on. Or consider having a look into docs, there are dedicated means for such things.

## Thursday 14th July, 2022

GiuseppeChillemi

[09:30](#msg62cfe249568c2c30d3a3339d)I have an error on insert, here is the issue I have opened: https://github.com/gurzgri/red/issues/6

gurzgri

[19:40](#msg62d07129904f20479adf8b2a)@GiuseppeChillemi No. You do not have an error on `insert` there. You have an error on `copy` there. Which is expected and fully legit: First you manipulate data with an SQL `INSERT` statement and throw away / ignore the result `insert` returns for that (the number of rows inserted). Then you immediatly try to fetch rows with `copy` without having queried for any with an SQL `SELECT` statement first. Hence: invalid cursor state.

GiuseppeChillemi

[21:12](#msg62d086ac3bbb38488956a224)@gurzgri Thank you, here is another problem, the one I have talked to you some time ago. You shuld use same table and seme code bu just only `insert`

https://github.com/gurzgri/red/issues/7

gurzgri

[22:03](#msg62d092abd3c8894f71643399)@GiuseppeChillemi But isn't `INSERT INTO xeventslog (type) VALUES ("Record")` just \[invalid SQL](https://stackoverflow.com/questions/1992314/what-is-the-difference-between-single-and-double-quotes-in-sql)?

GiuseppeChillemi

[22:12](#msg62d094ccfe909e3ec7ab19d1)Yes, it is on purpose

[22:13](#msg62d094f476cd751a2f19ed1f)It was and error in my conversion code this malformed sql let Red crash

gurzgri

[22:14](#msg62d09536ab6b634f7321b914)I see no crash. It throws an error. You even cited it: `*** Script Error: ODBC error`.

GiuseppeChillemi

[22:14](#msg62d09554b408e830dced59ce)Here the GUI console closes

[22:14](#msg62d095629f73251a2c31bd32)I have forgot to wite this

[22:15](#msg62d09569904f20479ae09442)\*write

[22:15](#msg62d0957a76cd751a2f19f141)\*forgotten

gurzgri

[22:15](#msg62d095839a314a3ec488fa13)You even "forgot" to provide the code which is failing.

GiuseppeChillemi

[22:16](#msg62d095b8d3c8894f71644b84)I have writte it is the same of issue #6 but just the insert

[22:16](#msg62d095c922c53438bc7e3bb0)No copy and subsequent code

gurzgri

[22:17](#msg62d096138fe56a38b5752950)It's just that I can't read minds. Especially not yours, it seems ;^)

GiuseppeChillemi

[22:21](#msg62d096e9ab6b634f7321c611)OMG I am going in front of my pc to correct my disasters

[22:26](#msg62d09809904f20479ae0aa33)The code is the following:

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

[22:27](#msg62d0983f22c53438bc7e4a41)This kind of query, crashes RED (EDITED)

gurzgri

[22:37](#msg62d09ab29f29d42bed58875b)Is that `$$`-quoting a thing with SQL Server or is it something you‘ve invented? Never came across that so far.

GiuseppeChillemi

[22:45](#msg62d09c6ffe909e3ec7ab4b7f)I use a `$$` as delimiters for placeholders. The word in the middle and placeholder is replaced with the corresponding Red word. So I have discovered that if you make an error in the column name, then everything crashes.

[22:48](#msg62d09d589f73251a2c31fac4)I have created a function called `apply-values` so you can:

```
apply-values the-string make object! [record: "Record type 22"]
```

so the word `record` in string and its delimiters is replaced with the content of the word `record` in the context. In this situation the string would be converted to :

```
the-query: {insert into xeventslog (type) values ('Record type 22')}`
```

gurzgri

[23:22](#msg62d0a5188fe56a38b5758f5a)@GiuseppeChillemi With SQLite I get

```
>> insert chinook {insert into Genre (GenreId, Name) values (99, $$Record$$)}
*** Script Error: ODBC error: ["HY000" 1 "parameter marker count incorrect (1)"]
```

in GUI console. `"Record"` it inserted as if I'd given it as `'Record'`.  
With Postgress I get

```
>> insert depot {insert into publishers (publisher_id, name) values ('bad0bad0bad0', "Record")}
*** Script Error: ODBC error: ["42703" 1 {ERROR: column "Record" does not exist;^/Error while preparing parame
```

in GUI console. `$$Record$$` it inserted as if I'd given it as `'Record'`.

None of these crashed the console.

GiuseppeChillemi

[23:29](#msg62d0a6c5ab6b634f732238f5)SQL Server here...

[23:29](#msg62d0a6eb8fe56a38b5759995)I will investigate more and report the errors again.

## Friday 15th July, 2022

GiuseppeChillemi

[22:21](#msg62d1e85c904f20479aea413c)@gurzgri I apologize if I ask it again but I have had no answer. Does you version of Red includes I/O?

## Sunday 17th July, 2022

gurzgri

[14:36](#msg62d41e661227f62be393ae96)No.

GiuseppeChillemi

[18:35](#msg62d4566bab6b634f733c35b1)Ok, let's wait for the Red team to merge it.

## Friday 29th July, 2022

bubnenkoff

[07:40](#msg62e38eee7ccf6b6d458bb87a)Could you update your branch with latest red branch. There was import fix with `unique` that I heavy use in my project.

## Monday 1st August, 2022

gurzgri

[14:33](#msg62e7e41fb16e8236e34d97e0)Did so.

GiuseppeChillemi

[15:59](#msg62e7f84899949962933a9a8c)Nice, I needed it too.

## Saturday 20th August, 2022

GiuseppeChillemi

[18:22](#msg6301266b647d633cf6a8a691)If I make a select query of a table which has no unique IDs for rows, is there a way to get a sql Internal one, so I can write back to the same read rows, the modification I have made to them in Red?

gurzgri

[19:38](#msg63013843443b7927a79ef39c)That's `change statement [bookmarks?: on]`. It retrieves the rows with an additional first column being a bookmark column by which the db server can track/identify rows without them being part of the table themself.

The scheme however for now supports such bookmarks with SELECT statements only, not with INSERT, UPDATE, DELETE statements. That's because ODBC (the API, not the scheme) uses bookmarks in a totally different way than normal statement execution.

## Tuesday 4th October, 2022

bubnenkoff

[08:00](#msg633be8012a06f4566b1df658)@gurzgri Could you do merge with latest Red branch? There was few important fixes

[09:46](#msg633c00ddb4ccef19d02232ef)oh please wait before regression reported in main chat will be fixed

## Tuesday 11st October, 2022

bubnenkoff

[07:42](#msg63451e71fbade7016eb7f92a)Can't build the latest version from git.  
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

[08:10](#msg6345250f64f29419bfd2ee19)it's very strange. Error above is disrepair if not close Rebol console and run in it:

```
do/args %red.r "-r %environment/console/CLI/console.red"
do/args %red.r "-c -e  %/d/code/zakupki/XMLParser/XMLParser.red
```

If close Rebol console after first command and then open again and run second command I am getting an error above

[08:15](#msg6345261434982518bdf2d57c)But I still can't connect to DB. I tried to un next code in red-odbc console.

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

[08:25](#msg63452865773e7e5c7bccc6df)I have found solution.  
The name PostgreSQL driver on different configurations could be different.  
To check it you need to open ODBC driver manager.  
For example for my new PC name become:

```
PostgreSQL ODBC Driver(UNICODE)
```

So this code with fixed name work:

```
connection: open make port! [
    scheme: 'odbc
    target: "driver={PostgreSQL ODBC Driver(UNICODE)};server=127.0.0.1;port=5432;database=fz44;uid=postgres;pwd=12345"
]
```

gurzgri

[13:20](#msg63456da09a0ad66a76039ba8)@bubnenkoff Re: "To check it you need to open ODBC driver manager." No, nigh impossible to believe that `system/schemes/odbc/state/drivers` returns a driver name other than the one listed in the admin panel and the one required to connect. And impossible to tell, too, because it looks as if by now the original output (which was posted here only incomplete anyways) has been deleted.

## Sunday 11st December, 2022

bubnenkoff

[12:02](#msg6395c6b9865cc926ae56711b)hi! When I am executing count(\*) request I am getting answer in nested block like: `[[123]]`  
Is there any way to get result without nesting?

## Monday 12nd December, 2022

gurzgri

[19:28](#msg639780d4b9b68753418fd135)Yes, there is. I'm sure you'll find something in the \[documentation](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md).

## Tuesday 13th December, 2022

bubnenkoff

[07:47](#msg63982e0883b5463b6efe8dc8)@gurzgri could you prompt place? I really can't find it

gurzgri

[11:21](#msg6398604b89c38775e75ce2b1)So you don‘t want nested blocks, fine. What antonyms for „nested“ can you think of and with these, which hits can you obtain with a `ctrl+f` search in the docs?

bubnenkoff

[15:02](#msg639893fda8211f623d7f339c)Oh I understood! When I read it I did not understand idea of `flat row`  
Am I right that it's setting on connection level and there is no way to get flatten result only for one type of query?

gurzgri

[17:03](#msg6398b06ab9b6875341921987)&gt; To retrieve results in flat fashion, on scheme, connection or statement level set ...

So, no: It is a setting on either i) whole scheme, ii) connection, iii) statement level.

But by "type of query" you're probably asking for flat retrieval for a "count" query and block retrievel (block of row-blocks) for generic result-set returning queries. But that's not how ODBC works. A "count query" is a result-set returning '`SELECT` query just as good as any other. Only for `INSERT`, `UPDATE`, `DELETE` queries the number of affected rows is returned as an integer.

## Tuesday 20th December, 2022

bubnenkoff

[06:41](#msg63a159288f8df4262ab3fdbf)@gurzgri thanks for merging! I just wanted to ask about it)

## Saturday 24th December, 2022

bubnenkoff

[06:32](#msg63a69d03410c633d48f1ad47)Is it possible to use ODBC driver on Mac/Linux?

gurzgri

[11:27](#msg63a6e21051d2482e91d5df90)@bubnenkoff No, that is not supported yet (btw, as per ↑ \[documentation](https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md#:~:text=The%20ODBC%20scheme%20is%20currently%20available%20only%20for%20the%20Windows%20platform%2C%20other%20platforms%20may%20follow.), again). I don't think it would require too much work, but currently I have access to neither Mac nor Linux machines. It for sure would be a fun experience to do so, but nothing I plan to address before Red reaches 0.7 or even 1.0 with a stable module system allowing for custom modules. Until modules, ports and I/O stuff settles, further ODBC scheme development is on hold.
