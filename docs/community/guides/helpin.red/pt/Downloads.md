Original URL: <http://helpin.red/pt/Downloads.html>

# Downloads

* * *

* * *

\** Rededitor é um zip com executáveis (Notepad++ and Red), então  pode dar problemas com firewalls e anti-virus. O hash e tamanho são para o arquivo zip.

Eu certamente não coloco malware nos meus arquivos, mas quem sabe o que um hacker pode fazer, então eu adiciono o tamanho e o hash MD5 do help app e do Notepad++ zip. Eu sei que o MD5 não é o mais seguro, mas é pequeno, e com o tamanho do arquivo deve deixar você seguro que o arquivo que você está baixando é o mesmo que eu criei. Os arquivos pdf e word não precisam de hash para segurança, e não é possível colocar o hash no o arquivo do projeto Helpndoc, pois ele mudaria assim que eu o colocasse nesta página!

Para saber o hash MD5 e o tamanho do arquivo, use o script abaixo. Ele abre um seletor de arquivos gráfico, então é bem fácil de usar.

Red \[]

a: request-file

prin "Hash= " print checksum a 'MD5

prin "Tamanho= " print size? a

Você pode até digitar no console:

&gt;&gt; b: request-file                                        ; o seletor de arquivos gráfico abre aqui

== %/C/Users/André/Documents/mytestfile.txt  

&gt;&gt; print checksum b 'MD5

#{E054964EFB5ECAA5BF89164B988A62F7}

&gt;&gt; print size? b

2574
