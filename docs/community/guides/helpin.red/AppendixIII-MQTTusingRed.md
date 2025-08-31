Original URL: <http://helpin.red/AppendixIII-MQTTusingRed.html>

# Appendix III -MQTT using Red

* * *

* * *

MQTT has become the popular protocol for IoT (Internet of Things) communication. On the Internet Protocol Stack, it works on the same layer as HTTP, but MQTT is lighter, uses less bandwidth, and allows keeping a steady line to devices and near real time communication.

Unlike CGI or serial port support, MQTT is not a priority in Red's development, and it will depend on the community to create native libraries. However, it's possible to publish and subscribe to topics (as client) using Red and some external executables and DLLs.

I'll not go in details about MQTT, I assume you know the basics of it. In case you don't, the best information I found is in the [Hivemq tutorials](https://www.hivemq.com/mqtt-essentials/).

To monitor MQTT messages, you can use any of the tools listed [here](https://www.hivemq.com/mqtt-toolbox). I use MQTT-spy, but any client utility will do, including some Android apps that you can install on your phone (search Google-Play).

I used a free "Cute cat" account on [CloudMQTT](https://www.cloudmqtt.com/plans.html) MQTT broker for my tests.

What you need:

You must have in your script's folder:

- mosquitto\_pub.exe
- mosquitto\_sub.exe
- mosquitto.dll
- libssl-1\_1.dll
- libcrypto-1\_1.dll

I obtained mosquitto\_pub.exe, mosquitto\_sub.exe and mosquitto.dll by installing mosquitto downloaded from [here](https://mosquitto.org/download/). I used the 32bit install. These files are in the "mosquitto" folder created by installation.

During installation, you get the following warning:

![](http://helpin.red/lib/NewItem260.png)

The libssl-1\_1.dll and libcrypto-1\_1.dll are files of the [OpenSSL toolkit](https://www.openssl.org/). So, as recommended, I downloaded OpenSSL from [http://slproweb.com/products/Win32OpenSSL.html](http://slproweb.com/products/Win32OpenSSL.html) and installed it. During installation, make sure you choose to install the DLLs to OpeSSL folder, it will make them a lot easier to find:

![](http://helpin.red/lib/NewItem263.png)

Then I copied and pasted libssl-1\_1.dll and libcrypto-1\_1.dll not only to mosquitto directory, but also to my script's folder.

To understand the use of mosquitto\_pub.exe check [this page](https://mosquitto.org/man/mosquitto_pub-1.html), and for  mosquitto\_sub.exe there is [this page](https://mosquitto.org/man/mosquitto_sub-1.html). A good page with examples is [Using The Mosquitto\_pub and Mosquitto\_sub MQTT Client Tools- Examples](http://www.steves-internet-guide.com/mosquitto_pub-sub-clients/), and its respective [video](https://youtu.be/J4pqv9__uzE).

Publishing:

The following script is a crude MQTT publisher. It doesn't offer many options, but it's enough to show how to create a mosqutto\_pub command line:

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

![](http://helpin.red/lib/NewItem266.png)

You can use print instead of call in the script above to see the full command passed to mosquitto\_pub.exe.

Subscribing:

Subscribing using mosquitto\_sub.exe is a little less straightforward, because it outputs the published messages on cmd's CLI console. I haven't figured out how to constantly feed this to a Red script. My solution so far is to redirect the output of mosquitto\_sub.exe to a text file and pool it constantly to detect any file size changes. If it changes, the Red script reads it to get the new messages.

This script subscribes the topic and redirects the outputs to mqttlog.txt using cmd redirection command "&gt;":

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

![](http://helpin.red/lib/NewItem267.png)

And this script constantly checks mqttlog.txt for updates and puts them on an area:

Red \[needs: view]

oldsize: 0

view [

   mqttlog: area rate 2 ;checks txt file twice per second

   on-time [

       newsize: size? %"mqttlog.txt"

       if newsize &lt;&gt; oldsize [

           mqttlog/text: read %"mqttlog.txt"

           oldsize: newsize

       ]

   ]

]

![](http://helpin.red/lib/NewItem268.png)

[&lt; Previous topic](http://helpin.red/CGIusingRed.html)
