---
layout: post
title: "EVENT_03 - Writeups"
categories: Events
excerpt_separator:  <!--more-->
---
<!--more-->

### Date : 26/03/2019 - 18h (<a href="https://slides.com/adelalm/event_03" target="_blank">slides</a>)

<details><summary><h3 style="display: inline;">Menu</h3></summary><ul>
<li><a href="#crypto_0030_bienvenue">crypto_0030_bienvenue</a></li>
<li><a href="#crypto_0100_asr">crypto_0100_asr</a></li>
<li><a href="#crypto_0100_brutus">crypto_0100_brutus</a></li>
<li><a href="#crypto_0100_gilbert">crypto_0100_gilbert</a></li>
<li><a href="#crypto_0150_aqzwe">crypto_0150_aqzwe</a></li>
<li><a href="#crypto_0150_blaise">crypto_0150_blaise</a></li>
<li><a href="#crypto_0150_square">crypto_0150_square</a></li>
<li><a href="#crypto_0200_in_the_title">crypto_0200_in_the_title</a></li>
<li><a href="#crypto_0200_metamorphe">crypto_0200_metamorphe</a></li>
<li><a href="#crypto_0200_my_brain">crypto_0200_my_brain</a></li>
<li><a href="#crypto_0300_divina_commedia">crypto_0300_divina_commedia</a></li>
<li><a href="#crypto_0300_h">crypto_0300_h</a></li>
<li><a href="#crypto_0300_over26">crypto_0300_over26</a></li>
<li><a href="#crypto_0300_png">crypto_0300_png</a></li>
<li><a href="#crypto_0300_raptorisation">crypto_0300_raptorisation</a></li>
<li><a href="#crypto_0400_boing">crypto_0400_boing</a></li>
<li><a href="#crypto_0400_brutor">crypto_0400_brutor</a></li>
<li><a href="#crypto_0400_rsa_server">crypto_0400_rsa_server</a></li>
<li><a href="#crypto_0500_inutile_v3">crypto_0500_inutile_v3</a></li>
</ul></details>

# crypto_0030_bienvenue

---

### Titre : Bienvenue

### Points : 30

---

### Description

---

Vous êtes les bienvenus avec un petit chiffrement antique. Amusez-vous bien ! :p

CI3u_7yRSn3c4sY{v_rnePbe3y@}T1nnpl

---

### Réalisation

---

CRYPTIS{b13nvenu3_3n_cryp74n@lyse}

```python
#!/usr/bin/python3
import os, sys

clair = sys.argv[1]
decalage = int(sys.argv[2])
taille = len(clair)
chiffre = []

cpt1 = 0
cpt2 = 1

for i in range(taille):
	chiffre.append(clair[cpt1])
	cpt1 += decalage
	if cpt1 > taille-1 :
		cpt1 = cpt2
		cpt2 += 1

print("".join(chiffre))
```

```bash
$ python scytale.py CRYPTIS{b13nvenu3_3n_cryp74n@lyse} 5
CI3u_7yRSn3c4sY{v_rnePbe3y@}T1nnpl
```

---

### Résolution

---

Après 2 événements, on commence à connaître le début du flag `CRYPTIS`, on va donc procéder à une attaque par clair connu.

*Une **attaque** à texte **clair connu** est un modèle d'**attaque**
en cryptanalyse où l'attaquant possède des textes clairs ainsi que 
leurs versions chiffrées et est libre de les utiliser pour révéler 
d'autres informations secrètes comme la clé de chiffrement.*

En observant le chiffré, on peut s'apercevoir que le tag `CRYPTIS` apparaît en effet, ainsi que les `{}`. Les caractères ne sont juste pas à leur place. Le flag aurait donc eu ses lettres décalées dans l'espace à l'aide d'un chiffrement antique comme la consigne le précise. 

En observant d'encore plus près, l'espacement entre les lettres `CRYPTIS` est un interval régulier, de là, on peut penser qu'il s'agit peut-être d'un chiffrement par une Scytale.

* Connaitre taille de clé :
  * Diviser taille du chiffré par l'écart entre 2 lettres censées être juxtaposées (`C` et `R`)
  * 34/7 = 5,...
  * Prendre la partie entière du calcul : 5


Script résolvant la scytale à partir d'une clé donnée:

```python
#!/usr/bin/python3
import os, sys

chiffre = sys.argv[1]
cle = int(sys.argv[2])
taille = len(chiffre)
clair = []

if taille % cle == 0 :
	decalage = taille/cle
else :
	decalage = (taille/cle)+1

cpt1 = 0
cpt2 = 1

for i in range(taille):
	clair.append(chiffre[cpt1])
	cpt1 += decalage
	if cpt1 > taille-1 :
		cpt1 = cpt2
		cpt2 += 1

print("".join(clair))
```

```bash
$ python scytale_resolv.py CI3u_7yRSn3c4sY{v_rnePbe3y@}T1nnpl 5
CRYPTIS{b13nvenu3_3n_cryp74n@lyse}
```

ATTENTION : Si vous choisissez d'utiliser un site tel que [www.dcode.fr](www.dcode.fr), n'oubliez pas de préserver la ponctuation !

`CRYPTIS{b13nvenu3_3n_cryp74n@lyse}`
# crypto_0100_asr

---

### Titre : ASR

### Points : 100

---

### Description

---

Nous avons tous les éléments nécessaires au déchiffrement du fichier `flag.txt.enc`, mais nos meilleurs agents n'y parviennent pas. Pouvez-vous y jeter un coup d'oeil ?

---

### Réalisation

---

Le but de ce challenge est de familiariser les participants à l'utilisation de la commande `openssl` sur le chiffrement asymétrique RSA. Nous fournirons alors pour ce challenge 2 clés. La clé privée (`priv_key.pem`) ainsi que la clé publique ( `pub_key.pem`). Nous mettrons le flag dans un fichier texte ( `flag.txt.enc`), chiffré avec la clé publique.

Cependant, pour ajouter un petit peu de difficulté à ce challenge, nous allons inverser le nom des fichiers `priv_key.pem` et `pub_key.pem`. C'est-à-dire que le fichier `pub_key.pem` va maintenant contenir la clé privée et `priv_key.pem` va contenir la clé publique.

Il nous faut maintenant créer nos 3 fichiers et réaliser l'inversion.

```bash
# générer notre priv_key.pem
$ openssl genrsa -out priv_key.pem 2048

# générer notre pub_key.pem, dérivée de priv_key.pem
$ openssl rsa -in priv_key.pem -pubout -out pub_key.pem

# créer notre fichier flag.txt
$ echo 'CRYPTIS{keys_manager_expert_<3}' > flag.txt

# chiffrer notre flag.txt en flag.txt.enc avec pub_key.pem
$ openssl rsautl -encrypt -pubin -inkey pub_key.pem -in flag.txt -out flag.txt.enc

# inverser priv_key.pem et pub_key.pem
$ mv priv_key.pem temp.pem
$ mv pub_key.pem priv_key.pem
$ mv temp.pem pub_key.pem
```

Pour ce challenge, nous fournirons les fichiers: `priv_key.pem`, `public_key.pem` et `flag.txt.enc`.

---

### Résolution

---

Ce challenger nous fournit 3 fichiers: `priv_key.pem`, `pub_key.pem` et `flag.txt.pem`. On comprend donc rapidement que le but sera de déchiffrer `flag.txt.enc` afin d'obtenir le flag. Vu les noms des fichiers de ce challenge, il est question d'un chiffrement asymétrique, c'est-à-dire que, l'on utilise la clé publique afin de chiffrer et la clé privée afin de déchiffrer. Le chiffrement asymétrique le plus utilisé est RSA.

Regardons rapidement le type des fichiers que l'on nous donne, ainsi que leur contenu.

```bash
$ file priv_key.pem
priv_key.pem: ASCII text
$ cat priv_key.pem
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1QlMus9ncgT25KTZI4NW
ipUkGkR3CdrqFBSRobikF5fYLbFK9ox/07bfJBLTvlrvkC2ceERbYgnOkPYAvua2
1MwBRFTBH1yhUPnBq9jFomO9aXuuOKqAaKmXPUCps96lsXwN6W2sBwd2TwUzg7k3
e2rpC3p2M1oYmzNkp0FE6++kwFBXricbVdVsjJ/TFqAN/J/3REKHS/QACqZkFuCJ
HeEGM2CsasY1HGPKeXXk4TUYJnJ39+b/jtpu/xnhY30pFLpmaPJTifkLWLVGFUzf
zrK5JA0VS9i5yjIvi4WAUssC6grhQz0zaDZGfpwx4OivlueKxZnH4TBuQkLZThJW
GQIDAQAB
-----END PUBLIC KEY-----

################################################################

$ file pub_key.pem
pub_key.pem: PEM RSA private key
$ cat pub_key.pem
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEA1QlMus9ncgT25KTZI4NWipUkGkR3CdrqFBSRobikF5fYLbFK
9ox/07bfJBLTvlrvkC2ceERbYgnOkPYAvua21MwBRFTBH1yhUPnBq9jFomO9aXuu
OKqAaKmXPUCps96lsXwN6W2sBwd2TwUzg7k3e2rpC3p2M1oYmzNkp0FE6++kwFBX
ricbVdVsjJ/TFqAN/J/3REKHS/QACqZkFuCJHeEGM2CsasY1HGPKeXXk4TUYJnJ3
9+b/jtpu/xnhY30pFLpmaPJTifkLWLVGFUzfzrK5JA0VS9i5yjIvi4WAUssC6grh
Qz0zaDZGfpwx4OivlueKxZnH4TBuQkLZThJWGQIDAQABAoIBAQC97XiW4+nZ4Uss
NTvRSXqSOrzhHkDybFVcaaocgDzrO9jjg7jNbh1YZyUxSAe3IeOKqt9g6bB/Czc6
TdgEWjSOKwLGJLm4eCDpzIE58Bzi1gE8VaPRqVCp/uhzF380eT9HqM3OWpSP/7se
YAi5Wxt30KzMKvXOeniNhZgq9Sm5HV/IIfXACC0oPucH9TCgS8Z1+d53CwlGYFEf
3yHsQnUB4JQqnN73UYJsf4MzIqnDHvL6vsyC6OVTcx7fnzA904MXutPOi9P5WQjw
KAKAikV28p2uZ6947TQlmXSCwbkznj+pWChYVLtP70uNR+4Ywl+lu33CSvdDEC89
ON0WXAQxAoGBAP7iQCUUYjySAfRRKh9lqlaOOYWMAwowV4G/tKHO35GWN0vJ/5nW
Vue2SZ6yynfh9wpR6oJrX+HRv5aM8YDxO0+MyGwNB/emwZjv0eGPHu8+k+R7eSVC
Wp5TVqZXrq5pks1EGjd1rmQ5i0+e4vWXgfZifUUdz2f4913Ms1BcQd+/AoGBANX4
IlQi6vdVlpaKGOZnj1GHQBiCWXXqg7JKhcq2v3ef9uKwh5HnfNeZTeQeadKWJ4Gv
ph/ZTWcMO2p1kPQ8wHzJn6k+UN/DruSe1CIvuJhrj6jJbs9HUiFXN2WtOxpf3zdr
i3Yv7PorluHJradU4O3sCYOedq6SXcDZxePWRsAnAoGBAPKVFwOzYMPRGrcSwIpd
Uj9K4Ygu932tALvmXt5ZbAK9+ybQu8oIa3Hg1jSKaZSrpVlXGWDDHOBppnR89CUK
cq6FiQL9bAXR2hPau+B3PLPq1QryURybCHADVUa/0OsCY8uk82axRCbzdZlz2QJx
DioXFq6/bnTASX4mosrq4281AoGAQtQWPLsPMiLsPqZxMn1D2Q3qKf2EXXzalzQJ
Z4/+ayluHc1O+nYXmusJ1ebd3GUDf9DRjP782uOKJy0DEhVrdU4v7NdGwSzIEiW9
UdQfzpNBslD/qAO5lio8Zihd3lX1TMTtMQO0+0nj/S9Van7rJcRkEFTM8qdKWvJp
iUiinl8CgYEAhbtJYGkcxCf4W7eQC2cXsRol9aL0DDwZeboPh/KqsMx4/+Qt7+5u
5cQpMzNNwalbJ3uQCKlW41A8sW+kj9Cu8ZvX6qnnbmL/x+6flACs0qTGAOTR3dAd
FVnLzIrIMwwn3poLwtf0EM3zX1dhYU/IMNnmRqoQ3mPhPBAZEth+c7M=
-----END RSA PRIVATE KEY-----
```

