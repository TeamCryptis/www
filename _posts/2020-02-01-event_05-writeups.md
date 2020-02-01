---
layout: post
title: "EVENT_05 - Writeups"
categories: Events
excerpt_separator:  <!--more-->
---
<!--more-->

### Date : 15/01/2020 - 17h30 (<a href="https://slides.com/adelalm/event_05" target="_blank">slides</a>)

- [Création d'un dump](#cr%c3%a9ation-dun-dump)
- [Linux](#01-linux-kernel)
    - [01. Linux kernel](#01-linux-kernel)
    - [02. User](#02-user)
    - [03. Nom pc](#03-nom-pc)
    - [04. Hash](#04-hash)
    - [05. Hash](#05-hash)
    - [06. Pid](#06-pid)
    - [07. Firefox](#07-firefox)
    - [08. Cookies](#08-cookies)
    - [09. Bash history](#09-bash-history)
- [Windows - Basic](#windows---basic)
    - [profile](#titre--profile)
    - [ip](#titre--ip)
    - [user](#titre--user-1)
    - [desktop file](#titre--desktop-file)
    - [hostname](#titre--hostname)
- [Windows - Firefox](#windows---firefox)
    - [pid](#titre--pid-1)
    - [new smartphone](#titre--new-smartphone)
    - [teamcryptis.fr](#titre--teamcryptisfr)
- [Windows - Password Manager](#windows---password-manager)
    - [name](#titre--name)
    - [pid](#titre--pid-2)
    - [database](#titre--database)
    - [file address](#titre--file-address)
    - [password](#titre--password)
    - [zip](#titre--zip)
- [Windows - Notepad++](#windows---notepad)
    - [pid](#titre--pid-3)
    - [secret file](#titre--secret-file)

---

# Création d'un dump

---

```bash
# dump de la RAM
$ VBoxManage debugvm 'Windows 7' dumpvmcore --filename=dump.elf

# trouver les offsets
$ size=0x$(objdump -h dump.elf|egrep -w "(Idx|load1)"|tail -1 | tr -s " " |  cut -d " " -f 4)
off=0x$(objdump -h dump.elf |egrep -w "(Idx|load1)"|tail -1|tr -s " "|cut -d " " -f 7)

# extraire une image
$ head -c $(($size+$off)) dump.elf|tail -c +$(($off+1)) > windows.raw
```

---

# 01. Linux kernel

---

### Titre : Linux Kernel

### Points : 100

---

### Description

---

Bonjour,
Votre mission va être d'analyser [ce dump Linux](https://filesender.renater.fr/?s=download&token=60a0699d-0ab5-258a-22ab-c6c7c8fbdd83) en utilisant le framework Volatility.

Pour décompresser l'archive chiffrée:

```
$ 7z x ./ubuntu.raw.zip -pcryptis15012020
```

Donnez la version du kernel linux.

Par exemple si vous avez:

```
Linux version 4.4.0-72-lowlatency (buildd@lcy01-17) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) )
```

Vous devrez répondre:

```
4.4.0-72-lowlatency
```

Vous trouverez le profil à utiliser ci-joint.

Setup :

```bash
$ mkdir plug
$ mv Ubuntu.zip plug/
$ python vol.py --plugins=plug/ --profile=LinuxUbuntux64 -f ubuntu.raw
```

---

### Résolution

---

La première question va nous permettre d'identifier la version du kernel linux et nous permettre de créer le profil si on ne l'a pas.

```bash
$ strings ubuntu.raw | grep "Linux version" | sort | uniq
Linux version 5.0.0-37-generic (buildd@lcy01-amd64-023) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #40~18.04.1-Ubuntu SMP Thu Nov 14 12:06:39 UTC 2019
```

`5.0.0-37-generic`

---

# 02. User

---

### Titre : User

### Points : 120

---

### Description

---

Trouvez le nom de l'utilisateur.

Réponse : md5(user)

---

### Résolution

---

On peut trouver le nom de l'utilisateur de 2 manières différentes:

**Historique bash**

```bash
$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_bash
Volatility Foundation Volatility Framework 2.6.1
Pid      Name                 Command Time                   Command
-------- -------------------- ------------------------------ -------
    3333 bash                 2020-01-09 09:04:59 UTC+0000   sudo chown jack:jack Ubuntu1804_50023-generic.zip 
```

**Fichier `/etc/shadow`**

```bash
$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_find_file -F "/etc/shadow"
Inode Number                  Inode File Path
---------------- ------------------ ---------
          131275 0xffff9ff04bc580e8 /etc/shadow

$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_find_file -i 0xffff9ff04bc580e8 -O shadow

$ cat shadow
...
jack:$6$DBejuje5$3qudIWZnaxffISaP6FVCYP9TtmMlI.gpL8XzHKPor/6/XiWuvZbZ.gRX8d67r/xcXBWQGwJXS08lk6lka1dFS0:18268:0:99999:7:::
...

$ echo -n 'jack' | md5sum
4ff9fc6e4e5d5f590c4f2134a8cc96d1
```

`4ff9fc6e4e5d5f590c4f2134a8cc96d1`

---

# 03. Nom pc

---

### Titre : Nom pc

### Points : 130

---

### Description

---

Quelle est le nom de la machine ?

Réponse : md5(nom)

---

### Résolution

---

On va chercher le nom de la machine dans le fichier `/etc/hosts`.

```bash
$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_find_file -F "/etc/hosts"
Inode Number                  Inode File Path
---------------- ------------------ ---------
          131225 0xffff9ff074b3c958 /etc/hosts

$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_find_file -i 0xffff9ff074b3c958 -O hosts

$ cat hosts 
127.0.0.1	localhost
127.0.1.1	skellington

$ echo -n "skellington" | md5sum
659b85a40bc43a802b6b083b5fd912e8  -
```

`659b85a40bc43a802b6b083b5fd912e8`

---

# 04. Hash

---

### Titre : Hash

### Points : 150

---

### Description

---

Trouvez le hash de l'utilisateur.

/!\ On veut que le hash ;-) /!\

---

### Résolution

---

On commence par récupérer `/etc/shadow`:

```bash
$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_find_file -F "/etc/shadow"
Inode Number                  Inode File Path
---------------- ------------------ ---------
          131275 0xffff9ff04bc580e8 /etc/shadow

$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_find_file -i 0xffff9ff04bc580e8 -O shadow

$ cat shadow
...
jack:$6$DBejuje5$3qudIWZnaxffISaP6FVCYP9TtmMlI.gpL8XzHKPor/6/XiWuvZbZ.gRX8d67r/xcXBWQGwJXS08l
```

Structure:

* `jack`: nom d'utilisateur
* `$6`: utilisation de sha-256 sur le mot de passe
* `$DBejuje5`: salt utilisé lors du hash
* `3qudIWZnaxffISaP6FVCYP9TtmMlI.gpL8XzHKPor/6/XiWuvZbZ.gRX8d67r/xcXBWQGwJXS08lk6lka1dFS0`: hash du mot de passe

`3qudIWZnaxffISaP6FVCYP9TtmMlI.gpL8XzHKPor/6/XiWuvZbZ.gRX8d67r/xcXBWQGwJXS08lk6lka1dFS0`

---

# 05. Hash

---

### Titre : Hash

### Points : 200

---

### Description

---

Retrouvez le mot de passe en clair de l'utilisateur à l'aide du hash précédent.

Nous savons que le mot de passe contient `yolo` et que ce dernier se trouve probablement dans la wordliste `rockyou.txt`.

---

### Résolution

---

```bash
$ cat rockyou.txt|grep 'yolo' > yolodic.txt
```

Nous devons commencer par créer notre wordlist (tous les mots de passe de `rockyou.txt`qui contiennent `yolo`).

```bash
$ cat hash.txt
$6$DBejuje5$3qudIWZnaxffISaP6FVCYP9TtmMlI.gpL8XzHKPor/6/XiWuvZbZ.gRX8d67r/xcXBWQGwJXS08lk6lka1dFS0
```

On crée ensuite un fichier pour stocker notre hash.

```bash
$ hashcat -m 1800 -a 0 -o found.txt hash.txt yolodic.txt
$ cat found.txt
$6$DBejuje5$3qudIWZnaxffISaP6FVCYP9TtmMlI.gpL8XzHKPor/6/XiWuvZbZ.gRX8d67r/xcXBWQGwJXS08lk6lka1dFS0:5yoloca
```

On peut utiliser l'outil `hashcat`pour faire une attaque par dictionnaire.

`5yoloca`

---

# 06. Pid

---

### Titre : Pid

### Points : 130

---

### Description

---

Donnez le PID du logiciel de traitement de texte ouvert.

Réponse : md5(pid)

---

### Résolution

---

```bash
$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_psaux
4168   1000   1000   gedit
$ echo -n '4168'| md5sum
e46bc064f8e92ac2c404b9871b2a4ef2  -
```

Il suffit de lister les processus et de repérer le processus `gedit`.

`e46bc064f8e92ac2c404b9871b2a4ef2`

---

# 07. Firefox

---

### Titre : Firefox

### Points : 300

---

### Description

---

Retrouvez le flag dans l'historique de navigation de Firefox.

---

### Résolution

---

Avec quelques recherches sur Internet on apprend que Firefox stock l'historique de navigation dans une base de données SQLite. Cette base est dans un fichier `places.sqlite`.

**Trouver et dumpper  `places.sqlite`**

```bash
$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_find_file -L | grep 'places.sqlite'
1837370 0xffff9ff0b59dd600 /home/jack/.mozilla/firefox/7wu4l0w8.default-release/places.sqlite

$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_find_file -i 0xffff9ff0b59dd600 -O places.sqlite

$ file places.sqlite 
places.sqlite: SQLite 3.x database, user version 53, last written using SQLite version 3029000
```

**Analyse de la base SQLite**

Pour ouvrir cette base de données sous Linux, nous allons utiliser `sqlite3`.

```bash
$ sqlite3 places.sqlite 
SQLite version 3.22.0 2018-01-22 18:45:57
sqlite> .tables
moz_anno_attributes    moz_historyvisits      moz_meta             
moz_annos              moz_inputhistory       moz_origins          
moz_bookmarks          moz_items_annos        moz_places           
moz_bookmarks_deleted  moz_keywords         

sqlite> select * from moz_places;
...
14|https://www.google.com/search?client=ubuntu&channel=fs&q=Q1JZUFRJU3tIMXNUMHJ5fQ%3D%3D&ie=utf-8&oe=utf-8||moc.elgoog.www.|1|0|1|2000|1578561926043705|6xI2A2Ajo3TN|0|47358826493391|||8
...

$ echo "Q1JZUFRJU3tIMXNUMHJ5fQ==" | base64 -d
CRYPTIS{H1sT0ry}
```

`CRYPTIS{H1sT0ry}`

---

# 08. Cookies

---

### Titre : Cookies

### Points : 300

---

### Description

---

Retrouvez le cookie de [doubleclick.net](http://doubleclick.net/)

Réponse : md5(cookie_value)

---

### Résolution

---

Avec quelques recherches sur Internet on apprend que Firefox stock l'historique de navigation dans une base de données SQLite. Cette base est dans un fichier `cookies.sqlite`.

**Trouver et dumpper `cookies.sqlite`**

```bash
$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_find_file -L | grep 'cookies.sqlite'
1837246 0xffff9ff0b83100e8 /home/jack/.mozilla/firefox/7wu4l0w8.default-release/cookies.sqlite

$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_find_file -i 0xffff9ff0b83100e8 -O cookies.sqlite

$ file cookies.sqlite 
places.sqlite: SQLite 3.x database, user version 53, last written using SQLite version 3029000
```

**Analyse de la base SQLite**

Pour ouvrir cette base de données sous Linux, nous allons utiliser `sqlite3`.

```sqlite
$ sqlite3 places.sqlite
SQLite version 3.22.0 2018-01-22 18:45:57
sqlite> .table
moz_cookies

sqlite> select * from moz_cookies;
17|doubleclick.net||IDE|AHWqTUmQrl8u-skM4QzHvB4NqTSjf0dv3M53uR7FjxlMBN0tCUTteEvw2dOQzrmH|.doubleclick.net|/|1612257917|1578561917024836|1578561917024836|0|1|0|0|0
```

```bash
$ echo -n "AHWqTUmQrl8u-skM4QzHvB4NqTSjf0dv3M53uR7FjxlMBN0tCUTteEvw2dOQzrmH" | md5sum
a96d10cb92d9af4061a92f124300e2b7
```

`a96d10cb92d9af4061a92f124300e2b7`

---

# 09. Bash history

---

### Titre : Bash history

### Points : 120

---

### Description

---

Retrouvez le flag dans l'historique bash.

Réponse : md5(flag)

---

### Résolution

---

```bash
$ vol.py --plugins=. --profile=LinuxUbuntux64 -f ubuntu.raw linux_bash
Pid      Name                 Command Time                   Command
-------- -------------------- ------------------------------ -------
    2408 bash                 2020-01-09 09:19:34 UTC+0000   echo "Q1JZUFRJU3tIMXN0MHJ5fQo="
    
$ echo -n "CRYPTIS{H1st0ry}" | md5sum
fa547f400cf81dc9de7e5bc770d89eb0
```

`fa547f400cf81dc9de7e5bc770d89eb0`

---

# Windows - Basic

---

### Titre : profile

### Points : 100

---

### Description

---

Bonjour,

Votre mission va être d'analyser [ce dump Windows](https://send.firefox.com/download/730408d9edea0eed/#LbnQVFL33_4Lhq_3cMUiaw ) en utilisant le framework Volatility.

Pour décompresser l'archive chiffrée:

`$ unzip -P 'cryptis15012020' ./windows.zip`

Commençons par du basique :)

Volatility conseille plusieurs profils sur ce dump, donnez le premier profil de la liste.

---

### Résolution

---

> `imageinfo - Identify information for the image` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#imageinfo)

```bash
$ vol.py -f ./windows.raw imageinfo
INFO    : volatility.debug    : Determining profile based on KDBG search...
          Suggested Profile(s) : , Win7SP0x64, Win2008R2SP0x64, Win2008R2SP1x64_24000, Win2008R2SP1x64_23418, Win2008R2SP1x64, Win7SP1x64_24000, Win7SP1x64_23418
           AS Layer1 : WindowsAMD64PagedMemory (Kernel AS)
           AS Layer2 : FileAddressSpace (/home/user/cryptis/windows.raw)
```

`Win7SP1x64`

---

### Titre : ip

### Points : 125

---

### Description

---

Quelle était l'adresse IP de la machine ?

---

### Résolution

---

> `netscan - Scan a Vista (or later) image for connections and sockets` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#networking)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 netscan
Proto Local Address    Foreign Address    State         Pid    Owner
...
TCPv4 10.0.2.15:49528  216.58.198.195:80  ESTABLISHED   2320   firefox.exe
...
```

`10.0.2.15`

---

### Titre : user

### Points : 150

---

### Description

---

Un seul compte utilisateur est présent sur la machine, quel est le nom de ce compte ?

Hint:

* Home directory

---

### Résolution

---

Nous savons que dans Windows chaque utilisateur possède un répertoire personnel (home directory) dans le dossier `\Users\`. Par exemple, si nous avons un utilisateur qui s'appelle `Albert`, alors son répertoire personnel sera `\Users\Albert\`.

Nous allons donc lister tous les fichiers qui contiennent `Users` dans leur chemin, et ainsi peut-être trouver le nom de l'utilisateur de la machine.

> `filescan - Pool scanner for file objects` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#filescan)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 filescan | grep -i 'Users'
...
\Device\HarddiskVolume2\Users\Alfonse\AppData\Roaming\Mozilla\...
...
```

`Alfonse`

---

### Titre : desktop file

### Points : 150

---

### Description

---

Un fichier `.txt` est sur le bureau de l'utilisateur, quel est le nom de ce fichier ?

---

### Résolution

---

> `filescan - Pool scanner for file objects` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#filescan)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 filescan | grep -i  'Desktop.*txt'
0x000000007e312070  16   0 R--rwd \Device\HarddiskVolume2\Users\Alfonse\Desktop\fichier.txt
```

`fichier` ou `fichier.txt`

---

### Titre : hostname

### Points : 300

---

### Description

---

Quelle est le nom de la machine (hostname, computer name) de la machine ?

---

### Résolution

---

> `envars - Display process environment variables` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#envars)

```bash
$ vol.py -f ./final.elf --profile=Win7SP1x64 envars
...
	456 services.exe  0x0000000000251320 COMPUTERNAME SUPERMACHINE
    2936 firefox.exe  0x0000000000411320 USERDOMAIN   superMachine
    2936 firefox.exe  0x0000000000411320 USERNAME     Alfonse
    2936 firefox.exe  0x0000000000411320 USERPROFILE  C:\Users\Alfonse
    2936 firefox.exe  0x0000000000411320 windir       C:\Windows
    3328 audiodg.exe  0x00000000000b1320 Path         C:\Windows\System32
    3328 audiodg.exe  0x00000000000b1320 SystemDrive  C:
    3328 audiodg.exe  0x00000000000b1320 SystemRoot   C:\Windows
...
```

`SUPERMACHINE` ou `superMachine`

---

# Windows - Firefox

---

### Titre : pid

### Points : 100

---

### Description

---

Quel est le PID (Process ID) du premier processsus Firefox ?

---

### Résolution

---

> `pstree - Print process list as a tree` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#pstree)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 pstree
Name                                 Pid   PPid    Time
--------------------------------- ------ ------   ----
 0xfffffa8003a2d4a0:firefox.exe     2320   2308   2020-01-11 14:47:56 UTC+0000
. 0xfffffa8003b3d060:firefox.exe    2604   2320   2020-01-11 14:47:58 UTC+0000
. 0xfffffa8001ab9600:firefox.exe    3052   2320   2020-01-11 14:52:59 UTC+0000
. 0xfffffa8003ba2060:firefox.exe    2712   2320   2020-01-11 14:47:58 UTC+0000
. 0xfffffa8003b09220:firefox.exe    2480   2320   2020-01-11 14:47:57 UTC+0000
. 0xfffffa8001a6c8b0:firefox.exe    2936   2320  2020-01-11 15:03:24 UTC+0000
. 0xfffffa8001c5b060:firefox.exe     788   2320  2020-01-11 15:02:58 UTC+0000
. 0xfffffa8001c17260:firefox.exe    1112   2320  2020-01-11 14:58:21 UTC+0000
. 0xfffffa8003dc7a30:firefox.exe    2900   2320  2020-01-11 14:48:03 UTC+0000
```

`2320`

---

### Titre : new smartphone

### Points : 300

---

### Description

---

L'utilisateur est allé sur internet à la recherche d'un nouveau téléphone. Dumppez le cache des données Firefox, et recherchez une image de ce fameux téléphone.

Le flag est le `sha256` de l'image du téléphone.

Hint:

* Vous devez d'abord trouver dans quel dossier Firefox stock son cache sur Windows.

---

### Résolution

---

> [Ressource 1](https://www.acquireforensics.com/blog/mozilla-cache-folder.html)
>
> [Ressource 2](https://www.foxtonforensics.com/browser-history-examiner/firefox-history-location)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 filescan | grep -i 'Firefox' | grep -i 'cache2' > cache_files.txt

$ for addr in `cat cache_files.txt | awk '{print $1}'`; do vol.py -f ./windows.raw --profile=Win7SP1x64 dumpfiles -Q $addr -D ./firefox_cache/ ; done

$ ll firefox_cache/
...
-rw-r--r-- 1 user user  16384 Jan 12 18:01 file.None.0xfffffa8003b04360.dat
..

$ cat firefox_cache/file.None.0xfffffa8003b04360.dat | openssl dgst -sha256
(stdin)= 610e7b5aad979f4b99a25b90591f860bee09f7df5d00737e4f28c3e346a6e43d
```

`610e7b5aad979f4b99a25b90591f860bee09f7df5d00737e4f28c3e346a6e43d`

---

### Titre : teamcryptis.fr

### Points : 400

---

### Description

---

L'utilisateur a consulté une image top secrète sur le site `teamcryptis.fr`, retrouvez l'adresse URL de cette image en dumppant l'historique de Firefox.

Hint:

* vouS devez trouver ou firefox stock l'historiQue de navigation, et de queLle manIère (formaT dE données) ;)

---

### Résolution

---

Avec quelques recherches sur Internet on apprend que Firefox stock l'historique de navigation dans une base de données SQLite. Cette base est dans un fichier `places.sqlite`.

**Trouver et dumpper  `places.sqlite`**

> [Ressource](https://www.foxtonforensics.com/browser-history-examiner/firefox-history-location)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 filescan | grep -i 'Firefox.*places.sqlite'
...
0x000000007dbc54a0      1      1 R--rw- \Device\HarddiskVolume2\Users\Alfonse\AppData\Roaming\Mozilla\Firefox\Profiles\5av7ua1l.default-release\places.sqlite
...

$ vol.py -f ./windows.raw --profile=Win7SP1x64 dumpfiles -Q 0x000000007dbc54a0 -D .
```

**Analyse de la base SQLite**

Pour ouvrir cette base de données sous Linux, nous allons utiliser `sqlite3`.

```bash
$ sqlite3 ./file.None.0xfffffa8003bd08c0.vacb
SQLite version 3.22.0 2018-01-22 18:45:57
sqlite> .tables
moz_anno_attributes    moz_historyvisits      moz_meta
moz_annos              moz_inputhistory       moz_origins
moz_bookmarks          moz_items_annos        moz_places
moz_bookmarks_deleted  moz_keywords

sqlite> PRAGMA table_info(moz_places);
0|id|INTEGER|0||1
1|url|LONGVARCHAR|0||0
2|title|LONGVARCHAR|0||0
...

sqlite> select url from moz_places;
...
http://teamcryptis.fr/
http://teamcryptis.fr/sec/proute.jpeg
http://teamcryptis.fr/coucou/proute.jpeg
http://teamcryptis.fr/painauchocolat/proute.jpeg
http://teamcryptis.fr/cacher/proute.jpeg
http://teamcryptis.fr/coffre/proute.jpeg
http://teamcryptis.fr/coffre/prout.jpeg
http://teamcryptis.fr/secret/prout.jpeg
http://teamcryptis.fr/assets/images/secret/prout.jpeg # ici
http://teamcryptis.fr/assets/image/secret/prout.jpeg
http://teamcryptis.fr/asset/image/secret/prout.jpeg
http://teamcryptis.fr/secrets/prout.jpeg
...
```

`CRYPTIS{Bras_vEAU}`

---

# Windows - Password Manager

---

### Titre : name

### Points : 100

---

### Description

---

Quel est le nom du gestionnaire de mots de passe utilisé par l'utilisateur ?

---

### Résolution

---

> `pstree - Print process list as a tree` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#pstree)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 pstree
Name                                    Pid   PPid   Thds   Hnds Time
------------------------------------ ------ ------ ------ ------ ----
...
. 0xfffffa80019c0420:KeePassXC.exe     1256   1832      9    334 2020-01-11 15:00:30 UTC+0000
...
```

`KeePassXC`

---

### Titre : pid

### Points : 100

---

### Description

---

Quel est le PID (Process ID) du gestionnaire de mots de passe utilisé ?

---

### Résolution

---

> `pstree - Print process list as a tree` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#pstree)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 pstree
Name                                    Pid   PPid   Thds   Hnds Time
------------------------------------ ------ ------ ------ ------ ----
...
. 0xfffffa80019c0420:KeePassXC.exe     1256   1832      9    334 2020-01-11 15:00:30 UTC+0000
...
```

`1256`

---

### Titre : database

### Points : 150

---

### Description

---

Quel est le PID (Process ID) du gestionnaire de mots de passe utilisé ?

---

### Résolution

---

L'utilisateur stock ses mots de passe dans un fichier avec l'extension `.kdbx`, donnez le nom de ce fichier ?

> `pstree - Print process list as a tree` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#pstree)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 filescan | grep -i 'kdbx'
0x000000007e48edc0     16      0 R--rwd \Device\HarddiskVolume2\Users\Alfonse\Desktop\passwords_db.kdbx
```

`passwords_db.kdbx`

---

### Titre : file address

### Points : 150

---

### Description

---

Quelle est l'adresse mémoire du fichier `.kdbx` précèdent ?

---

### Résolution

---

L'utilisateur stock ses mots de passe dans un fichier avec l'extension `.kdbx`, donnez le nom de ce fichier ?

> `pstree - Print process list as a tree` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#pstree)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 filescan | grep -i 'kdbx'
0x000000007e48edc0     16      0 R--rwd \Device\HarddiskVolume2\Users\Alfonse\Desktop\passwords_db.kdbx
```

`0x000000007e48edc0`

---

### Titre : password

### Points : 200

---

### Description

---

Quelle est l'adresse mémoire du fichier `.kdbx` précèdent ?

---

### Résolution

---

Trouvez le mot de passe pour déchiffrer la base de données.

> `clipboard - Extract the contents of the windows clipboard`

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 clipboard
...
CF_UNICODETEXT  0x17300df 0xfffff900c1a76370 CRYPTIS{b3st_Passw0rd}
...
```

`CRYPTIS{b3st_Passw0rd}`

---

### Titre : zip

### Points : 300

---

### Description

---

Nous savons que l'utilisateur a téléchargé un fichier zip chiffré, retrouvez ce dernier ainsi que son mot de passe.

---

### Résolution

---

Trouvez le mot de passe pour déchiffrer la base de données.

> `filescan - Pool scanner for file objects`

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 filescan | grep -i '.zip$'
...
0x000000007fd17f20     16      0 -W-rwd \Device\HarddiskVolume2\Users\Alfonse\Downloads\secret.zip
...
```

> `dumpfiles - Extract memory mapped and cached files`

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 dumpfiles -Q 0x000000007fcbec00 -D ./zip/
Volatility Foundation Volatility Framework 2.6.1
DataSectionObject 0x7fcbec00   None   \Device\HarddiskVolume2\Users\Alfonse\Downloads\secret.zipMeyEpYn.zip.part

$ file zip/file.None.0xfffffa8001d13420.dat
zip/file.None.0xfffffa8001d13420.dat: Zip archive data, at least v1.0 to extract
```

```bash
$ unzip -P 'brAvo_p3tit_hacker' file.None.0xfffffa8001d13420.dat
Archive:  file.None.0xfffffa8001d13420.dat
 extracting: document.txt

$ cat document.txt
Bravo ;))
FLAG: CRYPTIS{//TODO}
```

`CRYPTIS{//TODO}`

---

# Windows - Notepad++

---

### Titre : pid

### Points : 100

---

### Description

---

Quel est le PID du processus `notepad++.exe` ?

---

### Résolution

---

> `pstree - Print process list as a tree` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#pstree)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 pstree
Name             Pid   PPid   Thds   Hnds Time
------------- ------ ------ ------ ------ ----
...
notepad++.exe   2304   1832      2     86 2020-01-11 14:49:55 UTC+0000
...
```

`2304`

---

### Titre : secret file

### Points : 300

---

### Description

---

L'utilisateur était entrain de créer un fichier important sur Notepad++ lors de la création du dump, retrouvez ce fichier en dumppant le processus !

---

### Résolution

---

> `pstree - Print process list as a tree` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#pstree)

```bash
$ vol.py -f ./windows.raw --profile=Win7SP1x64 pstree
. 0xfffffa8001ba0060:notepad++.exe 2304   1832      2     86 2020-01-11 14:49:55 UTC+0000
```

> `memdump - Dump the addressable memory for a process` [doc](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#memdump)

```bash
$ mkdir process_dump

$ vol.py -f ./windows.raw --profile=Win7SP1x64 memdump -p 2304 -D ./process_dump/
************************************************************************
Writing notepad++.exe [  2304] to 2304.dmp

$ ll process_dump/
-rw-r--r-- 1 user user 275230720 Jan 11 18:21 2304.dmp
```

```bash
$ strings -a -n5 ./process_dump/2304.dmp | less
...
Je suis entrain de cr
er un nouveau fichier dans la m
moire RAM
Normalement, avec Volaitlity je pourrai
tre capable de le retrouver, enfin, j'esp
re :)
flag: tout_est_en_RAM
 bient
flag: tout_est_en_RAM
 bient
...
```

`tout_est_en_RAM`