# Archived messages from: [gitter.im/red/Russian](/gitter.im/red/Russian/) from year: 2021

## Wednesday 6th January, 2021

Sergey\_Vladivostok\_gitlab

[09:03](#msg5ff57cea9632f63d87fd2b70)Здравствуйте. Подскажите пожалуйста где есть рускоязычные ресурсы/книги по Red/Rebol (второй)? Так же как найти/приобрести лицензию на Rebol/Pro, SDK, Command? Тут http://www.rebol.com/cgi-bin/feedback/post2.r писал, но ответа не получил. Гугль тоже не принёс результата... С английским плохо, а переводчик достаточно сильно порой (часто :( )коверкает смысл, поэтому ищу информацию на русском. Rebol нужен из-за того, что в Red отсутствует поддержка работы с COM портом, а Pro/SDK/Command чтобы работать с HTTPS (SSL3), а то "load https://gitter.im/red/Russian" выдаёт (\** Command Error: SSL Error: error:14077410:SSL routines:SSL23\_GET\_SERVER\_HELLO:sslv3 alert handshake failure)

DVL333

[12:26](#msg5ff5ac9014cec811ec7fce69)Привет!  
Русскоязычных ресурсов/книг, насколько мне известно, нет. Я, когда только начинал свое знакомство с Red, написал статью с коротким пособием: https://habr.com/ru/post/351100/  
Что касается работы с https, то не совсем понятно, что вы ожидаете от выполнения команды "load https://gitter.im/red/Russian". Наверное, для ваших целей следует использовать функцию read:

```
read https://gitter.im/red/Russian
```

Sergey\_Vladivostok\_gitlab

[12:33](#msg5ff5ae1403529b296bd28ffe)Хочу код страницы получить, а получаю ошибку SSL...

[12:33](#msg5ff5ae2303529b296bd29019)

```
>> read https://gitter.im/red/Russian
connecting to: gitter.im
** Command Error: SSL Error:  error:14077410:SSL routines:SSL23_GET_SERVER_HELLO:sslv3 alert handshake failure
** Where: build-port
** Near: system/words/set-modes port/sub-port [secure: true]
```

[12:34](#msg5ff5ae59787d8f79c8e5608d)&gt;&gt;https://habr.com/ru/post/351100/  
Доступ к публикации закрыт  
Вы пытаетесь открыть публикацию, написанную пользователем DVL333, однако, публикация скрыта в черновики (самим автором или НЛО)

DVL333

[16:45](#msg5ff5e921d5f4bf2965cd4fec)Насчет ошибки SSL ничего подсказать не смогу - в консоли Red у меня все работает нормально.

```
>> read https://gitter.im/red/Russian
== {<!doctype html>^/<html class="no-js " lang="en">^/  <head>^/    <meta http-equiv="X-UA-Compatibl...
```

Насчет статьи вы правы - на Хабре я ее вижу, т.к. являюсь ее автором. ) Но эта статья была скопирована на ряд ресурсов, поэтому вы можете ее посмотреть, например, здесь: http://othermedia.info/?p=3147

## Thursday 7th January, 2021

Sergey\_Vladivostok\_gitlab

[01:01](#msg5ff65d749632f63d87ff7907)В Red есть поддержка SSL3, но нет поддержки работы с COM портом (RS232)

```
>> ? system/ports
SYSTEM/PORTS is an object! with the following words and values:

>>
```

В Rebol есть поддержка COM

```
>> ? system/ports
SYSTEM/PORTS is an object of value:
   input           port!     make port! [ scheme: 'console host: none port-id: ...
   output          port!     make port! [ scheme: 'console host: none port-id: ...
   echo            none!     none
   system          port!     make port! [ scheme: 'system host: none port-id: n...
   serial          block!    length: 2
   wait-list       block!    length: 1

>> ? system/ports/serial
SYSTEM/PORTS/SERIAL is a block of value: [com1 com2]
>>
```

но нет поддержки SSL3  
Мне нужно написать программу, которая будет работать с устройством подключенным к COM порту и данными в сети через https (ssl3)... Не Red не Rebol/View не подходят, есть надежда на Rebol/SDK (Pro, Command) но не могу на них найти/купить лицензию.

[02:56](#msg5ff6786103529b296bd4a021)Про статью - спасибо за неё, читал и она, вместе с интервью с Nenad Rakocevic ( https://habr.com/ru/post/265685/ ) была основными аргументами, которые меня направили в сторону Red, а оттуда и в Rebol .

DVL333

[12:33](#msg5ff6ff82dc2e4809aa09369b)Сергей, насколько я помню, несколько лет назад был анонс, что Rebol/SDK теперь бесплатен.  
Я быстро посмотрел в поисковике, нашел вот такой репозиторий:  
http://www.rebol.com/downloads/v278/sdk/index.html

Sergey\_Vladivostok\_gitlab

[22:59](#msg5ff79256fe007479e4fa281e)К сожалению он не бесплатен, а свободно скачиваемый. При запуске говорит:

```
*** License key is missing. Special features are not available.
*** Please put your license.key file in the correct directory.
>>
```

[23:31](#msg5ff799b9dc2e4809aa0ae060)Собственно этот "license.key" и пытаюсь найти/купить...

## Friday 8th January, 2021

DVL333

[00:11](#msg5ff7a33c03529b296bd79f9d)Я немного ошибся, бесплатным из SDK делали лишь Rebol/Command - похоже, он и вправду работает, хоть и требует ключ.  
Но на сайте Rebol написано, что функциональность работы с SSL/HTTPS доступна в Rebol/View в полном объеме (http://www.rebol.com/docs/ssl.html) Другое дело, что поддерживаются лишь SSLv2, SSLv3 и TLSv1 Скорее всего https://gitter.im/red/Russian имеет более позднюю версию шифрования (TLSv1.1, TLSv1.2).  
Например, с тем же yandex.ru все работает :

```
>> read https://yandex.ru/
connecting to: yandex.ru
== {<!DOCTYPE html><html class="i-ua_js_no i-ua_css_standart i-ua_browser_unknown i-ua_browser-engine_unknown i-ua_browser_de
sktop ...
```

Поэтому проблема тут не в версии Rebol и платная версия вам не поможет. С другой стороны, с сайтами с SSLv2, SSLv3 и TLSv1 все должно работать нормально.

Sergey\_Vladivostok\_gitlab

[04:40](#msg5ff7e22214cec811ec8575cd)Работаь Rebol/Command вроде как работает, как и Rebol/Pro, но на уровне Rebol/View, с отключением всех дополнительных возможностей, о чём собственно и сообщает.  
Где-то читал, что в Command/Pro/SDK кроме всяческих баз данных, ещё и протоколы шифрования расширены. Command более не продаётся (http://www.rebol.com/command.html ) и хоть он бесплатно скачивается, но всё равно требует лицензию.

## Thursday 21st January, 2021

Sergey\_Vladivostok\_gitlab

[13:23](#msg6009804a6244ee1450a2414c)Извиняюсь за вопрос не совсем по теме, но некому не удавалось в linux`е (debian) у скрипта на R2 кириллицу отобразить? Перепробовал всевозможные кодировки для текста скрипта - кириллицы нет не в консоли, не в xterm`e, не в графическом окошке (VID)... Как то через wine пытаться юзать - некомельфо...

[22:39](#msg600a02bea2354e44ac9c77bb)xterm - разобрался, utf-8 отображается и обрабатывается замечательно, остался вопрос с графикой.

## Thursday 11st February, 2021

Sergey\_Vladivostok\_gitlab

[12:33](#msg602524054f7d1b68e54613b5)Ребята, а есть русское сообщество по Rebol2 или вопросами по нему можно офтопить тут?

## Wednesday 17th February, 2021

9214

[11:59](#msg602d051f8621811d588179cf)@Sergey\_Vladivostok\_gitlab Оффтопь сюда, лучше места всё равно не найдёшь.

## Saturday 13th March, 2021

Sergey\_Vladivostok\_gitlab

[23:49](#msg604d4f80e8267a46f211d1b9)Офтоплю:  
У R2 проблемы с SSL3:

```
>> a: read https://github.com
** Command Error: SSL Error:  error:1407742E:SSL routines:SSL23_GET_SERVER_HELLO:tlsv1 aler
t protocol version
** Where: build-port
** Near: system/words/set-modes port/sub-port [secure: true]
```

выкручиваюсь с помощью cURL:

```
>> a: copy ""
>> call/output "curl -l https://github.com" a
```

а вот как бы перенаправит трафик для почты через curl?  
send работает только для серверов без шифрования (поднял на свём хостинге), тогда как все почтовые сервисы ушли в "https" и чтобы работать сними приходится поднимать проксю "stunnel", возможно есть способ для сетевых протоколов задействовать curl "по умолчанию"? Stunnel настроить на "обёртывание" https у меня чего то не получилось, хотя pop и smtp "обернулись" без проблем.

## Monday 14th June, 2021

Sergey\_Vladivostok\_gitlab

[11:06](#msg60c7381a5e8dfc4f117e53d9)Собираю книжки и документацию по Rebol, в меру возможностей перевожу на русский, т.к. в английском не селён. Если у кого-то есть что добавить или желание за гуглпереводчиком поправить текст на человечий язык - пишите, почта внизу страницы http://pochinoksergey.ru/rebol/doc.html