On peut en conclure que c'est bien RSA qui est utilisé dans ce challenge. Nous allons donc maintenant utiliser `openssl` afin de déchiffrer notre `flag.txt.enc`.

```bash
$ openssl rsautl -decrypt -inkey priv_key.pem -in flag.txt.enc -out flag.txt.dec
unable to load Private Key
4357084780:error:09FFF06C:PEM routines:CRYPTO_internal:no start line:/BuildRoot/Library/Caches/com.apple.xbs/Sources/libressl/libressl-22.240.1/libressl-2.6/crypto/pem/pem_lib.c:683:Expecting: ANY PRIVATE KE
#:(
```

Ca ne fonctionne pas, `openssl` n'arrive pas à charger notre `priv_key.pem`(`unable to load Private Key`). Il y a donc un problème.

En relisant un peu les fichiers `priv_key.pem` et `pub_key.pem` on s'aperçois d'un petit problème. En effet, dans `pub_key.pem` on peut lire `BEGIN RSA PRIVATE KEY` et `END RSA PRIVATE KEY`. C'est très étrange, car ces 2 chaînes se trouvent normalement dans le contenu d'une clé privée.

Peut-être que les contenus des 2 fichiers ont été inversés ? Essayons donc de déchiffrer avec `pub_key.pem` qui est peut-être notre vraie clé privée.

```bash
$ openssl rsautl -decrypt -inkey pub_key.pem -in flag.txt.enc -out flag.txt.dec
$ cat flag.txt.dec
CRYPTIS{keys_manager_expert_<3}
```

C'était donc bien ça, `pub_key.pem` est en réalité `priv_key.pem`. Les 2 clés ont donc été inversées.

`CRYPTIS{keys_manager_expert_<3}`
# crypto_0100_brutus

------

### Titre : Brutus

### Points : 100

------

### Description

------

Nous avons intercepté un message étrange d'un certain brutus. Aidez-nous à le décrypter !

Mb rtgokgtg fohi hi hj ingrrktmk lza xmbqb,

Uj noehsowo nwpq pq pr qvozzsbus thi suiqh,

Cr ljgakawew vexy xy xz ydwhhajca bpq mnrgkgqc,

Anmmd bgzmbd.

Réponse sous la forme : CRYPTIS{*clef1_clef2_clef3*}

------

### Réalisation

------

Clair:

```
La premiere clef de ce challenge est petit,
La deuxieme clef de ce challenge est cesar,
La troisieme clef de ce challenge est optimise,
Bonne chance.
```

On va chercher à complexifier le chiffrement de césar. Pour se faire, il existe le chiffrement de césar *progressif*. Il suffit d'incrémenter la clé à chaque mot chiffré ou tous les n caractères.

Pour ce challenge, ce sera à chaque mot excepté *Bonne chance* qui possèdera la même clé.

Le site [www.dcode.fr](www.dcode.fr) propose ce fameux chiffrement ainsi que son déchiffrement.

Ce qui nous donne:

```
Mb rtgokgtg fohi hi hj ingrrktmk lza xmbqb,
Uj noehsowo nwpq pq pr qvozzsbus thi suiqh,
Cr ljgakawew vexy xy xz ydwhhajca bpq mnrgkgqc,
Anmmd bgzmbd.
```

------

### Résolution

------

Par culture générale ou à partir d'une simple recherche sur Internet, on devine que Brutus est le fils de César. On va donc tenter de force-brute le message chiffré.

La plateforme [gchq.github.io/CyberChef/](gchq.github.io/CyberChef/) propose un déchiffrement assez fluide étant donné qu'il est possible de passer d'une clé à l'autre très rapidement.

* Prendre le Rot13 du site 
* Variation de la clé de déchiffrement en observant le résultat obtenu

Dès la première clé choisi, excepté 0 et un multiple de 26, on peut voir un mot en clair. Si on incrémente la clé, le mot précédant apparait en clair et ainsi de suite.

Nous devinons donc un cesar progressif à chaque mot.

Utilisation du site www.dcode.fr afin d'utiliser le déchiffrement du César progressif.

* Texte obtenu : 

Clair obtenu:

```
La premiere clef de ce challenge est petit,
La deuxieme clef de ce challenge est cesar,
La troisieme clef de ce challenge est optimise,
Bonne chance.
```

Il suffit de concaténer les clés trouvées afin d'obtenir le flag !

`CRYPTIS{petit_cesar_optimise}`
# crypto_0100_gilbert

---

### Titre : gilbert

### Points : 100

---

### Description

---

Vous allez m'aimer.. on va s'aimer !!

⠃⠇⠼⠁⠝⠙⠎⠼⠉⠉⠗⠼⠉⠞

PS : Le flag est à entrer sous la forme CRYPTIS{message}

---

### Réalisation

---

Le but de ce challlenge est d'encoder un flag dans le langage braille.

Utilisons [www.dcode.fr/alphabet-braille](www.dcode.fr/alphabet-braille) afin d'encoder le flag `bl1nd_s3cr3t` en braille, nous obtenons alors:

```
⠃⠇⠼⠁⠝⠙⠎⠼⠉⠉⠗⠼⠉⠞
```

---

### Résolution

---

Le titre du challenge et la description nous laisseraient penser à Gilbert Montagné - On va s'aimer. La particularité de cette célébrité est qu'elle est non voyante. On pense alors au fait que les non voyants peuvent lire en utilisant ce que l'on appelle le braille.

Après une recherche pour savoir à quoi cela ressemble, on trouve une grande similitude avec notre contenu.

On utilise alors www.dcode.fr/alphabet-brailleafin afin de décoder, on obtient alors:

```
bl1nd_s3cr3t
```

`CRYPTIS{bl1nd_s3cr3t}`
# crypto_0150_aqzwe

---

### Titre : aqzwe

### Points : 150

---

### Description

---

On a trouver un message dans un vieille clé usb qui trainait :

````
VTUY¨OD{V°i^4tçF4v5m4t}
````

---

### Réalisation

---

Petit challenge ou chaque lettre est remplacé par celle qui se trouve juste à droite sur un clavier azerty.
Exemple : A=>Z , B=>N ....

