
#2317: TR/Crypt.XPACK.Gen2
================================================================================
Issue is closed, was reported by retsyo and has 2 comment(s).
[status.resolved] [type.AV]
<https://github.com/red/red/issues/2317>

for red-latest.exe or red-13nov16-a20194e.exe, avira free antivirus says "TR/Crypt.XPACK.Gen2", as a result

1. red*.exe can't run
2. some compiled exe are reported with "TR/Crypt.XPACK.Gen2" too

[https://github.com/ldci/redCV/issues/3](https://github.com/ldci/redCV/issues/3)


Comments:
--------------------------------------------------------------------------------

On 2016-11-13T12:52:53Z, dockimbel, commented:
<https://github.com/red/red/issues/2317#issuecomment-260184508>

    Avira is part of a few AV that have too aggressive heuristics for detecting unknown threats, as shown by [VirusTotal scan](https://virustotal.com/en/file/9d05a7cb001538c2d5bbe83bb822b91476524a78f5a91ae75088d4631cd2ef6a/analysis/1479040467/).
    
    I have submitted a new false positive report to Avira support, but they don't seem to be very efficient at fixing the issue as shown by my [previous reports](http://imgur.com/a/J8FRD) over the years.
    
    In the meantime, you should [white-list](https://www.avira.com/en/support-for-home-knowledgebase-detail/kbid/1561) Red executables and compiled files in Avira, or switch to a less aggressive AV.

