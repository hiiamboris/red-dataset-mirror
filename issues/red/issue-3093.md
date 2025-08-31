
#3093: Error with float!
================================================================================
Issue is closed, was reported by ldci and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/3093>

Error found in float calculation!
example a: 1.955928285978498e-9 b: 6.472296969134931e-8 et a * b: 0.0
b should be different from zero
Red 0.6.3


Comments:
--------------------------------------------------------------------------------

On 2017-11-01T11:52:15Z, dockimbel, commented:
<https://github.com/red/red/issues/3093#issuecomment-341085791>

    The printed result is rounded to the closest integer value by default if it is less than an internal epsilon value. There is an option to disable that "pretty printing" for floats, so you'll get a more accurate output:
    
    ```
    >> system/options/float/pretty?: no
    == false
    >> a * b
    == 1.265934871718391e-16
    ```

--------------------------------------------------------------------------------

On 2017-11-01T14:45:34Z, ldci, commented:
<https://github.com/red/red/issues/3093#issuecomment-341127182>

    Thanks Nénad:)
    
    It’s OK with this option
    
    
    [cid:C2E6B378-F1C8-4A0F-8266-717EF6A7DB73]
    François Jouen
    Université de Recherche Paris Sciences et Lettres (PSL)
    Ecole Pratique des Hautes Etudes
    GRET Modélisation Epigénétique et Développement (MEDé)
    Laboratoire Cognitions Humaine et Artificielle (CHArt) EA 4004 FED 4246
    Les Patios Saint Jacques
    4-14 rue Ferrus, 75014 Paris
    01 53 63 61 69
    06 87 13 76 81
    francois.jouen@ephe.sorbonne.fr<mailto:francois.jouen@ephe.sorbonne.fr>
    http://www.cognition-usages.org/chart/
    http://marcbui.wixsite.com/mede
    
    
    
    Le 1 nov. 2017 à 12:52, Nenad Rakocevic <notifications@github.com<mailto:notifications@github.com>> a écrit :
    
    
    The printed result is rounded to the closest integer value by default if it is less than an internal epsilon value. There is an option to disable that "pretty printing" for floats, so you'll get a more accurate output:
    
    >> system/options/float/pretty?: no
    == false
    >> a * b
    == 1.265934871718391e-16
    
    
    —
    You are receiving this because you authored the thread.
    Reply to this email directly, view it on GitHub<https://github.com/red/red/issues/3093#issuecomment-341085791>, or mute the thread<https://github.com/notifications/unsubscribe-auth/AC6NodPUgEg-n4BqLApEA_S-tMSQ8LTTks5syFt1gaJpZM4QOFTO>.
    