Go to => [Dcode](https://www.dcode.fr/chiffre-decalage-clavier)
mettre le flag et chiffrer

---

### Résolution

------
petite recherche google avec crypto & azerty
Go to => [Dcode](https://www.dcode.fr/chiffre-decalage-clavier)
mettre le message et déchiffrer

`CRYTPIS{C0up3r_D3c4l3r}`
# crypto_0150_blaise

---

### Titre : Blaise

### Points : 150

---

### Description

---

Nous avons intercepté un fichier chiffré de la part de Blaise, on vous laisse vous en occuper.

---

### Réalisation

---

```
Bonjour,
Petit chiffrement de blaise pour s'échauffer dans ce ctf de crypto.
Dêpechez vous de rentrer le flag, et je continue d'écrire pour que l'analyse statistique soit relativement simple. Vous allez bien ?
Allé, bonne chance à vous !
CRYPTIS{blaise_forever_coeur_coeur}
```

Utilisation du site [www.dcode.fr](www.dcode.fr)  afin de chiffrer le texte avec la clé `salute` et en préservant la ponctuation :

```
Toydhyj,
Ppnbx uhtzyvwmphm hw bwubww pzok w'wcsunjxec xtrk cp wmj ve nlrtlo.
Oyiiuhpt osms oy kiftcyk pw fwuz, il jp whrliyox h'wcccki hofl jyw l'lhtpqsp mmelidnbume dibx jewummnexygx kixjei. Nofm tpdek vbif ?
Awfx, fgnyy vlsnny t zgud !
WKCHTTM{upsidy_ysjegyk_ggefl_vswuc}
```

---

### Résolution

---

Après avoir fait une brève recherche du titre du challenge sur Internet, nous constatons que Blaise est le prénom de Mr. Vigenère.

Nous avons le choix entre une attaque par clair connu avec le tag `CRYPTIS` qu'on peut remarque *WKCHTTM{upsidy_ysjegyk_ggefl_vswuc}*, une attaque par analyse statistique ou en calculant la taille de la clé par analyse de chaîne de caractères égales.

Les deux premières attaques peuvent être faites via le site [www.dcode.fr](www.dcode.fr).

* **Attaque par clair connu** : le texte clair connu n'est pas assez suffisant afin d'obtenir le résultat escompté
* **Attaque par analyse statistique** : Bingo ! Le site décrypte un texte totalement plausible en utilisant la clé *salute* :

On obtient alors le clair suivant:

```
BONJOURPETITCHIFFREMENTDEBLAISEPOURSECHAUFFERDANSCECTFDECRYPTODEPECHEZVOUSDERENTRERLEFLAGETJECONTINUEDECRIREPOURQUELANALYSESTATISTIQUESOITRELATIVEMENTSIMPLEVOUSALLEZBIENALLEBONNECHANCEAVOUSCRYPTISBLAISEFOREVERCOEURCOEUR
```

Il ne reste plus qu'à remettre la ponctuation et les minuscules à `CRYPTISBLAISEFOREVERCOEURCOEUR`:

`CRYPTIS{blaise_forever_coeur_coeur}`
# crypto_0150_square

---

### Titre : Square

### Points : 150

---

### Description

---

On commence à en voir partout des comme ça

---

### Réalisation

---

Créer un simple QRCode qui va contenir une chaine de caractères qui correspondera au flag CRYPTIS{QRC0D3_15_4_TH1NG}. Nous allons utiliser le site: [http://generator.code-qr.net/](http://generator.code-qr.net/)

---

### Résolution

---

Il y a plusieurs manières de lire un QRCode:

* utiliser un smartphone ou un décodeur de QRCode en ligne

* utiliser la librairie `zbar-tools` avec la commande `zbarimg` en ligne de commande


```bash
$ zbarimg square.png
QR-Code:CRYPTIS{QRC0D3_15_4_TH1NG}
```

`CRYPTIS{QRC0D3_15_4_TH1NG}`
# crypto_0200_in_the_title

---

### Titre : in_the_title}

### Points : 200

---

### Description

---

Lors de nos récentes recherches, nous avons retrouvé ce fichier texte chiffré. Pouvez-vous nous aider à le déchiffrer ?

---

### Réalisation

---

Le but de ce challenge est de réaliser un chiffrement par substitution. Ce dernier consiste à remplacer une lettre par une autre. Par exemple, remplacer tous les `a` d'un texte par des `r`. Ce challenge permettra aussi de présenter lors de la résolution l'outil  [quipqiup.com](https://quipqiup.com/) qui est souvent utilisé pour attaquer des textes chiffrés par substitution.

Voici notre texte de départ, dans lequel nous avons ajouté la première partie du flag:

```bash
# contenu à chiffrer
$ cat flag.txt
Sputnik is a spacecraft launched under the Soviet space program. Sputnik 1,2 and 3 were the official Soviet names of those objects, while the remaining designations in the series were not official names, but were names applied in the West, to objects whose original Soviet names may not have been known at the time. Now you know my story. The flag is: CRYPTIS{mayde_mayde_the_flag_is_
```

Présentation des fonctions importantes pour réaliser notre script de chiffrement:

```python
>>> import string
>>> string.ascii_lowercase # alphabet miniscule
'abcdefghijklmnopqrstuvwxyz'
>>> string.ascii_uppercase # alphabet majuscule
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
```

```python
# mélanger un chaine de caractères de maniére random
>>> import random
>>> chaine = 'spoutnik
>>> ''.join(random.sample(chaine, len(chaine)))
'tsnokiup'
```

```python
# subsitution sur une chaine
>>> chaine = 'bonjour tout le monde'
>>> alphabet_1 = 'bonjurtlermd'
>>> alphabet_2 = 'abcdefghijkl'
>>> transposition_tab = str.maketrans(alphabet_1, alphabet_2) # notre table de substitution
>>> chaine.translate(transposition_tab)
'abcdbej gbeg hi kbcli'
# les 'b' sont devenus des 'a'
# les 'o' sont devenus des 'b'
# les 'n' sont devenus des 'c'
# ...
```

Après ces quelques explications, voici notre script final de chiffrement:

```python
#!/usr/bin/env python3

import string
import random

# on récupére le contenu du fichier
f = open('flag.txt', 'r')
data = f.read()
f.close()

charset_classic = string.ascii_lowercase + string.ascii_uppercase
#charset_random = ''.join(random.sample(charset_classic, len(charset_classic)))
charset_random = 'tuchgyabqzjvwiedxsnmorkplf' + 'tuchgyabqzjvwiedxsnmorkplf'.upper()

transposition_tab = str.maketrans(charset_classic, charset_random)

substitution_cipher = data.translate(transposition_tab)

print(substitution_cipher)
```

La ligne `charset_random = 'tuchgyabqzjvwiedxsnmorkplf' + 'tuchgyabqzjvwiedxsnmorkplf'.upper()` permet d'avoir la même substitution pour une même lettre, qu'elle soit en minuscule, ou en majuscule. On utilise un `charset_random` statique, car sinon, ce dernier changerait à chaque exécution du script.

```bash
$ python3 ./substitution.py > flag.txt.enc
$ cat flag.txt.enc
Ndomiqj qn t ndtcgcstym vtoicbgh oihgs mbg Nerqgm ndtcg dseastw. Ndomiqj 1,2 tih 3 kgsg mbg eyyqcqtv Nerqgm itwgn ey mbeng euzgcmn, kbqvg mbg sgwtqiqia hgnqaitmqein qi mbg ngsqgn kgsg iem eyyqcqtv itwgn, uom kgsg itwgn tddvqgh qi mbg Kgnm, me euzgcmn kbeng esqaqitv Nerqgm itwgn wtl iem btrg uggi jieki tm mbg mqwg. Iek leo jiek wl nmesl. Mbg yvta qn: CSLDMQN{wtlhg_wtlhg_mbg_yvta_qn_
```

On peut maintenant ajouter le `flag.txt.enc` au challenge. La seconde partie du flag sera le titre du challenge, c'est-à-dire `in_the_title}`

---

### Résolution

---

Pour ce challenge, on se retrouve avec un fichier texte chiffré qui contient sûrement le flag. En effet, à la fin de celui-ci, on peut voir : `SLDMQN{wtlhg_wtlhg_mbg_yvta_qn_`. Cette chaîne ressemble très fortement au début du format du flag que nous recherchons : `CRYPTIS{???_???_`. Aussi le titre du challenge nous mène à penser que ce dernier correspond à la fin du flag.

```bash
$ cat flag.txt.enc
Ndomiqj qn t ndtcgcstym vtoicbgh oihgs mbg Nerqgm ndtcg dseastw. Ndomiqj 1,2 tih 3 kgsg mbg eyyqcqtv Nerqgm itwgn ey mbeng euzgcmn, kbqvg mbg sgwtqiqia hgnqaitmqein qi mbg ngsqgn kgsg iem eyyqcqtv itwgn, uom kgsg itwgn tddvqgh qi mbg Kgnm, me euzgcmn kbeng esqaqitv Nerqgm itwgn wtl iem btrg uggi jieki tm mbg mqwg. Iek leo jiek wl nmesl. Mbg yvta qn: CSLDMQN{wtlhg_wtlhg_mbg_yvta_qn_
```

On peut s'apercevoir que le chiffrement s'applique sur des lettres. Il s'agit peut-être d'un chiffrement par décalage ? Testons avec `CSLDMQN` qui doivent normalement correspondre à notre début de flag : `CRYPTIS`.

```python
>>> ord('C') - ord('C')
0
>>> ord('S') - ord('R')
1
>>> ord('L') - ord('Y')
-13
>>> ord('D') - ord('P')
-12
>>> ord('M') - ord('T')
-7
>>> ord('Q') - ord('I')
8
>>> ord('N') - ord('S')
-5
```

Cette voie n'a pas l'air d'être la bonne, il n'y a pas vraiment de lien entre tous ces décalages. Il s'agit peut-être d'un chiffrement par substitution ? Utilisons l'outil [quipqiup.com](https://quipqiup.com/) pour nous faire une petite idée.

Comme premier résultat, on obtient alors:

```text
Sp?tni? is a spacecraft la?nched ?nder the So?iet space program. Sp?tni? 1,2 and 3 were the official So?iet names of those ob?ects, while the remaining designations in the series were not official names, b?t were names applied in the West, to ob?ects whose original So?iet names may not ha?e been ?nown at the time. Now yo? ?now my story. The flag is: CRYPTIS{mayde_mayde_the_flag_is_
```

Nous avons donc le début du flag : `CRYPTIS{mayde_mayde_the_flag_is_` il ne reste plus qu'à lui concaténer le nom du challenge.

`CRYPTIS{mayde_mayde_the_flag_is_in_the_title}`
# crypto_0200_metamorphe

---

### Titre : Métamorphe

### Points : 200

---

### Description

---

Nous avons intercepté un étrange fichier, veuillez trouver son secret !

---

### Réalisation

---

Voici notre texte clair de départ:

```
Welcome in the biggest hacker contest in France.OOooooops, you want to know the flag, don't you?Here you are. CRYPTIS{I_h0p3_y0u_did_n0t_try_t0_d3crypt_on3_by_on3_4g41n_;-)} Have fun!
```

Le but va être de changer la base de chaque caractère ASCII de manière aléatoire. De plus, nous allons ajouter la `base8`, auquel peu de personne pourrait penser aux premiers abords..

On obtient alors le contenu suivant:

```
0x57 0x65 0x6c 0x63 0x6f 0x6d 1100101 040 1101001 110 0x20 0164 104 101 040 98 105 0147 0147 0145 0x73 1110100 0x20 104 0141 99 0153 101 114 040 99 0157 0156 0164 0145 0163 0164 0x20 0x69 1101110 040 70 0x72 0x61 110 0x63 0145 46 1001111 1001111 1101111 111 0x6f 0157 0157 112 115 0x2c 32 0171 1101111 0165 32 119 1100001 0156 0164 0x20 116 111 040 107 0156 1101111 0167 32 116 104 0145 32 1100110 108 97 103 0x2c 100000 100 1101111 110 047 116 32 121 0x6f 0165 0x3f 72 0x65 1110010 0145 100000 0171 1101111 0165 32 0x61 1110010 101 101110 67 0x52 0x59 0120 0x54 0x49 0x53 0x7b 1001001 95 104 060 0160 51 0x5f 121 48 117 0137 1100100 105 0144 0x5f 0156 0x30 1110100 0137 0x74 1110010 0171 1011111 0164 110000 95 1100100 110011 0x63 114 1111001 0160 116 95 1101111 110 51 95 1100010 0x79 1011111 1101111 0156 110011 0x5f 52 0147 064 49 110 0x5f 073 45 051 125 0x48 1100001 0x76 0145 100000 0x66 0165 0x6e 100001
```

Les nombres octals seront différenciés des nombres décimaux par un **0** qui précéderont leur nombre.

---

### Résolution

---

En analysant le fichier on peut reconnaître une suite de nombre en `base16`, en `base10` ainsi qu'en `binaire`.

On va donc procéder à l'écriture d'un script afin de les mettre en ASCII:

```bash
#!/usr/bin/python3

f = open("ciphertext.txt","r")
rep=""
for ligne in f:
	tab=ligne.split(" ")
	for nb in tab:
		if '0x' in nb:
			rep+=chr(int(nb.lstrip("0x"),16))
			pass
		elif len(nb)==2:
			rep+=chr(int(nb))
		elif len(nb)==3 or len(nb)==4:
			rep+=chr(int(nb))
		else:
			rep+=chr(int(nb,2))
print(rep)
```

```bash
$ python resolv.py ciphertext.txt 
Welcome(in �he(bi���st h�c�er(c������ in(Franc�.OOooo��ps, �o� wa�� to(k�o� th� flag, don/t yo�?Her� �o� are.CRYxTIS{I_h<�3_y0u�di�_�0t�tr�_�0_d3cry�t_on3_by_o�3_4�@1n_I-3}Hav� f�n!
```

Le résultat obtenu n'est pas celui escompté mais nous pouvons voir que nous sommes sur la bonne voie. Essayons alors de deviner le flag à partir du résultat précédent.

Regardons les caractères non imprimables : ils étaient, chacun d'eux, précédés d'un `0`. Nous les avons pris pour des nombres décimaux. Après une rapide recherche des tables ASCII, nous constatons que la base octale est aussi utilisée.

Modifions le code afin de tester l'hypothèse que les nombres précédés d'un 0 soient en `base8`.

```python
#!/usr/bin/python3

f = open("ciphertext.txt","r")
rep=""
for ligne in f:
	tab=ligne.split(" ")
	for nb in tab:
		if '0x' in nb:
			rep+=chr(int(nb.lstrip("0x"),16))
			pass
		elif len(nb)==2:
			rep+=chr(int(nb))
		elif len(nb)==3 and nb[0]!="0":
			rep+=chr(int(nb))
		elif len(nb)==3 and nb[0]=="0" or len(nb)==4:
			rep+=chr(int(nb,8))
		else:
			rep+=chr(int(nb,2))
print(rep)
```

```bash
$ python resolv.py ciphertext.txt 
Welcome in the biggest hacker contest in France.OOooooops, you want to know the flag, don't you?Here you are. CRYPTIS{I_h0p3_y0u_did_n0t_try_t0_d3crypt_on3_by_on3_4g41n_;-)} Have fun!
```

En effet, c'était bien de la base octal ! Il ne reste plus qu'à rentrer le flag.

`CRYPTIS{I_h0p3_y0u_did_n0t_try_t0_d3crypt_on3_by_on3_4g@1n_;-)}`

# crypto_0200_my_brain

---

### Titre : myBrain

### Points : 200

---

### Description

---

What the FUCK..

++++[++++>---<]>.>-[--->+<]>---.+++++++.---------.++++.-----------.++++++++++.-[-->+++<]>.----.+[++>---<]>-.--.-[----->+<]>++.--------------.-----.+++++++.-[--->+<]>--.+[->+++<]>+.++++++++.-[-->+<]>----.-[----->+<]>--.-------.--------.+++++++++++++.[-->+<]>--.+++[->++<]>.-------.+[-->+<]>.[->++<]>-.-[-->+<]>.>--[-->+++<]>.

---

### Réalisation

---

Le but de ce challenge est de vous faire découvrir le langage de programmation exotique `brainfuck`. Pour encoder notre flag dans ce langage nous utiliserons https://www.dcode.fr/langage-brainfuck afin d'encoder `CRYPTIS{w31rd_fuck1ng_l4ng4g3}`.

```
++++[++++>---<]>.>-[--->+<]>---.+++++++.---------.++++.-----------.++++++++++.-[-->+++<]>.----.+[++>---<]>-.--.-[----->+<]>++.--------------.-----.+++++++.-[--->+<]>--.+[->+++<]>+.++++++++.-[-->+<]>----.-[----->+<]>--.-------.--------.+++++++++++++.[-->+<]>--.+++[->++<]>.-------.+[-->+<]>.[->++<]>-.-[-->+<]>.>--[-->+++<]>.
```

---

### Résolution

---

Utilisation de https://www.dcode.fr/langage-brainfuck afin de décoder:

```
++++[++++>---<]>.>-[--->+<]>---.+++++++.---------.++++.-----------.++++++++++.-[-->+++<]>.----.+[++>---<]>-.--.-[----->+<]>++.--------------.-----.+++++++.-[--->+<]>--.+[->+++<]>+.++++++++.-[-->+<]>----.-[----->+<]>--.-------.--------.+++++++++++++.[-->+<]>--.+++[->++<]>.-------.+[-->+<]>.[->++<]>-.-[-->+<]>.>--[-->+++<]>.
```

On obtient alors le flag.

`CRYPTIS{w31rd_fuck1ng_l4ng4g3}`
# crypto_0300_divina_commedia

---

### Titre : Divina Commedia

### Points : 300

### Description

---

Que quoi ?

```
D'`%q"]!<}k3VDUTA@,ba<(:KlHGYh3%|B/@~=O^)Lrqpun4rqSRh.lNd*bg`&d]E[!_^@\UTx;:PtT6RKoONMFKDhHA@?>bBA:"8\};43876/Sts1*Non,+*#"!E%|dz@a}vuzs9qYun4Uk1onmlNMib(fH^]b[Z~^@\[ZSw:POTSLpPOH0FjW
```



### Réalisation

---

Objectif : découvrir qu'il existe des langages exotiques.
Go to => [Malbolge Tools](https://zb3.me/malbolge-tools/#generator)
Mettre le flag et le tour est joué

---

### Résolution

Une recherche google avec :

> Divina Commedia language programmation

Et on trouve le language [Malbolge](https://zb3.me/malbolge-tools/#interpreter)

`CRYPTIS{Wtf_M4lb0lg3_?}`
# crypto_0300_h

---

### Titre : H

### Points : 300

---

### Description

---

H H H H H H H H

---

### Réalisation

---

L'objectif de se challenge est d'utiliser des algorithmes de hachage. Un serveur va être dans l'attente de clients qui devront réussir un challenge afin d'obtenir le flag.

Le challenge consiste à hacher 3 chaines de caractères envoyées par le serveur en moins de 2 secondes. Les 3 chaines devront être hachées en `md5` puis en `sha-256` et `sha1`.

Voici le code du serveur qui proposera le challenge:

```python
def serv(port):

    ma_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM, socket.IPPROTO_TCP)
    ma_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR,1)
    ma_socket.bind(('', port))
    ma_socket.listen(socket.SOMAXCONN)

    surveillance = [ma_socket]
    dic={}
    while 1:
        (evnt_entree,evnt_sortie,evnt_exception) = select.select(surveillance,[],[])
        
        for un_evenement in evnt_entree:
            if (un_evenement == ma_socket):
                try:
                    # il y a une demande de connexion
                    nouvelle_connexion, depuis = ma_socket.accept()
                    print ("Nouvelle connexion depuis ", depuis)
                
                    nouvelle_connexion.sendall(b'Bienvenue, Il faut renvoyer les deux mots de passes hasher : 1er =>md5, 2e =>sha256, 3e =>sha1\n')
                    time.sleep(1)
                    nouvelle_connexion.sendall(b'format attendu : [hash1,hash2,hash3]\n')
                    
                    def m2p():
                        return ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))

                    
                    password=[m2p(),m2p(),m2p()]

                    dic[depuis[0]]=[password,time.time()]
                    nouvelle_connexion.sendall(bytes(str(password),"utf-8"))

                    surveillance.append(nouvelle_connexion)
                    continue
                except :
                    pass
                
            try:
                ligne = un_evenement.recv(1024)
                if not ligne :
                    un_evenement.close()
                    surveillance.remove(un_evenement) # le client s'est déconnecté
                else :
                    
                    hash1=hashlib.md5(dic[un_evenement.getpeername()[0]][0][0].encode()).hexdigest()
                    hash2=hashlib.sha256(dic[un_evenement.getpeername()[0]][0][1].encode()).hexdigest()
                    hash3=hashlib.sha1(dic[un_evenement.getpeername()[0]][0][2].encode()).hexdigest()
                    print(ligne.decode("utf-8","ignore"))
                    if "["+hash1+","+hash2+","+hash3+"]" == ligne.decode("utf-8","ignore") and time.time()-dic[un_evenement.getpeername()[0]][1]<2:
                        un_evenement.sendall(bytes("CRYPTIS{tr1pl3_h4sh}","utf-8"))
                        print ("A réussi => ",un_evenement.getpeername())
                    else:
                        un_evenement.sendall(bytes("Trop lent ;-) ( Faut surement scripter ...)","utf-8"))
            except Exception as e:
                print(e)
                pass

    ma_socket.close()
