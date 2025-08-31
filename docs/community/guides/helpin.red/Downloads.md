Original URL: <http://helpin.red/Downloads.html>

# Downloads

* * *

* * *

\* Help app (Chm)  may raise issues with firewalls and anti-virus softwares!  Also, to make it work, you must right-click on the downloaded file, chose properties and check "unblock".

\**  It's a pain to change the hash every time I want to update Helpin'Red website, and there are virtually no downloads of this, so I'll update the .chm file, but I won't update the hash anymore. if you want a safe download, contact me at gitter.

\*\** Rededitor and Makeshift IDE are zip files that contains executables (Notepad++ and Red), so it may also raise issues with firewalls and anti-virus. The hash and size are for the zip archive.

I certainly don't add malware to my files, but who knows what hackers might do, so, just to be sure, I add the size and the MD5 hash of Rededitor. I know MD5 is not the safest hash, but it is small, and along with the size of the file should make you sure enough that the file you're downloading is the same files I created. Hash is not needed for PDF or Word, and I can't add a hash for the HelpNDoc project as it would change the moment I write it down in this page.

To find the size and the MD5 hash of a file, run the Red script below. It opens a GUI file selector, so it is pretty easy to use.

Red \[]

a: request-file

prin "Hash= " print checksum a 'MD5

prin "Size= " print size? a

You may even type it at the console:

&gt;&gt; b: request-file                                        ; the GUI file selector opens here

== %/C/Users/André/Documents/mytestfile.txt  

&gt;&gt; print checksum b 'MD5

#{E054964EFB5ECAA5BF89164B988A62F7}

&gt;&gt; print size? b

2574

[&lt; Previous topic](http://helpin.red/Homepage.html)                                                                                          [Next topic &gt;](http://helpin.red/Introduction.html)
