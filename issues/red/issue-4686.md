
#4686: Data corruption when PUTting to MAP! during PARSE when CLEAR is involved
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/4686>

This one is a bit tricky, as you can see from the title. A lot of assumptions must be fulfilled to trigger this one but it pays off, the result is interesting.

Basically I'm parsing some data and storing them into map of maps. I reuse the inner map (it's `clear`ed after each use and copy is stored in the top-level map). When I *don't* reuse the map (when I use `links: copy #()` instead), the bug is gone.

Here's the code to reproduce the bug (it's bit longer, sorry):

```
Red[]

data: #(
    AZ: {<option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=810">Parker</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=451">Star Valley</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=541">Tombstone</option>}
    CA: {<option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=679">Porterville</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=564">Reedley</option>}
    ID: {<option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=447">Ada County</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=458">American Falls</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1080">Bellevue</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=960">Blackfoot</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1079">Boise</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=826">Challis</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1034">Council</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=516">Dalton Gardens</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1001">Eden</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=880">Filer</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1016">Franklin</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=694">Genesee</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=893">Gooding</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=585">Grangeville</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=891">Hansen</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1039">Harrison</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1047">Kamiah</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=809">Kendrick</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1045">Kootenai</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1075">Latah County</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=497">McCall</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1085">Moyie Springs</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=871">Owyhee County</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=998">Rigby</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=538">Rupert</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=462">Stanley</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=704">Troy</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=379">Twin Falls</option>}
    IL: {<option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=1025">Abingdon</option><option value="http://www.sterlingcodifiers.com/codebook/index.php?book_id=834">Barry</option>}
)

bug: func [
        /local out links link name
][
        out: clear #()
        links: clear #()
        foreach [state reply] data [
                parse probe reply rule: [
                        some [
                                        {<option value="} copy link to #"^""
                                        thru #">" copy name to #"<"
                                        </option>
                                (put links probe name link)
                        ]
                ]
                unless empty? links [
                        put out state copy links
                        clear links
                ]
        ]
        out
]
```

Save this script and run it and then do `t: bug`. Now the fun begins:

* `words-of t` returns just `[AZ CA ID]` even if it properly parsed IL also. Those values just weren't added (if you put `probe links` after `put links name link` you'll see it stays empty on each step).

* what's even stranger is `length? t/ID` which returns `11`. If you do `probe t/ID` you can see it has ~28 key/value pairs.

**Platform version**

```
>> about
Red 0.6.4 for macOS built 13-Oct-2020/7:21:49
```



Comments:
--------------------------------------------------------------------------------

On 2020-10-22T10:48:20Z, endo64, commented:
<https://github.com/red/red/issues/4686#issuecomment-714408147>

    Here is the output on Windows, I see 11 pairs in `t/ID`
    
    ```red
    >> words-of t
    == [AZ CA ID]
    >> ? t
    T is a map! with the following words and values:
         AZ  map!          ["Parker" "Star Valley" "Tombstone"]
         CA  map!          ["Porterville" "Reedley"]
         ID  map!          ["Ada County" "American Falls" "Bellevue" "Blackfoot" "Boise" "Challis" "Council" "Dalton Gardens" "Eden" "File...
    
    >> length? t/id
    == 11
    >> ? t/id
    T/ID is a map! with the following words and values:
         Ada County      string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=447}
         American Falls  string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=458}
         Bellevue        string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=1080}
         Blackfoot       string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=960}
         Boise           string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=1079}
         Challis         string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=826}
         Council         string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=1034}
         Dalton Gardens  string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=516}
         Eden            string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=1001}
         Filer           string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=880}
         Franklin        string!       {http://www.sterlingcodifiers.com/codebook/index.php?book_id=1016}
    ```