```

---

### Résolution

---

Pour obtenir le flag, il faut se connecter sur le serveur et répondre au challenge en moins de 2 secondes. Pour réaliser nos hachages, nou utiliserons la librairie `hashlib` de python. 

Voici un code permettant de réaliser la connexion, puis le hachage des 3 chaines et enfin l'envoi: 

```python
def client():
    sock=socket.socket(socket.AF_INET, socket.SOCK_STREAM, socket.IPPROTO_TCP)
    sock.connect(("localhost",3000))
    rep=sock.recv(1024)
    print(rep)
    rep=sock.recv(1024)
    print(rep)
    rep=sock.recv(1024)
    print(rep)

    valeurs=re.findall("'(\S+)', '(\S+)', '(\S+)'",str(rep))

    hash1=hashlib.md5(valeurs[0][0].encode()).hexdigest()
    hash2=hashlib.sha256(valeurs[0][1].encode()).hexdigest()
    hash3=hashlib.sha1(valeurs[0][2].encode()).hexdigest()
    
    print(valeurs[0])
    sock.sendall(bytes(str("["+hash1+","+hash2+","+hash3+"]"),"utf-8"))
    
    rep=sock.recv(1024) # obtenir la réponse (flag)
    print(rep)
    sock.close()
    print("End client")
