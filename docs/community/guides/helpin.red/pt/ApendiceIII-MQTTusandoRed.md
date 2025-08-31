Original URL: <http://helpin.red/pt/ApendiceIII-MQTTusandoRed.html>

# Apêndice III -MQTT usando Red

* * *

* * *

O MQTT se tornou protocolo mais popular para comunicação de IoT (Internet of Things). No  Internet Protocol Stack, ela funciona na mesma camada que o HTTP, mas o MQTT é mais leve, usa menos banda e permite manter uma conexão fixa com dispositivos e comunicação quase em tempo real.

Ao contrário do suporte para porta serial ou CGI, o MQTT não é uma prioridade no desenvolvimento do Red, e dependerá da comunidade para criar bibliotecas nativas. No entanto, é possível publicar e subscrever tópicos (como cliente) usando Red e alguns executáveis ​​e DLLs externos.

Não vou entrar em detalhes sobre o MQTT, presumo que você saiba o básico disso. Caso você não saiba , a melhor informação que encontrei está nos tutoriais [tutoriais do Hivemq](https://www.hivemq.com/mqtt-essentials/) .

Para monitorar mensagens MQTT, você pode usar qualquer uma das ferramentas listadas [aqui](https://www.hivemq.com/mqtt-toolbox) . Eu uso o MQTT-spy, mas qualquer utilitário do cliente serve, incluindo alguns aplicativos Android que você pode instalar no seu telefone (pesquise o Google-Play).

Eu usei uma conta gratuita "Cute cat" no [CloudMQTT](https://www.cloudmqtt.com/plans.html) para meus testes.

O que você precisa:

Você precisa ter os seguintes arquivos dentro da pasta do seu script::

- mosquitto\_pub.exe
- mosquitto\_sub.exe
- mosquitto.dll
- libssl-1\_1.dll
- libcrypto-1\_1.dll

Eu obtive mosquitto\_pub.exe, mosquitto\_sub.exe e mosquitto.dll instalando o mosquitto obtido [aqui](https://mosquitto.org/download/). Eu usei a instalação 32 bits. Esses arquivos estão na pasta "mosquitto" criada na instalação.

Durante a instalação, você recebe o seguinte aviso:

![](http://helpin.red/lib/NewItem228.png)

Os arquivos libssl-1\_1.dll e libcrypto-1\_1.dll pertencem ao  [OpenSSL toolkit](https://www.openssl.org/). Assim, conforme recomendado, eu baixei o OpenSSL de [http://slproweb.com/products/Win32OpenSSL.html](http://slproweb.com/products/Win32OpenSSL.html) e instalei. Durante a instalação, você deve optar por colocar as DLLs na pasta do OpeSSL, vai ser mais fácil encontrá-las depois:

![](http://helpin.red/lib/NewItem227.png)

Então copiei libssl-1\_1.dll e libcrypto-1\_1.dll não apenas para o diretório do mosquitto, mas também para a pasta do meu script.

Para entender o uso do mosquitto\_pub.exe olhe [esta página](https://mosquitto.org/man/mosquitto_pub-1.html), e para o  mosquitto\_sub.exe existe [esta outra página](https://mosquitto.org/man/mosquitto_sub-1.html). Uma boa página com exemplos é [Using The Mosquitto\_pub and Mosquitto\_sub MQTT Client Tools- Examples](http://www.steves-internet-guide.com/mosquitto_pub-sub-clients/), e o respectivo [video](https://youtu.be/J4pqv9__uzE).

Publicando:

O script a seguir é um simples "publicador" de MQTT. Não oferece muitas opções, mas é suficiente mostrar como criar uma linha de comando para o mosqutto\_pub :

Red \[needs view]

view [

   text "broker:" 50 right broker: field "m12.cloudmqtt.com" 150

   text "port:" 30 right port: field "13308" 50

   text "user:" 30 right user: field "qenkXXX"

   text "password:" 60 right password: field "CRfa8kuXXX" 120

   return

   text "topic:" 50 right topic: field 200 "/test"

   text "message" 60 right message: field 300 "Hello World!"

   return

   button "Publish" [

       call rejoin ["mosquitto\_pub.exe -h " broker/text " -p " port/text " -u " user/text

       " -P " password/text { -t "} topic/text {"} { -m "} message/text {"}

       ]

   ]

]

![](http://helpin.red/lib/NewItem226.png)

Você pode usar print no lugar de call no script acima para ver o comando completo enviado para mosquitto\_pub.exe.

Subscrevendo:

Subscrever usando o mosquitto\_sub.exe é um pouco mais complexo, porque as mensagens recebidas são escritas no console CLI do cmd. Eu não descobri como repassar isso constantemente para um script de Red. Minha solução até agora é redirecionar a saída do mosquitto\_sub.exe para um arquivo de texto e verificar constantemente para detectar qualquer alteração no tamanho do arquivo. Se ele mudar, o script o lê para obter as novas mensagens.

Este script subscreve o tópico e redireciona as saídas para mqttlog.txt usando o comando de redirecionamento do cmd "&gt;":

Red \[needs view]

view [

   text "broker:" 50 right broker: field "m12.cloudmqtt.com" 150

   text "port:" 30 right port: field "13308" 50

   text "user:" 30 right user: field "qenkXXXX"

   text "password:" 60 right password: field "CRfa8kuXXXX" 120

   return

   text "topic:" 50 right topic: field 200 "/test"

   return

   button "Subscribe" [

       call/shell rejoin ["mosquitto\_sub.exe -h " broker/text " -p " port/text " -u " user/text

       " -P " password/text { -t "} topic/text {" &gt; mqttlog.txt}

       ]

   ]

]

![](http://helpin.red/lib/NewItem225.png)

E este script constantemente verifica se houve alteração no tamanho de mqttlog.txt e, se houver, copia o texto do arquivo para uma area:

Red \[needs: view]

oldsize: 0

view [

   mqttlog: area rate 2 ;verifica o arquivo texto duas vezes por segundo

   on-time [

       newsize: size? %"mqttlog.txt"

       if newsize &lt;&gt; oldsize [

           mqttlog/text: read %"mqttlog.txt"

           oldsize: newsize

       ]

   ]

]

![](http://helpin.red/lib/NewItem224.png)
