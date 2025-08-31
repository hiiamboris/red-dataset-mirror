
#5494: False Positive!
================================================================================
Issue is closed, was reported by Sahil12524 and has 2 comment(s).
[status.duplicate] [type.AV]
<https://github.com/red/red/issues/5494>

Got a false positive on antivirus.
![image](https://github.com/red/red/assets/42999635/6145c797-9f34-4470-958c-2582c26857b9)



Comments:
--------------------------------------------------------------------------------

On 2024-03-08T16:50:32Z, dockimbel, commented:
<https://github.com/red/red/issues/5494#issuecomment-1986047216>

    See our [wiki page](https://github.com/red/red/wiki/%5BNOTE%5D-Anti-virus-false-positives) about false positives.
    
    Using VirusTotal, McAfee says [it's fine](https://www.virustotal.com/gui/file/7c421a0ffa4cb0e5e5c2606c06351b23034770c7f091e225e4ef773053f1e8c5?nocache=1), so the false positive you get is probably flagged because that executable "is not widely used or downloaded". That's how low AV companies are ready to go to "protect" their users...
    
    I suggested using a more reliable AV software that does not rely on harmful heuristics. Avoid totally the ones claiming to use AI for detection as they are the ones with highest false positives.