```

`CRYPTIS{tr1pl3_h4sh}`


# crypto_0300_over26

---

### Titre : over26

### Points : 300

---

### Description

---

It's over 26 !!!!!

^mtkodn8N51N+!N!z/K1:

---

### Réalisation

---

L'objectif de ce challenge est de vous faire découvrir que ROT peut dépasser 25 lorsque l'on utilise l'ensemble des caractères ASCII. On utilisera [CyberChef](https://gchq.github.io/CyberChef/) pour encoder le flag `CRYPTIS{3xt3nd3d_r0t}`.

On utilisera `ROT_27(CRYPTIS{3xt3nd3d_r0t})`, ce qui nous donne:

```
^mtkodn8N51N+!N!z/K1:
```

---

### Résolution

---

* Cette suite de caractère nous fait penser à un chiffrement par décalage.
* Le titre du challenge signifie "au-delà de 26" . Peut être un décalage de 27 ?

On utilisera [CyberChef](https://gchq.github.io/CyberChef/) pour décoder `^mtkodn8N51N+!N!z/K1`: 

On retrouve dans les "recettes" ROT 47. On l'utilisera avec comme décalage -27.

On obtient alors le flag.

`CRYPTIS{3xt3nd3d_r0t}`
# crypto_0300_png

---

### Titre : PNG

### Points : 300

---

### Description

---

Nos meilleurs cryptographes ont réussi à déchiffrer le message et nous assure que c'est un fichier PNG.
Arriverez-vous à le déchiffrer aussi ?

---

### Réalisation

---

Le XOR est une méthode de chiffrement souvent utilisée en CTF, nous allons initier les participants à une des proptiétés importante de ce dernier:

```text
 # chiffrement XOR 
 10111 # message
+10001 # clé 
 -----
 00110 # chiffré
```

Si nous connaissons le chiffré ainsi que la clair d'un message chiffré par un XOR. Alors il est très facile de retrouver la clé utilisée. C'est le principe de l'attaque par clair connu. Voici la propriété qui permet cela:

```text
 # attaque par clair connu
 10111 # message
 00110 # chiffré
 -----
 10001 # clé
```

Prennons une image sur laquelle se trouve un flag, et appliquons un XOR sur tout sont contenu avec la clé `WINDOWSW`. Utilisons `CyberChef` en lui fournissant en `input` le contenu de l'image, et en choisissant XOR comme algorithme avec la clé `WINDOWSW`. Il suffit maintenant de récupérer le fichier qui est en `output`.

---

### Résolution

---

Dans l'énoncé on nous affirme que le fichier est un PNG. C'est sûrement un indice. Après une petite recherche sur Google on trouve que tous les PNG ont une entête identique. C'est premier octets correspondent au `magic number`. Ce dernier défini le type de fichier auquel nous avons à faire.

Pour les fichiers PNG, le `magic numbers` est `89 50 4E 47 0D 0A 1A 0A`ce qui correspond en ascii à la chaine `.PNG`.

Avec XOR si on connait le chiffrer et le clair alors on peut trouver la clé. Exemple :

```
 10111 # message
+10001 # clé 
 -----
 00110 # chiffré
----------------
 10111 # message
+00110 # chiffré
 -----
 10001 # clé
```

Si on XOR l'entête des PNG et l'entête de notre fichier, on retrouve la clé XOR utilisée:

```
 DE 19 00 03 42 5D 49 5D
+89 50 4E 47 0D 0A 1A 0A
 -----------------------
 57 49 4E 44 4F 57 53 57
```
Notre clé est donc `57 49 4E 44 4F 57 53 57`, convertie en ascii, nous avons le clé: `WINDOWSW`.

Utilisons maintenant CyberChef avec en input l'image et appliquant un XOR avec la clé `WINDOWSW` et récupérer l'output. On obtient alors une vraie image, avec le flag à l'intérieur.

`CRYPTIS{X0R_1M4G3_34SY}`
# crypto_0300_raptorisation

------

### Titre : Raptorisation

### Points : 300

------

### Description

------

Mon dieu... Vous avez créé des raptors ?

------

### Réalisation

------

```bash
# Générer notre priv_key.pem
$ openssl genrsa -out priv_key.pem 512
$ cat priv_key.pem 
-----BEGIN RSA PRIVATE KEY-----
MIIBXwIBAAJJAMLLsk/b+SO2Emjj8Ro4lt5FdLO6WHMMvWUpOIZOIiPu63BKF8/Q
jRa0aJGmFHR1mTnG5Jqv5/JZVUjHTB1/uNJM0VyyO0zQowIDAQABAkgyAw5Cxp1O
d95+I5exPbouUvLFeiBfWXP+1vh2MvU8+IhmCf9j+hFOK13x22JJ+Orwv1+iatW4
5It/qwUNMvxXS0RuItCLp7ECJQDM6VRX8SfElUbleEECmsavcGBMZOgoEBisu1OC
M7tX83puaJUCJQDzXLgl8AM5bxHxSaWaD+c9tDFiyzBbjr/tpcqEC+JMU2tqrlcC
JQCjGt8+GQD0o3YJVc05i4W3RBYC+RcqPJXHeFyieRcYjP/ZPnkCJQDVUULBTl8l
KuzJWcrk/metuJNJi925g6lMwHSBxoD4cm7HtkUCJFqWTOzCIODw7eoypcJYjm2O
/ohEsSjEXsg6Bh8mY3LunBaqiA==
-----END RSA PRIVATE KEY-----

# Générer notre pub_key.pem, dérivée de priv_key.pem
$ openssl rsa -in priv_key.pem -pubout -out pub_key.pem
$ cat pub_key.pem 
-----BEGIN PUBLIC KEY-----
MGQwDQYJKoZIhvcNAQEBBQADUwAwUAJJAMLLsk/b+SO2Emjj8Ro4lt5FdLO6WHMM
vWUpOIZOIiPu63BKF8/QjRa0aJGmFHR1mTnG5Jqv5/JZVUjHTB1/uNJM0VyyO0zQ
owIDAQAB
-----END PUBLIC KEY-----

# Créer notre fichier flag.txt
$ echo 'Bien joué ! CRYPTIS{rsa_factorisation_heavy}' > flag.txt

# Chiffrer notre flag.txt en flag.txt.enc avec pub_key.pem
$ openssl rsautl -encrypt -pubin -inkey pub_key.pem -in flag.txt -out ciphertext.txt

```

Pour ce challenge, nous fournirons les fichiers: `public_key.pem` et `ciphertext.txt`.

------

### Résolution

------

Ce challenge nous fournit 2 fichiers: `pub_key.pem` et `ciphertext.txt`. On comprend donc rapidement que le but sera de déchiffrer `flag.txt.enc` afin d'obtenir le flag.

Regardons rapidement le type des fichiers que l'on nous donne, ainsi que leur contenu:

```bash
$ file pub_key.pem
pub_key.pem: ASCII text
$ cat pub_key.pem
-----BEGIN PUBLIC KEY-----
MGQwDQYJKoZIhvcNAQEBBQADUwAwUAJJAMLLsk/b+SO2Emjj8Ro4lt5FdLO6WHMM
vWUpOIZOIiPu63BKF8/QjRa0aJGmFHR1mTnG5Jqv5/JZVUjHTB1/uNJM0VyyO0zQ
owIDAQAB
-----END PUBLIC KEY-----

################################################################

$ file ciphertext.txt
ciphertext.txt: data
```

On peut en conclure que c'est bien RSA qui est utilisé dans ce challenge. 

Nous allons donc maintenant utiliser `openssl` afin de voir si **n** est factorisable et ainsi trouver la clé privée.

```bash
# Extraction de N et e
$ openssl rsa -in pub_key.pem -pubin -text -modulus 
RSA Public-Key: (576 bit)
Modulus:
    00:c2:cb:b2:4f:db:f9:23:b6:12:68:e3:f1:1a:38:
    96:de:45:74:b3:ba:58:73:0c:bd:65:29:38:86:4e:
    22:23:ee:eb:70:4a:17:cf:d0:8d:16:b4:68:91:a6:
    14:74:75:99:39:c6:e4:9a:af:e7:f2:59:55:48:c7:
    4c:1d:7f:b8:d2:4c:d1:5c:b2:3b:4c:d0:a3
Exponent: 65537 (0x10001)
Modulus=C2CBB24FDBF923B61268E3F11A3896DE4574B3BA58730CBD652938864E2223EEEB704A17CFD08D16B46891A61474759939C6E49AAFE7F2595548C74C1D7FB8D24CD15CB23B4CD0A3
writing RSA key
-----BEGIN PUBLIC KEY-----
MGQwDQYJKoZIhvcNAQEBBQADUwAwUAJJAMLLsk/b+SO2Emjj8Ro4lt5FdLO6WHMM
vWUpOIZOIiPu63BKF8/QjRa0aJGmFHR1mTnG5Jqv5/JZVUjHTB1/uNJM0VyyO0zQ
owIDAQAB
-----END PUBLIC KEY-----

# RSA 576 bits a été factorisé en 2003!
# Nous obtenons e = 65537 et n en base 16

# Décodage en base10 de N
$ python -c "print int('C2CBB24FDBF923B61268E3F11A3896DE4574B3BA58730CBD652938864E2223EEEB704A17CFD08D16B46891A61474759939C6E49AAFE7F2595548C74C1D7FB8D24CD15CB23B4CD0A3', 16)"
188198812920607963838697239461650439807163563379417382700763356422988859715234665485319060606504743045317388011303396716199692321205734031879550656996221305168759307650257059
```

On peut maintenant utiliser le site `factordb` afin de factoriser N.

- Calcul de `p` et `q` sur factordb
  - `p = 398075086424064937397125500550386491199064362342526708406385189575946388957261768583317`
  - `q = 472772146107435302536223071973048224632914695302097116459852171130520711256363590397527`
- `Rsatool.py` : calcul de `d` à partir des arguments donnés et recrée, ainsi, la clef privée

```bash
$ python rsatool.py -p 398075086424064937397125500550386491199064362342526708406385189575946388957261768583317 -q 472772146107435302536223071973048224632914695302097116459852171130520711256363590397527 -n 188198812920607963838697239461650439807163563379417382700763356422988859715234665485319060606504743045317388011303396716199692321205734031879550656996221305168759307650257059 -e 65537 -o private_key.pem

Using (p, q) to initialise RSA instance

n =
c2cbb24fdbf923b61268e3f11a3896de4574b3ba58730cbd652938864e2223eeeb704a17cfd08d16
b46891a61474759939c6e49aafe7f2595548c74c1d7fb8d24cd15cb23b4cd0a3

