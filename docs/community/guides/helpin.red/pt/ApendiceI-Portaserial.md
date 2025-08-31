Original URL: <http://helpin.red/pt/ApendiceI-Portaserial.html>

# Apêndice I - Porta serial

* * *

## Apêndice I - Enquanto esperamos pela porta serial...

## (capítulo temporário)

* * *

Aviso 1: Esta informação é principalmente para usuários do Windows;

Aviso 2: A comunicação serial pode ser complicada, com caracteres ocultos e detalhes de configuração. Se você não estiver familiarizado com o assunto, sugiro que você comece com um tutorial mais amigável.

O Red ainda não  suporta o acesso à porta serial (outubro de 2018). Isso pode ser decepcionante se você planeja usar o Red com Arduino, IoT, ESP8266 e hardware em geral. Assim, enquanto esperamos pelo suporte da porta serial, descrevo aqui alguns truques e dicas que achei úteis. Eles estão relacionados principalmente ao envio de comandos para o cmd do Windows usando  call , mas os usuários do Linux também podem encontrar informações interessantes aqui.

Como funciona em Rebol. Red deverá ser parecido:

[Veja a doucumentação do Rebol;](http://www.rebol.com/docs/changes-2-5.html#section-81)

Parece-me que em Rebol você tem que dizer qual é a sua porta COM, criar uma "coisa serial" (chamada "ser" no exemplo abaixo) e configurá-la. Então, para enviar mensagens para serial, você insert suas mensagens nessa "coisa", e para ler o que é recebido, você  copy , pick ou first  essa "coisa".

Rebol \[]

System/ports/serial: \[ com7 ]

ser: open/direct/no-wait serial://port1/9600/none/8/1

ser/rts-cts: false

view/title layout [

       f: field 200

       btn "TX" \[insert ser f/text update ser]

       t: area  

       rate 20 feel\[engage: \[append t/text copy ser show t]]

] "My Serial Test"

![](http://helpin.red/lib/NewItem206.png)

Neste exemplo, o que é enviado pelo dispositivo é mostrado na area e, quando você pressiona TX, o que quer que tenha escrito no field será enviado para o dispositivo.

Eu testei com um programa ESP8266 que envia um timestamp a cada segundo, mas também transmite de volta o que recebe. O programa também envia um ctrl-z (0x1A) a cada 10 mensagens. Caso você esteja interessado, aqui está o sketch do Arduino:

long interval = 1000;     //milliseconds between sending timestamps

long previousMillis = 0;

long count = 0;

void setup(){

 Serial.begin(9600);

}

void loop()

{ // this first part "echoes" whatever is sent

 // when characters arrive over the serial port...

 if (Serial.available()) {

   // ...wait a second and send them back.

   delay(1000);

   while (Serial.available() &gt; 0) {

   Serial.write(Serial.read());

   }

 }

 // this second part sends a timestamp every interval

 long currentMillis = millis();

 if(currentMillis - previousMillis &gt; interval) {

     if (count &gt; 10){

       count =  0;

       Serial.print("stop\\x1A"); // string "stop" &amp; ctrl-z

     }

   previousMillis = currentMillis;

   Serial.print("Timestamp= ");

   Serial.println(currentMillis);

   count = count +1;

 }

}

E agora, algumas dicas para usar o Red como está...

Uma função para obter as portas COM disponíveis::

Envia o commando mode para o cmd e faz o parsing (sem usar parse) do valor retornado:

Red \[]

funcGetComPorts:

; Usa o  cmd do Windows para obter as COM ports disponíveis

       has\[cmdOutput com-ports b c i] [                                          

       cmdOutput: ""        ;aqui fica a resposta do cmd, como texto  

       com-ports: \[]   ;esta série vai ter as COM ports

; agora mandamos o comando "mode" para o cmd

; guardamos a resposta do sistema em "cmdOutput"

       call/output "mode" cmdOutput

; retiramos todos os "-"

       trim/with cmdOutput "-"

; dividimos o cmdOutput em uma série        

       cmdOutput: split cmdOutput " "

; fazemos um pouco de edição para ter um bom formato

       foreach i cmdOutput [          

               b: copy/part i 3

               if b = "COM" [

                       c: copy/part i 4

                       append com-ports c

               ]

       ]

       return com-ports

]

probe funcGetComPorts

\["COM7" "COM3"]

Configurando uma porta serial:

O comando completo do cmd para configurar uma porta COM seria:

mode COM7 BAUD=9600 PARITY=n DATA=8

Então, essa seria uma função de configuração de porta COM:

Red \[]

SerialConfig: function \[COMport baud parity datasize][

       command: ""

       command: rejoin [command "mode " COMport " BAUD=" baud

" PARITY=" parity " DATA=" datasize]

       print command

       call/shell form command

]

SerialConfig "COM7" "9600" "n" "8"

Você pode verificar se funciona digitando  mode cmd antes e depois de executar o script acima. mode mostra a configuração atual de suas portas.

Using ComPrinter.exe and SerialSend.exe :

Esses pequenos programas (disponíveis para download [aqui](https://batchloaf.wordpress.com/)) podem ser acessados usando um comando  call dentro de um script Red para enviar e receber dados da porta serial. Eles são programas open source feitos por Ted Burke (obrigado!). Eles são ótimos programas que, com um pouco de criatividade, podem permitir fazer muitas coisas com Red!

Os exemplos dados aqui assumem que esses executáveis estão na mesma pasta que o script. Simplesmente copie e cole lá.

[ComPrinter](https://batchloaf.wordpress.com/comprinter/) *

\*procure pela versão atualizada que você encontra nos comentários da página do ComPrinter ([link de download direto](https://drive.google.com/file/d/0B3NaVR72FYQcMUJoZDJBUEI0Q2M/view?usp=sharing)).

Da página da Web: "O ComPrinter é um aplicativo de console (ou seja, um programa de linha de comando) que abre uma porta serial e exibe caracteres de texto recebidos no console. Ele apresenta várias opções muito úteis."

Opções de ComPrinter.exe:

/devnum  - Use para especificar uma porta COM. O padrão é a porta de número mais alto, incluindo portas&gt; = 10. Por exemplo, para definir COM7 use /devnum 7

/baudrate  - Use para especificar a taxa de transmissão. O padrão é 2400 bits por segundo. Por exemplo, para definir a taxa de transmissão para 9600, use /baudrate 9600

/keystrokes - Use para simular um pressionamento de tecla para cada caractere de entrada, por exemplo, para digitar texto em um aplicativo..

/debug - Use para exibir informações adicionais ao abrir a porta COM..

/quiet - Use  para suprimir o texto da mensagem de boas vindas e outras informações. Apenas texto recebido pela porta COM será exibido.

As seguintes opções estão disponíveis apenas na versão atualizada:

/charcount  - Para sair de um certo número de caracteres. Por exemplo, para sair após 6 caracteres, use /charcount 6

/timeout - Sair após um tempo limite - ou seja, nenhum dado recebido por um número especificado de milissegundos. Por exemplo, para sair após 2 segundos sem dados, use /timeout 2000

/endchar  - Sair quando um determinado personagem é recebido. Por exemplo, para sair quando a letra 'x' for recebida, use /endchar x

/endhex  - Sair quando um determinado byte hexadecimal for recebido. Por exemplo, para sair quando o valor hexadecimal 0xFF for recebido, use /endhex FF

Exemplo:

O exemplo abaixo envia o que recebe em COM7 em 9600 baud para o arquivo "input.txt" até que ele receba um ctrl-z. Cria o arquivo automaticamente ou faz append de um arquivo existente. O esboço do Arduino acima envia um ctrl-z só de vez em quando, então o arquivo que você vai gerar pode ser maior ou menor:

Red\[]

call/output form "ComPrinter.exe /devnum 7 /baudrate 9600 /endhex 1A" %"input.txt"

;        ComPrinter.exe        - o executável chamado

;        /devnum 7                - seleciona COM7

;        /baudrate 9600        - seleciona baud rate 9600

;        /endhex 1A                - pára o ComPrinter quando recebe um ctrl-z (0x1A)

;        %"input.txt"        - o arquivo de output (lembra do refinamento /output ?)

Conteúdo do arquivo input.txt após rodar o script:

![](http://helpin.red/lib/NewItem205.png)

Caso você queira que seu script Red faça outra coisa enquanto cmd lê a porta serial, você pode usar um redirecionamento cmd ("&gt;") para enviar a saída para um arquivo. Nesse caso, parece funcionar apenas com call/shell:

Red\[]

call/shell form "ComPrinter.exe /devnum 7 /baudrate 9600 /endhex 1A &gt; input.txt"

print "This is printed immediately, while the input.txt file is still being created"

Infelizmente, você não pode escrever na porta serial enquanto o cmd estiver recebendo dados. E, a propósito, o Windows leva alguns segundos para atualizar o arquivo, então se você abrir "input.txt" muito rapidamente, pode estar vazio. Claro, também pode estar vazio porque algo deu errado ...

[SerialSend](https://batchloaf.wordpress.com/serialsend/)

Da página web: "SerialSend é um pequeno aplicativo de linha de comando que criei para enviar strings de texto através de uma porta serial. Eu o uso principalmente para enviar informações para circuitos de microcontroladores através de um conversor USB para serial, então ele foi projetado para funcionar bem nesse contexto "

O seguinte comando envia os caracteres “abc 123” através da porta serial mais alta disponível na taxa de transmissão padrão (38400 baud).

SerialSend.exe "abc 123"

Opções par SerialSend.exe:

/devnum  - Use para especificar uma porta COM. O padrão é a porta com maior disponibilidade, incluindo portas&gt; = 10. Por exemplo, para definir COM7 use /devnum 7

/baudrate  - Use para especificar a taxa de transmissão. O padrão é 38400 bits por segundo. Por exemplo, para definir a taxa de transmissão para 9600, use /baudrate 9600

/hex  - Bytes arbitrários, incluindo caracteres não imprimíveis, podem ser incluídos na string como valores hexadecimais usando a opção de linha de comando “/ hex” e a seqüência de escape “\\ x” no texto especificado. Por exemplo, o comando a seguir envia a string “abc” seguida por um caractere de alimentação de linha (valor hexadecimal 0x0A) - ou seja, 4 bytes no total:  SerialSend.exe /hex "abc\\x0A"

Exemplo:

Red\[]

call form {SerialSend.exe /devnum 7 /baudrate 9600 "abc 123"}

Exemplo que envia variáveis ​​e funções:

Red\[]

myVariable: "Time now is: "        ; a string

txt: rejoin \[{"} myVariable now {"}] ; now returns time and date

command: form rejoin \["SerialSend.exe /devnum 7 /baudrate 115200 " txt]

print command        ;just to help you see what will be sent to cmd

call command

Note que eu aumentei o baudrate para 115200 neste segundo exemplo. Isso porque eu estava tendo problemas em 9600 baud: por algum motivo, a mensagem estava sendo truncada para cerca de uma dúzia de caracteres. Depois de muitas horas tentando isolar o bug (um null modem cable teria ajudado, mas não tenho um no momento), desisti e aumentei a velocidade, tanto no script Red quanto no sketch do Arduino. Isso não resolveu completamente, mas eu consigo enviar strings com mais de 200 caracteres, o que é bom o suficiente por enquanto.

Um utilitário semelhante ao SerialSend e ComPrinter, baseado no trabalho de Ted Burke, é o [comsniff](https://github.com/klarsys/comsniff) - Este utilitário não apenas imprime o que recebe no console do cmd, mas também envia o que você digita, conforme você digita, para a porta serial. Eu tive muitos problemas tentando usá-lo, mas é open source e vale a pena mencionar aqui.

Outras informações úteis (?) Caso você não queira usar executáveis ​​externos:

Enviando caracteres para uma porta COM: (não extensivamente testado)

Eu encontrei informações úteis sobre o envio de caracteres para a porta serial no Windows [aqui](https://batchloaf.wordpress.com/2013/02/12/simple-trick-for-sending-characters-to-a-serial-port-in-windows/). asicamente, você pode enviar dados para a porta serial usando:

- echo hello &gt; COM1

Mas este comando também envia um espaço extra, um CR e um LF. Além disso, não reconhece números de porta mais altos (acima de 9?). Você pode optar por enviar um comando mais universal como este:

- set /p x="hello" &lt;nul &gt;\\\\.\\COM22

Aqui está uma função que usa o primeiro comando:

Red \[]

SerialSender: function \[stringtosend COMport][

       command: \[]

       append command "e "

       append command stringtosend

       append command " &gt; "

       append command COMport

       call/shell form command

]

SerialSender "hello world" "COM7"

Você pode enviar arquivos inteiros para a porta serial usando copy yourfile.txt com1, ou, para portas de número &gt;= 10, copy yourfile.txt \\\\.\\COM21

(Supostamente deveria) redirecionar o input serial para um arquivo: (bem, testado mas...)

Estes comandos deveriam enviar os dados recebidos da porta serial para um arquivo:

- COPY COM4 data.txt
- type com1: &gt;&gt; data.txt

Eu tive resultados muito ruins com isso. O cmd do Windows parece começar a ler quando quer e isso pode levar dezenas de segundos, até minutos, ou nunca. De qualquer forma, se você for corajoso, não se esqueça de combinar a taxa de transmissão, a paridade e o tamanho dos dados primeiro!

A propósito, para fazer o cmd parar de gravar dados, o dispositivo tem que enviar um ctrl-z. Você consegue isso no Arduino usando Serial.write ("26") ou Serial.print("&lt;Stuff&gt;\\x1A") . Isso parece funcionar com  copy (quando copy funciona) mas não com type.

Terminais:

[Terminal - com port development tool](https://sites.google.com/site/terminalbpp/) - Muito bom e completo, mas tem que se acostumar um pouco.

[PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/)  pode ser configurado para funcionar como um terminal serial. Permite salvar a sessão em um arquivo de log.

Para ser honesto, eu uso quase sempre o Serial Monitor da IDE do Arduino.
