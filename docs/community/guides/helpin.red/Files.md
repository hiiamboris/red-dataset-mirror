Original URL: <http://helpin.red/Files.html>

# Files

* * *

* * *

### Path, directories and files

### Path names

File paths are written with a percent sign (%) followed by a sequence of directory names that are each separated by a forward slash (/). In Windows, Red makes all the conversions from backslashes to forward slashes, you don't have to worry.

Just remembering:

- / is the root of the current drive;
- ./ is the current directory;
- ../ is the parent of the current directory;
- file paths that do not begin with a forward slash (/) are relative paths;
- to refer to Window's often used "C" drive you should use: %/C/docs/file.txt
- absolute paths should be avoided to ensure machine-independent scripts;

##### A graphic file selector:

function! request-file  [Red-by-example](http://www.red-by-example.org/#request-file)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-request-file-request-dir-request-font-pop-up-system-dialog-boxes.)

request-file opens a graphic file selector and returns the full file path as a file!

&gt;&gt; request-file

![](http://helpin.red/lib/requestfile.png)

== %/C/Users/André/Documents/RED/myFirstFile.txt

Refinements

/title - window title. Example: request-file/title "My file is:"  
/file - Default file name or directory. Example: request-file/file %"MyFile.txt"  
/filter -Supply a block of filters consisting of pairs of filter names, and the actual filters. Example: request-file/filter \["executables" "\*.exe" "text files" "\*.txt"]  
/save - File save mode. Example with filters: request-file/save/filter \["executables" "\*.exe" "text files" "\*.txt"]  
/multi - Allows multiple file selection, returned as a block.

##### A graphic directory selector:

function! request-dir  [Red-by-example](http://www.red-by-example.org/#request-dir)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-request-file-request-dir-request-font-pop-up-system-dialog-boxes.)

request-dir opens a graphic directory selector and returns the full file path as a file!

![](http://helpin.red/lib/requestdir.png)

== %/C/Users/André/Documents/RED/

Refinements

    /title       =&gt; Window title.

    /dir         =&gt; Set starting directory.

    /filter      =&gt; TBD: Block of filters (filter-name filter).

    /keep        =&gt; Keep previous directory path.

    /multi       =&gt; TBD: Allows multiple file selection, returned as a block.

##### Deleting a file:

action! delete  [Red-by-example](http://www.red-by-example.org/#delete)    [MyCode4fun](http://www.mycode4fun.co.uk/red-beginners-reference-guide#TOC-Here-we-use:-save-load-write-read-delete-)

Deletes a file and returns true if successful, false otherwise.

&gt;&gt; delete %file.txt  
\== true

##### Getting the size of a file:

native! size?  [Red-by-example](http://www.red-by-example.org/#sizexqm)

Returns the number of bytes a file has, or none if file does not exist.

&gt;&gt; size? %myFirstFile.txt  
\== 37

#### Other directory and path functions:

cd or change-dir - Changes the current directory.

dir, ls or list-dir - Lists the contents of a given directory. If no argument is given, lists the current directory.

dir? - Returns true if the supplied name is a valid file path!,  
otherwise returns false.

dirize - Turns its argument into a valid directory.  
The argument can be of file! string! url!.  
Effectively dirize only appends a trailing / if needed.

exists? - Returns true if its argument is an existing path!  
or false otherwise.

file? - Returns true if its argument is a file!.

get-current-dir - Returns the current directory the program is using.

get-path? - Returns true if its argument is a get-path!

path? - Returns true if its argument is a path!

split-path - Splits a file! or url! path. Returns a block containing path and  
target.

suffix? - Returns the sufix of a file. e.g: exe, txt

what-dir - Returns the current directory path as a file! value.

to-red-file - Converts a local file system path to Red's  
standard machine independent path format.

to-local-file - Converts standard, system independent Red  
file paths to the file format used by the local operating system.

clean-path - Cleans-up '.' and '..' in a path  
and returns the cleaned path.

red-complete-file

red-complete-path

set-current-dir

[&lt; Previous topic](http://helpin.red/Errorhandling.html)                                                                                          [Next topic &gt;](http://helpin.red/Writingtofiles.html)