e = 65537 (0x10001)

d =
32030e42c69d4e77de7e2397b13dba2e52f2c57a205f5973fed6f87632f53cf8886609ff63fa114e
2b5df1db6249f8eaf0bf5fa26ad5b8e48b7fab050d32fc574b446e22d08ba7b1

p =
cce95457f127c49546e57841029ac6af70604c64e8281018acbb538233bb57f37a6e6895

q =
f35cb825f003396f11f149a59a0fe73db43162cb305b8ebfeda5ca840be24c536b6aae57

Saving PEM as private_key.pem

$ cat private_key.pem 
-----BEGIN RSA PRIVATE KEY-----
MIIBXwIBAAJJAMLLsk/b+SO2Emjj8Ro4lt5FdLO6WHMMvWUpOIZOIiPu63BKF8/QjRa0aJGmFHR1
mTnG5Jqv5/JZVUjHTB1/uNJM0VyyO0zQowIDAQABAkgyAw5Cxp1Od95+I5exPbouUvLFeiBfWXP+
1vh2MvU8+IhmCf9j+hFOK13x22JJ+Orwv1+iatW45It/qwUNMvxXS0RuItCLp7ECJQDM6VRX8SfE
lUbleEECmsavcGBMZOgoEBisu1OCM7tX83puaJUCJQDzXLgl8AM5bxHxSaWaD+c9tDFiyzBbjr/t
pcqEC+JMU2tqrlcCJQCjGt8+GQD0o3YJVc05i4W3RBYC+RcqPJXHeFyieRcYjP/ZPnkCJQDVUULB
Tl8lKuzJWcrk/metuJNJi925g6lMwHSBxoD4cm7HtkUCJFqWTOzCIODw7eoypcJYjm2O/ohEsSjE
Xsg6Bh8mY3LunBaqiA==
-----END RSA PRIVATE KEY-----
```

Il existe une méthode de factorisation plus rapide grâce à l'outil `RsaCtfTool.py`:

```bash 
# Le script va calculer la clé privée à partir de la clé publique
$ python RsaCtfTool/RsaCtfTool.py --publickey ./pubkey.pem --private > private_key.pem
$ cat private_key.pem
-----BEGIN RSA PRIVATE KEY-----
MIIBXwIBAAJJAMLLsk/b+SO2Emjj8Ro4lt5FdLO6WHMMvWUpOIZOIiPu63BKF8/Q
jRa0aJGmFHR1mTnG5Jqv5/JZVUjHTB1/uNJM0VyyO0zQowIDAQABAkgyAw5Cxp1O
d95+I5exPbouUvLFeiBfWXP+1vh2MvU8+IhmCf9j+hFOK13x22JJ+Orwv1+iatW4
5It/qwUNMvxXS0RuItCLp7ECJQDM6VRX8SfElUbleEECmsavcGBMZOgoEBisu1OC
M7tX83puaJUCJQDzXLgl8AM5bxHxSaWaD+c9tDFiyzBbjr/tpcqEC+JMU2tqrlcC
JQCjGt8+GQD0o3YJVc05i4W3RBYC+RcqPJXHeFyieRcYjP/ZPnkCJQDVUULBTl8l
KuzJWcrk/metuJNJi925g6lMwHSBxoD4cm7HtkUCJFqWTOzCIODw7eoypcJYjm2O
/ohEsSjEXsg6Bh8mY3LunBaqiA==
-----END RSA PRIVATE KEY-----

# Déchiffrement
$ openssl rsautl -decrypt -in ciphertext.txt -out plaintext.txt -inkey private_key.pem
$ cat plaintext.txt
Bien joué ! CRYPTIS{rsa_factorisation_heavy}
```

De plus, si obtenir la clé privée ne vous intéresse pas, que vous souhaitez seulement obtenir le texte clair, vous pouvez directement implémenter cette commande.

Bien sûr, elle ne marche que si la factorisation de la clé publique est réussie.

```bash
# Le script calcule la clé privée et l'applique sur le texte chiffré
$ python RsaCtfTool.py --publickey ./pub_key.pem --uncipherfile ./ciphertext.txt 
[+] Clear text : ��')�2�A�zdX���|�fH�MBien joué ! CRYPTIS{rsa_factorisation_heavy}
```

`CRYPTIS{rsa_factorisation_heavy}`
# crypto_0400_boing

---

### Titre : Boing

### Points : 400

---

### Description

---

Bon courage!

---

### Réalisation

---

L'objectif de ce challenge est de montrer que le changement de base n'est pas un moyen de hachage. Pour cela, nous allons utiliser trois bases : la  `base32`, `base64` et la `base85`.

```python
#!/usr/bin/env python3

def chiffrement():
    flag="CRYPTIS{B4s3_1s_n0t_s3cur3}"
    def encode(msg): # on encode avec une base choisis en random
        msg=msg.encode('utf-8')
        i=random.randint(0,3)
        if i==0:
            msg=base64.b85encode(msg)
        elif i==1:
            msg=base64.b64encode(msg)
        elif i==2:
            msg=base64.b32encode(msg)
        return msg.decode('utf-8')

    msg=flag
    for i in range(0,47): # on va encoder 47 fois 
        msg=encode(msg)

    msg=base64.b32encode(msg.encode('utf-8')).decode('utf-8') # et puis une fois en base 32
    msg=base64.b85encode(msg.encode('utf-8')).decode('utf-8') # une autre fois en base 85
    msg=base64.b64encode(msg.encode('utf-8')).decode('utf-8') # et pour finir par la base 64

    return msg

chiffrement()
```

---

### Résolution

---

Lorsque que l'on décode la `base64` on a encore un string (énorme) et qui ressemble à de la `base64`, mais ça n'en n'est pas, car il y a des caractères qui ne font pas partit de la `base64`:

> "OGQ;xK~zFXOGZ;hO*BhOOG->tGBiX+OGQ*jPf$ZdOGQ*jO

Par exemple, le caractère `{` n'en fait pas parti. Après un peu de recherche on apprend l'existance de la `base85` qui parait être intéressante. Mais lorsque l'on décode une seconde fois, on se retrouve avec une nouvelle base : la `base32`.

Maintenant, il nous reste plus qu'à identifier quel type de base est utilisée dans le message et de décoder tant que nous n'avons pas le flag.

```python
#!/usr/bin/env python3

# Alphabet b85
# 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcedfghijklmnopqrstuvwxyz!#$%&()*+-;<=>?@^_`{|}~

# Alphabet b64
# 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcedfghijklmnopqrstuvwxyz+/=

# Alphabet b32
# ABCDEFGHIJKLMNOPQRSTUVWXYZ234567=

def dechiffrement():
    def decode(message):
        b85=False
        for c in "!#$%&()*-;<>?@^_`{|}~":
            if c in str(message):
                b85=True
                break
        if b85:#b85
            print("b85")
            message=base64.b85decode(message)
        else:
            b64=False
            for c in "abcedfghijklmnopqrstuvwxyz+/":
                if c in str(message):
                    b64=True
                    break;
            if b64:#b64
                print("b64")
                message=base64.b64decode(message)
            else:#b32
                print("b32")
                message=base64.b32decode(message)
        return message.decode('utf-8')

    f=open("cipher","r")
    msg=f.read().rstrip("\n").encode('utf-8')
    while "CRYPTIS" not in str(msg):
        msg=decode(msg)
    return msg
```

`CRYPTIS{B4s3_1s_n0t_s3cur3}`
# crypto_0400_brutor

---

### Titre : Brutor

### Points : 400

---

### Description

---

Deux cent cinquante-six

---

### Réalisation

---

Le but de ce challenge est d'initier les participants à l'attaque par dictionnaire. On chiffre un fichier contenant le flag. La commande `openssl` permet de chiffrer un fichier. En l'occurence, on va chercher à chiffrer en utilisant l'algorithme `AES-256-CBC`:

```bash
$ openssl enc -e -aes-256-cbc -in fichier -out advanced_encrypt -pass pass:pineapple
# -enc -e -aes-256-cbc: chiffrement souhaité
# -in fichier: fichier à chiffrer
# -out advanced_encrypt: fichier de sortie (chiffré)
# -pass pass:pineapple:  chiffrer avec le mot de passe "pineapple"
```

On obtient alors le fichier `advanced_encrypt` encodé avec `AES-256-CBC` et le mot de passe `pineapple`.

---

### Résolution

---

On obtient un fichier. On veut vérifier son type avec la commande `file`:

```bash
$ file advanced_encrypt
openssl enc'd data with salted password
```

Avec l'indication `advanced_encrypt` et le fait qu'il s'agisse d'un encodage avec `openssl`, on déduit depuis la description qu'il doit probablement s'agir d'un chiffrement AES-256-CBC.

On décide de faire un script python pour brute-force le mot de passe à l'aide de la wordlist `rockyou.txt` qui contient une grande liste de mot de passe (ceux les plus utilisés comme `azerty` ou `123456`). Cette wordlist nous permettra d'essayer cette multitude de mot de passe.

```python
# coding: utf-8
import subprocess

password = ""
stop = False

f = open("rockyou.txt","rb") 		# On ouvre rockyou.txt
for l in f: 										# Pour chaque mot dans rockyou
	if stop : 										# Si stop == True
		break 											# On arrête la boucle
	try:
    # On crée la commande pour décoder le fichier advanced_encrypt avec le mot de passe sélectionné 
    # On rajoute decode("utf-8") parce que la lecture est en binaire
    # Et on rajotue .rstrip("\n") pour supprimer le retour à la ligne après l
		bashCommand = "openssl enc -d -aes-256-cbc -in advanced_encrypt -out fichier -pass pass:"+l.decode("utf-8").rstrip("\n") 
    # On exécute la commande
		process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE,stderr=subprocess.PIPE)
		output, error = process.communicate()
    # On ouvre le fichier résultant de la commande
		d = open("fichier","r")
    # Pour chaque ligne dans le fichier
		for k in d :
      # Si on trouve le début du flag CRYPTIS
			if "CRYPTIS" in k :
        # On l'affiche et on met stop = True pour arrêter le programme
				print(k)
				stop = True
	except:
    # En cas d'erreur on continue simplement l'exécution du programme
		continue
