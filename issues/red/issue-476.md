
#476: PE - oh/initdata-size has not correct value
================================================================================
Issue is closed, was reported by Oldes and has 8 comment(s).
[status.built] [status.tested] [Red/System]
<https://github.com/red/red/issues/476>

oh/initdata-size currently contains only data section size, it should count all initialized sections (data and import now, rsrc and other later).

Also now it just holds virtual-size of data section, but it looks it should sum raw-data-sizes (the padded one).



Comments:
--------------------------------------------------------------------------------

On 2013-05-18T16:52:12Z, dockimbel, commented:
<https://github.com/red/red/issues/476#issuecomment-18104289>

    Do you have links to online resources that confirm that interpretation? The official PE/COFF spec is not clear about that and [this](http://msdn.microsoft.com/en-us/library/ms809762.aspx) other MS resource is not better:
    
    ```
    DWORD SizeOfInitializedData
    This is supposedly the total size of all the sections that are composed of initialized data
    (not including code segments.) However, it doesn't seem to be consistent with what appears
    in the file.
    ```

--------------------------------------------------------------------------------

On 2013-05-19T08:33:49Z, Oldes, commented:
<https://github.com/red/red/issues/476#issuecomment-18114277>

    In this document http://msdn.microsoft.com/en-us/library/windows/hardware/gg463119.aspx is:
    
    ```
    SizeOfInitializedData
    The size of the initialized data section, or the sum of all such sections if there are multiple data sections.
    ```
    
    Also I was reverse engineering some exe files and at least with these I checked the size was counting also sections. But it's clear that windows probably don't use this value as it's not causing visual problems yet. Or we were just lucky so far as current exe files don't use other data sections yet:-)

--------------------------------------------------------------------------------

On 2013-05-19T08:50:27Z, Oldes, commented:
<https://github.com/red/red/issues/476#issuecomment-18114484>

    After reading a little bit of your page, it's quite clear that it should contain size of all sections with initialized `Characteristics` (s-flags/initialized)
    
    ```
    0x00000040 This section contains initialized data. Almost all sections except executable and the .bss section have this flag set.
    ```
    
    The same for `uninitialized` sections.

--------------------------------------------------------------------------------

On 2013-05-19T09:16:22Z, Oldes, commented:
<https://github.com/red/red/issues/476#issuecomment-18114735>

    Btw.. BSS should be uninitialized section. At this moment it has initialized flag:
    https://github.com/dockimbel/Red/blob/master/red-system/formats/PE.r#L114

