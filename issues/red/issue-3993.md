
#3993: Float numbers loading is not identical across platforms
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/3993>

On Windows:
```
>> to-binary 2.022794416824729e-308
== #{000E8BA2E8BA2E8C}
>> to-binary 2.022794416824728e-308
== #{000E8BA2E8BA2E8A}
>> 
```
On non-Windows:
```
>> to-binary 2.022794416824729e-308
== #{000E8BA2E8BA2E8D}
>> to-binary 2.022794416824728e-308
== #{000E8BA2E8BA2E8B}
```
This results in accuracy issues leading to failing unit tests like in #2184.