```

`CRYPTIS{435_15_345Y}`
# crypto_0400_rsa_server

---

### Titre : RSA server

### Points : 400

---

### Description

---

Connectez-vous sur  `nc 10.10.10.10 6688`, et répondez à toutes les questions afin d'obtenir le graal :)

---

### Réalisation

---

Le but de ce challenge est d'améliorer la compréhension de l'algorithme RSA. Ce challenge sera composé d'un serveur avec lequel il faudra discuter afin d'obtenir le `flag`. Cette discussion sera sous la forme de questions/réponses. Le but étant d'avoir toutes les bonnes réponses afin d'arriver sur la dernière question qui va indiquer comment avoir le flag. Les questions porteront sur des principes clés de RSA (sans jeu de mots): nombre premier, calculs de produits, ou d'inverse,….

Voici le code du serveur avec lequel il faudra discuter afin d'obtenir le flag. Il est composé de plusieurs questions, par exemple, on donne `p` et `q`, pour commencer il faudra dire si oui ou non les valeurs sont possibles, c'est-à-dire si `p`et `q`sont des nombres premiers.

```python
#!/usr/bin/env python3

### Question 1 ###
q1_p = b'p=28423083049\n\n' # prime
q1_q = b'q=28423083050\n\n' # not prime

q1_poss = b'no\n'

### Question 2 ###
q2_p = b'p=94603\n\n' # prime
q2_q = b'q=93187\n\n' # prime

q2_poss = b'yes\n'
q2_n = b'8815769761\n'

### Question 3 ###
q3_p = b'p=81203\n\n' # prime
q3_n = b'n=6315400919\n\n'

q3_poss = b'yes\n'
q3_q = b'77773\n'

### Question 4 ###
q4_p = b'p=97846775312392801037224396977012615848433199640105786119757047098757998273009741128821931277074555731813289423891389911801250326299324018557072727051765547115514791337578758859803890173153277252326496062476389498019821358465433398338364421624871010292162533041884897182597065662521825095949253625730631876637\n\n' # prime
q4_q = b'q=92092076805892533739724722602668675840671093008520241548191914215399824020372076186460768206814914423802230398410980218741906960527104568970225804374404612617736579286959865287226538692911376507934256844456333236362669879347073756238894784951597211105734179388300051579994253565459304743059533646753003894560\n\n' # not prime

q4_poss = b'no\n'

### Question 5 ###
q5_p = b'p=97846775312392801037224396977012615848433199640105786119757047098757998273009741128821931277074555731813289423891389911801250326299324018557072727051765547115514791337578758859803890173153277252326496062476389498019821358465433398338364421624871010292162533041884897182597065662521825095949253625730631876637\n\n' # prime
q5_q = b'q=92092076805892533739724722602668675840671093008520241548191914215399824020372076186460768206814914423802230398410980218741906960527104568970225804374404612617736579286959865287226538692911376507934256844456333236362669879347073756238894784951597211105734179388300051579994253565459304743059533646753003894559\n\n' # prime

q5_poss = b'yes\n'
q5_n = b'9010912747277787249738727439840427055736519196538871349093408340706668231808840540195374015916168031416186859836416053338250477003776576736854137538279810042409758765948034443613881324504120707334213544491046703922409406729564516371394804946909037646047891880347940067132730874804943893719672960932378043325067514786209219718314429979032869544980643978919561908707109629612202311323626173343456843249212057093980583352634168733656443959925428846968193413110401346035535595817965624054783296380268863401241570313602685481219583686719199499297832165308522137209299081956650614940546284136240753995440003473611843518083\n'

### Question 6 ###
q6_p = b'p=97846775312392801037224396977012615848433199640105786119757047098757998273009741128821931277074555731813289423891389911801250326299324018557072727051765547115514791337578758859803890173153277252326496062476389498019821358465433398338364421624871010292162533041884897182597065662521825095949253625730631876637\n\n'
q6_q = b'q=92092076805892533739724722602668675840671093008520241548191914215399824020372076186460768206814914423802230398410980218741906960527104568970225804374404612617736579286959865287226538692911376507934256844456333236362669879347073756238894784951597211105734179388300051579994253565459304743059533646753003894559\n\n'
q6_e = b'e=65537\n\n'

q6_poss = b'yes\n'
q6_d = b'1405046269503207469140791548403639533127416416214210694972085079171787580463776820425965898174272870486015739516125786182821637006600742140682552321645503743280670839819078749092730110549881891271317396450158021688253989767145578723458252769465545504142139663476747479225923933192421405464414574786272963741656223941750084051228611576708609346787101088759062724389874160693008783334605903142528824559223515203978707969795087506678894006628296743079886244349469131831225757926844843554897638786146036869572653204735650843186722732736888918789379054050122205253165705085538743651258400390580971043144644984654914856729\n'

### Question 7 ###
q7_p = b'p=97846775312392801037224396977012615848433199640105786119757047098757998273009741128821931277074555731813289423891389911801250326299324018557072727051765547115514791337578758859803890173153277252326496062476389498019821358465433398338364421624871010292162533041884897182597065662521825095949253625730631876637\n\n'
q7_n = b'n=9010912747277787249738727439840427055736519196538871349093408340706668231808840540195374015916168031416186859836416053338250477003776576736854137538279810042409758765948034443613881324504120707334213544491046703922409406729564516371394804946909037646047891880347940067132730874804943893719672960932378043325067514786209219718314429979032869544980643978919561908707109629612202311323626173343456843249212057093980583352634168733656443959925428846968193413110401346035535595817965624054783296380268863401241570313602685481219583686719199499297832165308522137209299081956650614940546284136240753995440003473611843518083\n\n'
q7_e = b'e=65537\n\n'
q7_cipher = b'cipher=8434260773219247080449092258807570659425382119782765782445135163671240539934208578183717702012873111940818345280035950268637501669888888931702482678416634136676477907871501325631573372152841674165213077625100917976146135244213652745342091597478784514048600307936993232027723622225090781657348745776499453911361208412550372382043915409846147359322099140077294278092862410546772717584674453672517524114847220496777052809936576362799231364786071356281525928955850130890663335120948203155635358201934527397238590124239967992629439400267802801057019391725930869029713104527166774276057070627903454133576283846132724013518\n\n'

q7_poss = b'yes\n'
q7_plaintext = b'561711819220594430501559128455193300454533528677678378623972820270701707964868669587814742047101\n'

bad = b'\nBad answer :( Let\'s retry\n'

import socket, os, sys

access_mask = '' # filtre les clients, ici aucun n'est filtre
server_port = 6688

my_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM, socket.IPPROTO_TCP)

# be able to re-use the port faslty
my_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

my_sock.bind((access_mask, server_port))

# configure the queue
my_sock.listen(socket.SOMAXCONN)

def treate_client(pid, cli_sock, tsap_cli):
    print ("New connection from: ", tsap_cli)
    try:
        # q1
        cli_sock.send(b'\n########## Question 1 ##########\n')
        cli_sock.send(q1_p)
        cli_sock.send(q1_q)
        cli_sock.send(b'Is it possible ? (yes/no) -> ')
        if cli_sock.recv(1024) != q1_poss:
            cli_sock.send(bad)
            exit(1)

        # q2
        cli_sock.send(b'\n########## Question 2 ##########\n')
        cli_sock.send(q2_p)
        cli_sock.send(q2_q)
        cli_sock.send(b'Is it possible ? (yes/no) -> ')
        if cli_sock.recv(1024) != q2_poss:
            cli_sock.send(bad)
            exit(1)
        cli_sock.send(b'Value of \'n\' ? -> ')
        if cli_sock.recv(1024) != q2_n:
            cli_sock.send(bad)
            exit(1)

        # q3
        cli_sock.send(b'\n########## Question 3 ##########\n')
        cli_sock.send(q3_p)
        cli_sock.send(q3_n)
        cli_sock.send(b'Is it possible ? (yes/no) -> ')
        if cli_sock.recv(1024) != q3_poss:
            cli_sock.send(bad)
            exit(1)
        cli_sock.send(b'Value of \'q\' ? -> ')
        if cli_sock.recv(1024) != q3_q:
            cli_sock.send(bad)
            exit(1)

        # q4
        cli_sock.send(b'\n########## Question 4 ##########\n')
        cli_sock.send(q4_p)
        cli_sock.send(q4_q)
        cli_sock.send(b'Is it possible ? (yes/no) -> ')
        if cli_sock.recv(1024) != q4_poss:
            cli_sock.send(bad)
            exit(1)

        # q5
        cli_sock.send(b'\n########## Question 5 ##########\n')
        cli_sock.send(q5_p)
        cli_sock.send(q5_q)
        cli_sock.send(b'Is it possible ? (yes/no) -> ')
        if cli_sock.recv(1024) != q5_poss:
            cli_sock.send(bad)
            exit(1)
        cli_sock.send(b'Value of \'n\' ? -> ')
        if cli_sock.recv(1024) != q5_n:
            cli_sock.send(bad)
            exit(1)

        # q6
        cli_sock.send(b'\n########## Question 6 ##########\n')
        cli_sock.send(q6_p)
        cli_sock.send(q6_q)
        cli_sock.send(q6_e)
        cli_sock.send(b'Is it possible ? (yes/no) -> ')
        if cli_sock.recv(1024) != q6_poss:
            cli_sock.send(bad)
            exit(1)
        cli_sock.send(b'Value of \'d\' ? -> ')
        if cli_sock.recv(1024) != q6_d:
            cli_sock.send(bad)
            exit(1)
        
        # q7
        cli_sock.send(b'\n########## Question 7 ##########\n')
        cli_sock.send(q7_p)
        cli_sock.send(q7_n)
        cli_sock.send(q7_e)
        cli_sock.send(q7_cipher)
        cli_sock.send(b'Is it possible ? (yes/no) -> ')
        if cli_sock.recv(1024) != q7_poss:
            cli_sock.send(bad)
            exit(1)
        cli_sock.send(b'Send the value of \'plaintext\' ? -> ')
        if cli_sock.recv(1024) != q7_plaintext:
            cli_sock.send(bad)
            exit(1)
        
        cli_sock.send(b'\n########## Congratulation ##########\n')
        cli_sock.send(b'Convert the plaintext to hex, then to ascii to get the flag :)')
        
        print ("Flag found by: ", tsap_cli)
    except (ConnectionResetError, BrokenPipeError):
        pass
    finally:
        print('Deconnection from: ', tsap_cli)
        cli_sock.close()


def main():
    while 1:
        (cli_sock, tsap_cli) = my_sock.accept()
        pid = os.fork()
        if not pid:
            treate_client(pid, cli_sock, tsap_cli)
    my_sock.close()

main()

