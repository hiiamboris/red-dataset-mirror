
#4832: cd sets system/options/path on error when O.S. denies permission
================================================================================
Issue is open, was reported by gltewalt and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/4832>

**Describe the bug**
`cd <directory>` results in `system/options/path` being set to the directory value when the O.S. denies permission.

**To reproduce**
```red
>> cd ../..
== %/
>> ls
	bin/               	dev/               	srv/               
	boot/              	lib64/             	mnt/               
	lib/               	swapfile           	media/             
	cdrom/             	home/              	proc/              
	run/               	sbin/              	sys/               
	var/               	tmp/               	root/              
	usr/               	lost+found/        	opt/               
	etc/               
>> cd lost+found
*** Access Error: cannot open: %/lost+found/
*** Where: set-current-dir
*** Stack: cd change-dir  

>> pwd
%/lost+found/
>> cd ..
== %/
>> cd root
*** Access Error: cannot open: %/root/
*** Where: set-current-dir
*** Stack: cd change-dir  

>> pwd
%/root/
```
Terminal output:
```
gt@lappy:/$ cd lost+found
bash: cd: lost+found: Permission denied
gt@lappy:/$ cd root
bash: cd: root: Permission denied
```

**Expected behavior**
`system/options/path` retains the value before the error

**Platform version**
```
Red 0.6.4 for Linux built 16-Feb-2021/1:41:34-07:00 commit #0187423
```



