
#4477: [Red/System]: call a import function with 13 params and a `struct value` return type will crash
================================================================================
Issue is open, was reported by bitbegin and has 2 comment(s).
[type.bug] [status.reviewed] [Red/System]
<https://github.com/red/red/issues/4477>


**Describe the bug**

consider we have a so file, and the export api is like this:

```
MyStruct test1 (
	int x1,
	int x2,
	int x3,
	int x4,
	int x5,
	int x6,
	int x7,
	int x8,
	int x9,
	int x10,
	int x11,
	int x12,
	int x13
) ;
```
when we call it from Red/System, it will crash.

**To reproduce**
### test1.c
```
typedef struct {
	int seq;
} MyStruct;

MyStruct test1 (
	int x1,
	int x2,
	int x3,
	int x4,
	int x5,
	int x6,
	int x7,
	int x8,
	int x9,
	int x10,
	int x11,
	int x12,
	int x13
) {
	MyStruct v = {56};
	return v;
}

```

then create so file:

```
gcc -shared -m32 test1.c -o libtest1.so
```

then build:

```
Red/System []

MyStruct: alias struct! [
	seq		[integer!]
]

#import [
	"libtest1.so" cdecl [
		test1: "test1" [
			x1		[integer!]
			x2		[integer!]
			x3		[integer!]
			x4		[integer!]
			x5		[integer!]
			x6		[integer!]
			x7		[integer!]
			x8		[integer!]
			x9		[integer!]
			x10		[integer!]
			x11		[integer!]
			x12		[integer!]
			x13		[integer!]
			return: [MyStruct value]
		]
	]
]


a: declare MyStruct

a: test1 1 2 3 4 5 6 7 8 9 10 11 12 13
print-line a/seq

```
will crash.

**Expected behavior**
no crash


**Platform version (please complete the following information)**
```
Red 0.6.4 for Linux built 28-May-2020/15:24:10+08:00 commit #a3afc9e
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-10T08:31:45Z, bitbegin, commented:
<https://github.com/red/red/issues/4477#issuecomment-724547682>

    ```
    typedef struct {
    	int seq;
    } MyStruct;
    
    MyStruct test1 () {
    	MyStruct v = {56};
    	return v;
    }
    ```
    
    ```
    Red/System []
    
    MyStruct: alias struct! [
    	seq		[integer!]
    ]
    
    #import [
    	"libtest1.so" cdecl [
    		test1: "test1" [
    			return: [MyStruct]
    		]
    	]
    ]
    
    a: declare MyStruct
    
    a: test1
    print-line a
    ```