```

---

### Résolution

---

En se connectant avec `netcat`avec sur `10.10.10.10`sur le port `6688` on obtient ce message:

```bash
$ nc 10.10.10.10 6688

########## Question 1 ##########
p=28423083049

q=28423083050

Is it possible ? (yes/no) -> 
```

On doit répondre par `yes` ou `no` à  la question posée. Pour cela, on va utiliser le code python suivant qui fait toutes les étapes de RSA facilement:

```python
#!/usr/bin/env python3
from Crypto.Util.number import inverse

### encrypt with public key (n=3233,e=17)
message = 97
p = 61 # secret
q = 53 # secret

n = p*q
phi = (p-1)*(q-1)
e = 17

ciphertext = pow(message, e, n) # 2790

### decrypt
p = 61
n = 3233
e = 17
ciphertext = 1632

q = n//p
phi = (p-1)*(q-1)
d = inverse(e, phi)
message = pow(ciphertext, d, n)
```

Pour la premiére question, il faut s'assurer tout d'abord que `p`et `q`sont des nombres premiers. Pour cela, on peut utiliser [http://factordb.com/](http://factordb.com/). On apprend que ces derniers ne sont donc pas premiers car ils ont des diviseurs en plus de 1 et eux-mêmes. Il faut donc répondre `no` à cette première question.

Question suivante:

```bash
$ nc 127.0.0.1 6688

########## Question 1 ##########
p=28423083049

q=28423083050

It is possible ? (yes/no) -> no

########## Question 2 ##########
p=94603

q=93187

It is possible ? (yes/no) ->
```

On a de nouvelles valeurs pour `p`et `q`, ces derniers sont bien premiers, il faudra donc répondre `yes`.

```bash
########## Question 2 ##########
p=94603

q=93187

It is possible ? (yes/no) -> yes
Value of 'n' ? ->
```

Cette fois il faudra renvoyer la valeur de `n` qui est le produit de `p`et `q`. On va directement utiliser l'interpréteur python, pour cela:

```bash
$ python3
>>> p = 94603
>>> q = 93187
>>> p * q
>>> 8815769761
```

Il faudra donc renvoyer `8815769761` afin de passer à la question suivante.

Les questions suivantes sont similaires...

Sur la question 7, le `plaintext` doit être passé en `hex`puis en `ascci`.

```bash
$ python3
>>> import binascii
>>> plaintext = 561711819220594430501559128455193300454533528677678378623972820270701707964868669587814742047101
>>> binascii.unhexlify(hex(plaintext)[2:])
b'CRYPTIS{rsa_sp3cialist_since_26/03/2019}'
>>> # [2:] pour retirer le '0x'
```

`CRYPTIS{rsa_sp3cialist_since_26/03/2019}`
# crypto_0500_inutile_v3

---

### Titre : Inutile V3

### Points : 500

---

### Description

---

Il paraît que le mot de passe est en 3 parties.

Quelque chose de type : `partie1_partie2_partie3`

---

### Réalisation

---

Utilisation de `CyberChef` et `Dcode` pour la réalisation des étapes suivantes : 

- base32 (  Pensez à boire 1,5 litres d’eau parce que déjà c’est bon pour la santé, et ensuite l’eau on adore ça, dans 20 ou 30 ans y en aura plus ) 
- base32 ( base32 ( Les maths c’est nul, 2 fois 32 ça fait pas 64 ) )
- base 64( Les maths c’est nul, 2 fois 32 ça fait pas 64 )
- base64 ( Vous avez vu ? Ça a bien fait deux chaînes de caractères différentes. Sinon, la première partie du flag est dessous, comme 10 ou 58 sont en dessous de 64  )
- base58 ( Maintenant qu’on en a terminé avec les BASES (mdr je suis trop drôle), voilà la première partie : CRYPTIS{ , déçu ?  )



- Binaire ( Nos experts aiment jouer au Takuzu. C’est comme le Sudoku pour les nuls. D’ailleurs nos experts sont huit dans sa tête…  )
- Octale ( Sinon Les Huit Salopards c’était un bon film… Autant que les Top 10 sur YouPub )
- Décimal ( Félicitations, vous avez terminé la version. La fin du flag est : } . De rien. )
- Hexadécimal ( Trop facile l’hexadécimal donc si vous avez commencé par ça… Dommage parce que la solution n’est pas ici. )



- Cesar ( C’est assez facile le César. Si je vous dis chiffrement par substitution simple pour l’alphabet hébreux, vous pensez à quoi ? )
- Atbash ( La solution du chiffrement en dessous c’est la réponse à la question sur la vie, l’univers, le reste. ) 
- ROT 42 ( La vraie première partie du flag est : M4DN355 ) 



- Brainfuck ( Du déjà vu, en plus c’était aussi mon challenge. Paraît que les Francs Maçons ont bâti Pig Ben..? Ken..? Pen..? Je ne sais plus. )
- Pig Pen ( Il ne vous a pas manqué, il est de retour : le phoque ! )
- Morse ( C’est vraiment un code chinois dessous.  )
- Code chinois ( La deuxième partie du flag est : M4D3 )



- Langage des Signes ( J’ai jamais regardé Star Trek )
- Klingon ( Sûrement mon gnomique d’esclave qui a encore dessiné sans mon accord )
- Gnomique ( La dernière partie du flag est : TH15_CH4LL3NG3 )



Pour le Pig Pen, Code chinois, Langage des Signes, Klingon et Gnomique, le rendu a été fait sous forme d'image, mises chacune dans une archive respective protégée par un mot de passe (exception pour Langage des Signes qui n'a pas été mise dans une archive).

---

### Résolution

---

Après avoir récupéré tous les fichiers, on se retrouve avec `indications.txt`. Lorsqu'on l'ouvre, on peut remarquer plusieurs chaînes de caractères. La première, consitutée de lettres majuscules et de lettres peut faire penser à une `base32` ou `base64`.

Après avoir essayé la `base32`, on se retrouve avec 

```
Pensez à boire 1,5 litres d’eau parce que déjà c’est bon pour la santé, et ensuite l’eau on adore ça, dans 20 ou 30 ans y en aura plus
```

Rien de bien utile.

La suivante est du même genre. Ce n'est ni une `base32` ni une `base64`. 

Cependant, après avoir passé une première fois une `base32`, on remarque qu'on se retrouve toujours avec une chaîne de caractères avec des lettres majuscules et des chiffres.

Après avoir essayé une seconde `base32`, on obtient: 

```
Les maths c’est nul, 2 fois 32 ça fait pas 64
```

Toujours rien d'utilisable pour le flag..

La troisième chaîne est, elle, encodée dans une `base64`:

```
Les maths c’est nul, 2 fois 32 ça fait pas 64
```

De même pour la quatrième:

```
Vous avez vu ? Ça a bien fait deux chaînes de caractères différentes. Sinon, la première partie du flag est dessous, comme 10 ou 58 sont en dessous de 64
```

On nous parle de 10 et 58. Après quelques recherches, on découvre que la base 58 existe.

La chaîne en dessous est d'ailleurs encodée dans cette base:

```
Maintenant qu’on en a terminé avec les BASES ( mdr je suis trop drôle ), voilà la première partie : CRYPTIS{ , déçu ?
```

On tourne en rond pour le moment.. passons à la suite. 

Il s'agit dans l'ordre, comme on peut le remarquer, de chaînes encodées respectivement en binaire, octal, décimal et hexadécimal. Le résultat est celui ci dessous:

```
- Nos experts aiment jouer au Takuzu. C’est comme le Sudoku pour les nuls. D’ailleurs nos experts sont huit dans sa tête…  )
- Sinon Les Huit Salopards c’était un bon film… Autant que les Top 10 sur YouPub
- Félicitations, vous avez terminé la version. La fin du flag est : } . De rien. 
- Trop facile l’hexadécimal donc si vous avez commencé par ça… Dommage parce que la solution n’est pas ici. 
```

Toujours rien. 

La suite est légèrement différente.

Le début de la chaîne est:

```
F’hvw
```

Or on sait que `F = E` en César, et en plus `'` n'est pas chiffré par César.

On tente alors au hasard de le déchiffrer avec cette méthode.

```
C’est assez facile le César. Si je vous dis chiffrement par substitution simple pour l’alphabet hébreux, vous pensez à quoi ?
```

Notre ami Google nous apprend que cette méthode de chiffrement pourrait être l'Atbash.

La phrase du dessous donne alors:

```
La solution du chiffrement en dessous c’est la réponse à la question sur la vie, l’univers, le reste.
```

Notre culture générale nous rappelle que cette réponse est 42.

Qu'apporterait 42 à un chiffrement.. Mais oui ! Un `ROT` !

```
La vraie première partie du flag est : M4DN355
```

Enfin !

La suite est connue : du `brainfuck` 

```
Du déjà vu, en plus c’était aussi mon challenge. Paraît que les Francs Maçons ont bâti Pig Ben..? Ken..? Pen..? Je ne sais plus.
```

Google nous sauve encore une fois : Pig Pen. 

C'est aussi le mot de passe pour unzip la première archive : `PigPen`

Avec `Dcode` on peut retrouver le message suivant  

```
Il ne vous a pas manqué, il est de retour : le phoque !
```

Le phoque..? Ah mais oui. 

En regardant la phrase en dessous, ça nous rappelle le `morse` !

```
C’est vraiment un code chinois dessous
```

Là encore, le mot de passe de l'archive 2 nous est donné : `codechinois`

Toujours en utilisant `Dcode`:

```
La deuxième partie du flag est : M4D3 
```

On touche au but !

La troisième archive n'était pas protégée par un mot de passe.

En y regardant de plus près on retrouve le langage des signes français.

```
J’ai jamais regardé Star Trek
```

Le mot de passe de l'archive 4 serait `Star_Trek` ? 

Bingo !

On se retrouve avec des signes un peu étranges.

Google, toujours présent, nous rappelle que dans Star Trek, la langue utilisée est le `Klingon` !

Dcode, avec sa variété de chiffrement différent, en propose le déchiffrement

```
Sûrement mon gnomique d’esclave qui a encore dessiné sans mon accord
```

En accord avec les indications.. Le mot de passe serait gnomique ? 

Et oui !

La dernière phrase est donc : 

La dernière partie du flag est : `THIS_CHALLENGE`

En replaçant I, S A et E on retrouve le flag : `TH15_CH4LL3NG3`

`CRYPTIS{M4DN355_M4D3_TH1S_CH4LL3NG3}`
