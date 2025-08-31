![Red](https://static.red-lang.org/red-logo.svg)

# [Red Programming Language](https://www.red-lang.org/)

## Pages

- [Home](http://www.red-lang.org/)
- [About](http://www.red-lang.org/p/about.html)
- [Getting Started](http://www.red-lang.org/p/getting-started.html)
- [Download](http://www.red-lang.org/p/download.html)
- [Documentation](http://www.red-lang.org/p/documentation.html)
- [Contributions](http://www.red-lang.org/p/contributions.html)
- [Roadmap](http://www.red-lang.org/p/roadmap_2.html)
- [Privacy Policy](https://www.red-lang.org/p/privacy-policy.html)

## August 3, 2020

[]()

### A New Fast and Flexible Lexer

A programming language lexer is the part in charge of converting textual code representation into a structured memory representation. In Red, it is accomplished by the **load** function, which calls the lower-level **transcode** native. Until now, Red was relying on a lexer entirely written using the [Parse dialect](https://www.red-lang.org/2013/11/041-introducing-parse.html). Though, the parsing rules were constructed to be easily maintained and not for performance. Rewriting those rules to speed them up could have been possible, but rewriting the lexer entirely in Red/System would give the ultimate performance. It might not matter for most user scripts, but given that Red is also a data format, we need a solution for fast (near-instant) loading of huge quantities of Red values stored in files or transferred through the network.

The new lexer main features are:

- **High performance**, typically 50 to 200 times faster than the older one.
- New **scanning features**: identify values and their datatypes without loading them.
- **Instrumentation**: customize the lexer's behavior at will using an event-oriented API.

The reference documentation is available [there](https://github.com/red/docs/blob/master/en/lexer.adoc). This new lexer is available in Red's auto-builds since June.

## Performance

Vastly increased performance is the main driver for this new lexer. Here is a little benchmark to let you appreciate how far it gets.

The benchmarking tasks are:

- 100 x compiler.r: loads 100 times compiler.r [source file](https://github.com/red/red/blob/master/compiler.r) from memory (~126KB, so about ~12MB in total).
- 1M short integers: loads a string of 1 million \`1\` separated by a space.
- 1M long integers: loads a string of 1 million \`123456789\` separated by a space.
- 1M dates: loads a string of 1 million \`26/12/2019/10:18:25\` separated by a space.
- 1M characters: loads a string of 1 million \`#"A"\` separated by a space.
- 1M escaped characters: loads a string of 1 million \`#"^(1234)"\` separated by a space.
- 1M words: loads a string of 1 million \`random "abcdefghijk"\` separated by a space.
- 100K words: loads a string of 100 thousands \`random "abcdefghijk"\` separated by a space.

And the results are (on a Core i7-4790K):

```
    Loading Task             v0.6.4 (sec)    Current (sec)    Gain factor
    ---------------------------------------------------------------------
			
    100 x compiler.r	      41.871            0.463	           90
    1M short integers	      14.295            0.071	          201
    1M long integers	      18.105            0.159	          114
    1M dates	              29.319	        0.389	           75
    1M characters             14.865            0.092             162
    1M escaped characters     14.909	        0.120             124
    1M words	                 n/a	        1.216	          n/a
    100K words	              23.183	        0.070	          331
```

Notes: 

\- Only **transcode** is used in the loading tasks (system/lexer/transcode in 0.6.4).

\- The "1M words" task fails on 0.6.4 as the symbol table expansion time is exponential due to some hashtable bugs. That also explains the big gap for the "100K words" task. Those issues are fixed in the current version and the symbol table further optimized for speed. Though, the execution time increase between 100K and 1M words tests in new lexer is not linear which may be explained by a high number of collisions in the internal hashtable due to limited input variability.

\- The 0.6.4's lexer can only process strings as input, while the new lexer only processes internally only UTF-8 binary inputs. The input strings were converted to the lexer's native format in order to more accurately compare their speed. Providing a string instead of a binary series as input to the new lexer incurs on average a ~10% speed penalty.

## Scanning

It is now possible to only scan tokens instead of loading them. Basically, that means identifying a token's length and type without loading it (so without requiring extra memory and processing time). This is achieved by using the new **scan** native.

```
    >> scan "123"
    == integer!
    >> scan "w:"
    == set-word!
    >> scan "user@domain.com"
    == email!
    >> scan "123a"
    == error!
```

It is possible to achieve even higher scanning speed by giving up a bit on accuracy. That is the purpose of the **scan/fast** refinement. It trades maximum performance for type recognition accuracy. You can find the list of "guessed" types in the table [there](https://github.com/red/docs/blob/master/en/lexer.adoc#scan).

```
    >> scan/fast "123"
    == integer!
    >> scan/fast "a:"
    == word!
    >> scan/fast "a/b"
    == path!
```

Scanning applies to the first token in the input series. When an iterative application is needed in order to scan all tokens from a given input, the **/next** refinement can be used for that. It will return the input series past the current token allowing to get the precise token size in the input string. It can be used in combination with **/fast** if required. For example:

```
    src: "hello 123 world 456.789"
    until [
        probe first src: scan/next src
        empty? src: src/2
    ]
```

Outputs:

```
    word!
    integer!
    word!
    float!
```

## Matching by datatype in Parse

The new lexer enables also matching by datatype directly from Parse dialect. Though, this feature is limited to binary input only.

```
    >> parse to-binary "Hello 2020 World!" [word! integer! word!]
    == true
    >> parse to-binary "My IP is 192.168.0.1" [3 word! copy ip tuple!]
    == true
    >> ip
    == #{203139322E3136382E302E31}
    >> load ip
    == 192.168.0.1
```

Notice that the whitespaces in front of tokens are skipped automatically in this matching mode.

## Instrumentation

Lexers in Red and Rebol world used to be black boxes, this is no longer the case with Red's new lexer and its tracing capabilities. It is now possible to provide a callback function that will be called upon lexer events triggered while parsing tokens. It gives deeper control to users, for example allowing to:

- Trace the behavior of the lexer for debugging or statistical purposes.
- Catch errors and resume loading by skipping invalid data.
- On-the-fly input transformation (to remove/alter some non-loadable parts).
- Extend the lexer with new lexical forms.
- Process serialized Red data without having to fully load the input.
- Extract line comments that would be lost otherwise.

Lexer's tracing mode is activated by using the **/****trace** refinement on **transcode**. The syntax is:

```
    transcode/trace <input> <callback>

    <input>    : series to load (binary! string!).
    <callback> : a callback function to process lexer events (function!).
```

That function is called on specific events generated by the lexer: prescan, scan, load, open, close, error. The callback function and events specification can be found [there](https://github.com/red/docs/blob/master/en/lexer.adoc#transcodetrace). 

A default tracing callback is provided in **system/lexer/tracer**:

```
    >> transcode/trace "hello 123" :system/lexer/tracer
    
    prescan word 1x6 1 " 123"
    scan word 1x6 1 " 123"
    load word hello 1 " 123"
    prescan integer 7x10 1 ""
    scan integer 7x10 1 ""
    load integer 123 1 ""
    == [hello 123]
```

That tracing function will simply print the lexer event info. If a syntax error occurs, it will cancel it and resume on the next character after the error position.

Several more sophisticated examples can be found on our [red/code repository](https://github.com/red/code/tree/master/Scripts/lexer).

## Implementation notes

This new lexer has been specifically prototyped and designed for performance. It relies on a token-oriented pipelined approach consisting of 3 stages: prescanning, scanning and loading.

Prescanning is achieved using only a [tight loop](https://github.com/red/red/blob/master/runtime/lexer.reds#L2114) and a state machine ([FSM](https://en.wikipedia.org/wiki/Finite-state_machine)). The loop reads UTF-8 encoded input characters one byte at a time. Each byte is identified as part of a [lexical class](https://github.com/red/red/blob/master/runtime/lexer.reds#L172). The lexical class is then used to transition from one state to another in the [FSM](https://github.com/red/red/blob/master/docs/lexer/lexer-states.txt), using a big [transition table](https://github.com/red/red/blob/master/runtime/lexer-transitions.reds#L112). Once a terminal state ([state names](https://github.com/red/red/blob/master/runtime/lexer-transitions.reds#L4) with a \`T\_\` prefix) or input's end is reached, the loop exits, leading to the next stage. The result of the prescanning stage is to locate a token begin/end positions and give a pretty accurate guess about the token's datatype. It can also detect some syntax errors if the FSM cannot reach a proper datatype terminal state. This approach provides the fastest possible speed for tokens detection, but it cannot be fully accurate, nor can it validate deeply the token content for some complex types (e.g. dates). 

Adding more states would provide greater accuracy and cover more syntatic forms, but at the cost of growing the transition table a lot due to the need to duplicate many state. Currently the table weights 2440 bytes, which is already quite big to be kept entirely in the CPU data cache (usually 8, 16 or 32KB per core, the lexical table uses 1024 bytes and there two other minor tables used in the tight loop). The data cache also needs to handle the parsed input data and part of the native stack, so the available space is limited.

The tight loop code is also optimized for keeping [branch mispredictions](https://en.wikipedia.org/wiki/Branch_predictor) as low as possible. It currently only relies on two branchings. The loop code could be also further reduced by, for example, pre-multiplying the state values to avoid the multiplication when calculating the table entry offset. Though, we need to wait for a fully optimizing code generation backend before trying to extract more performance from that loop code, or we might be taking wrong directions.

Scanning stage happens when a token has been identified. It consists in eventually calling a scanner function to deep-check the token for errors and more accurately determine the datatype. Loading stage then follows (unless only scanning was requested by the user). It will eventually call a loader function that will construct the Red value out of the token. In case of any-block series, the scanners will actually do the series construction on reaching the ending delimiter (which requires [special handling](https://github.com/red/red/blob/master/runtime/lexer.reds#L2189) for paths), so no loader is needed there. Conversely, loaders can be invoked in validating mode only (not constructing the value), in order to avoid code duplication when complex code is required for decoding/validating the token (e.g. date!, time!, strings with UTF-8 decoding,...).

For the record, there was an [attempt](https://github.com/red/red/tree/fast-lexer-date) at creating specific FSM for date! and time! literal forms parsing, to reduce the amount of rules that need to be handled by pure code. The results were not conclusive, as the amount of code required for special case handling was still significant and the performance of the FSM parsing loop was below the current pure code version. This approach can be reexamined once we get the fully optimizing backend.

The FSM states, lexical classes and transitions are documented in [lexer-states.txt](https://github.com/red/red/blob/master/docs/lexer/lexer-states.txt) file. A simple syntax is used to describe the transitions and possible branching from one state to others. The FSM has three possible entry points: S\_START, S\_PATH and S\_M\_STRING. Parsing path items requires specific states even for common types. For curly-braced strings, it is necessary to exit the FSM on each occurrence of open/close curly braces in order to count the nested ones and accurately determine where it ends. In both those path and string cases, the FSM needs to be re-entered in a different state than S\_START.

In order to build the FSM transition table, there is a workflow that goes from that lexer-states.txt file to the final transition table data in binary. It basically looks like this:

```
    FSM graph -> Excel file -> CSV file -> binary table
```

The more detailed steps are:

1. Manually edit changes in the [lexer-states.txt](https://github.com/red/red/blob/master/docs/lexer/lexer-states.txt) file.
2. Port those changes into the [lexer.xlsx](https://github.com/red/red/blob/master/docs/lexer/lexer-FSM.xlsx) file by properly setting the transition values.
3. Save that Excel table in CSV format as [lexer.csv](https://github.com/red/red/blob/master/docs/lexer/lexer-FSM.csv).
4. Run the [generate-lexer-table.red](https://github.com/red/red/blob/master/utils/generate-lexer-table.red) script from Red repo root folder. The [lexer-transitions.reds](https://github.com/red/red/blob/master/runtime/lexer-transitions.reds) file is regenerated.

The lexer code relies on several other tables for specific types handling like path ending detection, floating point numbers syntax validation, binary series and escaped characters decoding. Those tables are either manually written (not planned to be ever changed) or generated using [this script](https://github.com/red/red/blob/fast-lexer-date/utils/generate-misc-tables.red).

Various other points worth mentioning:

\- The lexer works natively with UTF-8 encoded binary buffers as input. If a string! is provided as input, there is an overhead for converting internally such string to binary before passing it to the lexer. A unique internal buffer is used for those conversions with support for recursive calls.

\- The lexer uses a single accumulative cells buffer for storing loaded values, with an inlined any-block stack.

\- The lexer and lexer callbacks are fully recursive and GC-compliant. Currently callbacks can be function! only, this can be extended in the future to support routines also for much faster processing.

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [2:06 PM](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=1200491406113826949&from=pencil "Edit Post")

Labels: [callback](https://www.red-lang.org/search/label/callback), [implementation](https://www.red-lang.org/search/label/implementation), [lexer](https://www.red-lang.org/search/label/lexer), [load](https://www.red-lang.org/search/label/load)

[]()

#### 2 comments:

1. ![](//blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhh8oQHlfL1w_ZgnjjiYb3MFZOJoDGl0oarVE2q-C2FuECNG0IqrEmsbXMIVxIrrQhS3dWnUWN2BB40w14ryACyKa5OA2C_t4G4yWc85c0Zvs9V1MDEu--AXZNWprRkD90/s45-c/IMG_0765.JPG)
   
   [Francois Jouen (ldci)](https://www.blogger.com/profile/14330391597272626484)[August 4, 2020 at 11:50 AM](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html?showComment=1596534636109#c4662805724211030972)
   
   Very impressive. Congratulations :-)
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4662805724211030972)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//resources.blogblog.com/img/blank.gif)
   
   james\_Nak[August 4, 2020 at 11:32 PM](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html?showComment=1596576767920#c5866479818611415476)
   
   Congratulations Doc &amp; team.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/5866479818611415476)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=1200491406113826949&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2020/08/redsystem-new-features.html "Newer Post") [Older Post](https://www.red-lang.org/2020/03/gtk-fast-lexer-money-deep-testing-and.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/1200491406113826949/comments/default)

[Star](https://github.com/red/red)   [Follow @red\_lang](https://twitter.com/red_lang)

    

Follow [@red\_lang](https://twitter.com/red_lang) on Twitter or on [/r/redlang](https://www.reddit.com/r/redlang/) subreddit.

Chat with us in our [Gitter](https://gitter.im/red/red) room.

## Search This Blog

## Total Pageviews

[Loading...](http://github.com/red/red/commits/master.atom)

## Blog Archive

- [►](javascript:void%280%29)  [2025](https://www.red-lang.org/2025/) (2)
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2025/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2025/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2024](https://www.red-lang.org/2024/) (4)
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2024/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2024/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2024/02/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2023](https://www.red-lang.org/2023/) (3)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2023/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2023/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2023/06/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2022](https://www.red-lang.org/2022/) (2)
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2022/07/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2021](https://www.red-lang.org/2021/) (2)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2021/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2021/08/) (1)

<!--THE END-->

- [▼](javascript:void%280%29)  [2020](https://www.red-lang.org/2020/) (4)
  
  - [▼](javascript:void%280%29)  [August](https://www.red-lang.org/2020/08/) (2)
    
    - [Red/System: New Features](https://www.red-lang.org/2020/08/redsystem-new-features.html)
    - [A New Fast and Flexible Lexer](https://www.red-lang.org/2020/08/a-new-fast-and-flexible-lexer.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2020/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2020/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2019](https://www.red-lang.org/2019/) (10)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2019/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2019/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2019/10/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2019/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2019/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2019/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2019/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2019/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2018](https://www.red-lang.org/2018/) (20)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2018/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2018/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2018/10/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2018/09/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2018/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2018/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2018/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2018/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2018/01/) (5)

<!--THE END-->

- [►](javascript:void%280%29)  [2017](https://www.red-lang.org/2017/) (3)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2017/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2017/07/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2017/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2016/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2015](https://www.red-lang.org/2015/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2015/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2015/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2014](https://www.red-lang.org/2014/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2014/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2014/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2014/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2014/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2014/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2013](https://www.red-lang.org/2013/) (5)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2013/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2013/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2013/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2013/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2013/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2012](https://www.red-lang.org/2012/) (8)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2012/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2012/10/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2012/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2012/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2012/03/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2012/02/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2011](https://www.red-lang.org/2011/) (15)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2011/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2011/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2011/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2011/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2011/05/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2011/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2011/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2011/02/) (1)

## Tags cloud

[2D](https://www.red-lang.org/search/label/2D) (1) [alias](https://www.red-lang.org/search/label/alias) (1) [alpha](https://www.red-lang.org/search/label/alpha) (1) [Android](https://www.red-lang.org/search/label/Android) (3) [announce](https://www.red-lang.org/search/label/announce) (7) [apply](https://www.red-lang.org/search/label/apply) (1) [ARM](https://www.red-lang.org/search/label/ARM) (4) [armhf](https://www.red-lang.org/search/label/armhf) (1) [arrays](https://www.red-lang.org/search/label/arrays) (2) [AST](https://www.red-lang.org/search/label/AST) (1) [beta](https://www.red-lang.org/search/label/beta) (1) [binaries](https://www.red-lang.org/search/label/binaries) (1) [binary form](https://www.red-lang.org/search/label/binary%20form) (1) [bitset](https://www.red-lang.org/search/label/bitset) (1) [blog](https://www.red-lang.org/search/label/blog) (1) [booleans](https://www.red-lang.org/search/label/booleans) (1) [bridge](https://www.red-lang.org/search/label/bridge) (2) [bugfixes](https://www.red-lang.org/search/label/bugfixes) (4) [callback](https://www.red-lang.org/search/label/callback) (2) [casing](https://www.red-lang.org/search/label/casing) (1) [changelog](https://www.red-lang.org/search/label/changelog) (1) [China](https://www.red-lang.org/search/label/China) (2) [codecs](https://www.red-lang.org/search/label/codecs) (1) [collation](https://www.red-lang.org/search/label/collation) (1) [community](https://www.red-lang.org/search/label/community) (1) [compilation](https://www.red-lang.org/search/label/compilation) (6) [compiler](https://www.red-lang.org/search/label/compiler) (2) [conference](https://www.red-lang.org/search/label/conference) (2) [console](https://www.red-lang.org/search/label/console) (8) [context](https://www.red-lang.org/search/label/context) (2) [contribution](https://www.red-lang.org/search/label/contribution) (1) [CSDN](https://www.red-lang.org/search/label/CSDN) (1) [date](https://www.red-lang.org/search/label/date) (1) [Debian](https://www.red-lang.org/search/label/Debian) (1) [demos](https://www.red-lang.org/search/label/demos) (3) [development](https://www.red-lang.org/search/label/development) (1) [dialect](https://www.red-lang.org/search/label/dialect) (1) [dll](https://www.red-lang.org/search/label/dll) (1) [donations](https://www.red-lang.org/search/label/donations) (1) [download](https://www.red-lang.org/search/label/download) (1) [Draw](https://www.red-lang.org/search/label/Draw) (1) [DSL](https://www.red-lang.org/search/label/DSL) (1) [dynamic calls](https://www.red-lang.org/search/label/dynamic%20calls) (1) [ELF](https://www.red-lang.org/search/label/ELF) (1) [encap](https://www.red-lang.org/search/label/encap) (1) [enum](https://www.red-lang.org/search/label/enum) (1) [exceptions](https://www.red-lang.org/search/label/exceptions) (3) [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.) (1) [features](https://www.red-lang.org/search/label/features) (2) [floating point](https://www.red-lang.org/search/label/floating%20point) (3) [floats](https://www.red-lang.org/search/label/floats) (2) [FPU](https://www.red-lang.org/search/label/FPU) (4) [freebsd](https://www.red-lang.org/search/label/freebsd) (1) [functions](https://www.red-lang.org/search/label/functions) (1) [GC](https://www.red-lang.org/search/label/GC) (1) [gpio](https://www.red-lang.org/search/label/gpio) (1) [GTK+](https://www.red-lang.org/search/label/GTK%2B) (1) [GUI](https://www.red-lang.org/search/label/GUI) (9) [hash](https://www.red-lang.org/search/label/hash) (1) [HOF](https://www.red-lang.org/search/label/HOF) (1) [I/O](https://www.red-lang.org/search/label/I%2FO) (1) [IA-32](https://www.red-lang.org/search/label/IA-32) (2) [IEEE-754](https://www.red-lang.org/search/label/IEEE-754) (1) [implementation](https://www.red-lang.org/search/label/implementation) (2) [interpreter](https://www.red-lang.org/search/label/interpreter) (1) [iOS](https://www.red-lang.org/search/label/iOS) (1) [IW](https://www.red-lang.org/search/label/IW) (1) [java](https://www.red-lang.org/search/label/java) (2) [jni](https://www.red-lang.org/search/label/jni) (1) [lexer](https://www.red-lang.org/search/label/lexer) (2) [libc](https://www.red-lang.org/search/label/libc) (1) [libRed](https://www.red-lang.org/search/label/libRed) (2) [libRedRT](https://www.red-lang.org/search/label/libRedRT) (1) [linker](https://www.red-lang.org/search/label/linker) (1) [linux](https://www.red-lang.org/search/label/linux) (2) [literal arrays](https://www.red-lang.org/search/label/literal%20arrays) (2) [livecoding](https://www.red-lang.org/search/label/livecoding) (1) [load](https://www.red-lang.org/search/label/load) (2) [loader](https://www.red-lang.org/search/label/loader) (1) [macOS](https://www.red-lang.org/search/label/macOS) (1) [MacOSX](https://www.red-lang.org/search/label/MacOSX) (2) [macros](https://www.red-lang.org/search/label/macros) (2) [major](https://www.red-lang.org/search/label/major) (1) [map](https://www.red-lang.org/search/label/map) (2) [math](https://www.red-lang.org/search/label/math) (2) [meeting](https://www.red-lang.org/search/label/meeting) (1) [memory](https://www.red-lang.org/search/label/memory) (1) [migration](https://www.red-lang.org/search/label/migration) (1) [monitors](https://www.red-lang.org/search/label/monitors) (1) [namespaces](https://www.red-lang.org/search/label/namespaces) (1) [native](https://www.red-lang.org/search/label/native) (1) [navigation](https://www.red-lang.org/search/label/navigation) (1) [objective-c](https://www.red-lang.org/search/label/objective-c) (1) [objects](https://www.red-lang.org/search/label/objects) (3) [ownership](https://www.red-lang.org/search/label/ownership) (1) [pair](https://www.red-lang.org/search/label/pair) (1) [pairs](https://www.red-lang.org/search/label/pairs) (1) [parse](https://www.red-lang.org/search/label/parse) (5) [path notation](https://www.red-lang.org/search/label/path%20notation) (1) [paths](https://www.red-lang.org/search/label/paths) (1) [percent](https://www.red-lang.org/search/label/percent) (1) [pointers](https://www.red-lang.org/search/label/pointers) (2) [points](https://www.red-lang.org/search/label/points) (1) [port](https://www.red-lang.org/search/label/port) (2) [preprocessor](https://www.red-lang.org/search/label/preprocessor) (2) [presentation](https://www.red-lang.org/search/label/presentation) (2) [QEMU](https://www.red-lang.org/search/label/QEMU) (1) [questions](https://www.red-lang.org/search/label/questions) (1) [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi) (3) [react](https://www.red-lang.org/search/label/react) (1) [reactive](https://www.red-lang.org/search/label/reactive) (5) [Red](https://www.red-lang.org/search/label/Red) (2) [red/system](https://www.red-lang.org/search/label/red%2Fsystem) (4) [redbin](https://www.red-lang.org/search/label/redbin) (1) [release](https://www.red-lang.org/search/label/release) (13) [REPL](https://www.red-lang.org/search/label/REPL) (2) [routine](https://www.red-lang.org/search/label/routine) (1) [rules engine](https://www.red-lang.org/search/label/rules%20engine) (1) [runtime errors](https://www.red-lang.org/search/label/runtime%20errors) (3) [screen](https://www.red-lang.org/search/label/screen) (1) [sets](https://www.red-lang.org/search/label/sets) (1) [SFD](https://www.red-lang.org/search/label/SFD) (1) [shared libraries](https://www.red-lang.org/search/label/shared%20libraries) (2) [sorting](https://www.red-lang.org/search/label/sorting) (1) [sources](https://www.red-lang.org/search/label/sources) (1) [specs](https://www.red-lang.org/search/label/specs) (2) [stack](https://www.red-lang.org/search/label/stack) (1) [startups](https://www.red-lang.org/search/label/startups) (1) [stats](https://www.red-lang.org/search/label/stats) (1) [strings](https://www.red-lang.org/search/label/strings) (1) [subpixel](https://www.red-lang.org/search/label/subpixel) (1) [sum up](https://www.red-lang.org/search/label/sum%20up) (1) [SVG](https://www.red-lang.org/search/label/SVG) (1) [syntax](https://www.red-lang.org/search/label/syntax) (1) [tabbing](https://www.red-lang.org/search/label/tabbing) (1) [tests](https://www.red-lang.org/search/label/tests) (4) [time](https://www.red-lang.org/search/label/time) (1) [toolchain](https://www.red-lang.org/search/label/toolchain) (1) [tuple](https://www.red-lang.org/search/label/tuple) (1) [tutorial](https://www.red-lang.org/search/label/tutorial) (1) [type-checking](https://www.red-lang.org/search/label/type-checking) (1) [typeset](https://www.red-lang.org/search/label/typeset) (1) [Unicode](https://www.red-lang.org/search/label/Unicode) (4) [update](https://www.red-lang.org/search/label/update) (1) [user group](https://www.red-lang.org/search/label/user%20group) (1) [vector](https://www.red-lang.org/search/label/vector) (2) [VFP](https://www.red-lang.org/search/label/VFP) (2) [VID](https://www.red-lang.org/search/label/VID) (2) [View](https://www.red-lang.org/search/label/View) (3) [widgets](https://www.red-lang.org/search/label/widgets) (1) [x87](https://www.red-lang.org/search/label/x87) (1)

Copyright 2011-2020 Nenad Rakocevic &amp; Red Foundation. Powered by [Blogger](https://www.blogger.com).

[![Fork me on GitHub](https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67)](https://github.com/red/red)
