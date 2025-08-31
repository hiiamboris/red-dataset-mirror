# Archived messages from: [gitter.im/red/database](/gitter.im/red/database/) from year: 2023

## Thursday 2nd February, 2023

bubnenkoff

[08:17](#msg63db71b4bf77a52432838e13)Hi, @gurzgri how to check status of connection? I need prevent execution statement if connection was not opened?

```
odbc-count-request: function [] [
    insert xml-files-statement count-of-unprocessed-files-sql-query ; need prevent execution if connection not opened 
    ; ....
    ]
```

[08:23](#msg63db72f0a24223243863e65b)hm... possible solution is:

```
if error? try [
        insert xml-files-statement count-of-unprocessed-files-sql-query 
    ] [ 
        print "some error"
        exit
    ]
```

gurzgri

[11:51](#msg63dba3dd89339e0bf0c30589)That is the \*only* viable solution. There are means to check if a connection is alive with

```
>> select query connection "connection-dead"   ;== false
```

and without a connection succesfully opened you wouldn't be able to open a statement.

But of course in the timespan between evaluation of this `query` expression and the consecutive `insert` expression anything might happen: Somewhere whole new universes might be born eventually. And here, the connection might get lost in between due to networking problems and such.

The only way to know if executing a statement has failed is testing if executing has thrown an error or not. The future is predictable only in hindsight.

## Sunday 5th February, 2023

ProDimSum

[15:03](#msg63dfc53d6fc5ff38e44bf623)

```
Red [
    Title: "try crud"
    Needs: 'odbc
    
    ; Open Connection
    conn: open odbc://db.db
    
    ; Read table
    data: conn "SELECT * FROM users"
    view data
    
    ; Close Connection
    close conn
]
```

[15:04](#msg63dfc56b4a6a70544c89ec7f)can not read table from sqlite database

[15:56](#msg63dfd1c74ecd45446ec672cc)@gurzgri  
&gt; @toomasv Finally! By casting some pagan magic spells from the Ancient Book of Kernel the 32th instead of calling upon Malloc from the Depth of Red/System I finally unleashed the ODBC Powers of SQLite thru the Aethers of the SQLite ODBC Driver.  
&gt;  
&gt; In other words: Now even SQLite / \[SQLite ODBC Driver](http://www.ch-werner.de/sqliteodbc/) works :tada:  
&gt;  
&gt;

I installed this driver still can not read it.

[16:06](#msg63dfd41b62844178f6e68ebd)

```
Red [
    Title: "try crud"
    Needs: 'odbc
    
    ; Open Connection
    connection: open odbc://db
    
    ; Read table
    data: connection "SELECT * FROM user"
    view data
    
    ; Close Connection
    close connection
]
```

[16:19](#msg63dfd7259c90f8647b2cd8bd)do i have to import %odbc.red?

gurzgri

[22:29](#msg63e02dc1480b726318af07ed)@ProDimSum As Red user/custom modules aren't a thing yet and because of the ODBC scheme being dependent on Red/System code, it requires compiling. For now, you'll have the clone the repo https://github.com/gurzgri/red to your machine and compile yourself a ODBC enabled Red console or Red GUI console.

Once you've made it thru that step, using the scheme should feel pretty familier if you're used to REBOLs ODBC scheme. Make sure to study https://github.com/gurzgri/red/blob/master/environment/schemes/odbc.md though, there are some differences.
