---
layout: post
title: "EVENT_01 - Writeups"
categories: Events
excerpt_separator:  <!--more-->
---
<!--more-->

### Date : 29/01/2019 - 18h
### Présentation : <a href="https://slides.com/adelalm/event_01" target="_blank">disponible ici</a>

# crypto_0099_inutile

------

### Titre : Inutile

### Points : 99

------

### Description

------

Ceci ne vous apprendra rien. Décodez ce qui suit :

333333555555333333999999fffff55555544444441111119999994444444fffff999999eeeeee55555554444444999999cccccc555555

Veuillez entrer la réponse sous la forme : CRYPTIS{chaine}.

------

### Réalisation

------

On commence par transformer la chaîne de caractères "ceci_etait_inutile" en hexadécimal. 

```bash
$ echo -n "ceci_etait_inutile" | hexdump -e '32/1 "%02x " '
63 65 63 69 5f 65 74 61 69 74 5f 69 6e 75 74 69 6c 65
```

On met ensuite au point un script permettant d'avoir cette chaîne de caractère en hexadécimal pour obtenir une suite de 6 '3' ( 333333 ) à la place de 63.

```python
message = '636563695f65746169745f696e7574696c65'
chiffre = ''
for i in range(0,len(message),2):
	nb = int(message[i])
	for j in range(0,nb):
		chiffre = chiffre + message[i+1]
print(chiffre)
```

------

### Résolution

------

La description du challenge nous donne une chaine de caractères.  

Si on y regarde de plus près, on peut voir qu'il s'agit de chiffres et de lettres compris entre a et f ainsi que 1 et 9. Cela ressemble de l'hexadécimal de loin. 

Essayons de voir comment on pourrait arranger cela.

On peut compter une série de 3. Il y en a 6. De même, il y a ensuite une série de 6 '5'. 63 et 65 étant de l'hexadécimal on décide de voir ce que cela pourrait donner, et on retrouve 'c' et 'e' dans la table ASCII.

On va donc élaborer un petit script permettant de compter le nombre de répétitions de chaque caractère.

```python
chiffre = '333333555555333333999999fffff55555544444441111119999994444444fffff999999eeeeee55555554444444999999cccccc555555'
i = 0
liste = []
while i < len(chiffre)-1:
	k = chiffre[i]
	nb = 1
	while k == chiffre[i+1]:
		i = i + 1
		nb = nb + 1
		if i == len(chiffre)-1:
			break
	liste.append(nb)
	liste.append(k)
	i = i + 1

for element in liste:
	print(element,end="")
print()
```

```bash
$ echo 636563695f65746169745f696e7574696c65 | xxd -r -p
```

Grâce à cette ligne de commande, on peut convertir de l'hexadécimal en ASCII. 

On retourve alors la chaîne "ceci_etait_inutile".

`CRYPTIS{ceci_etait_inutile}` 

# crypto_0100_brutus

------

### Titre : Brutus

### Points : 100

------

### Description

------

Nous avons un mot de passe chiffré : edvlf.

Veuillez entrer la réponse sous la forme : `CRYPTIS{*le mot de passe en clair*}`

------

### Réalisation

------

- Le **chiffrement par décalage**, aussi connu comme le **chiffre de César**, est une méthode de chiffrement très simple utilisée durant l'époque Romaine.

  Le texte chiffré s'obtient en remplaçant chaque lettre du texte clair 
  original par une lettre à distance fixe, toujours du même côté, dans 
  l'ordre de l'alphabet.

- Script python décalant de 3 les caractères de la chaîne mise en paramètre dans le sens de l'alphabet : chiffrement de César.

```python
#!/usr/bin/python3
import os, sys

clair = sys.argv[1]
taille = len(clair)
aux = []

for i in range(taille) : 
	aux.append(ord(clair[i]))

decalage = 3
depart_ascii = 97
nbMots = 26

clair = ""
for k in range(taille) :
	aux[k] = (((aux[k]+decalage-depart_ascii)%nbMots)+depart_ascii)
	clair += chr(aux[k])

print(clair)
```

- Exécution du script écrit précédemment.

```bash
$ python3 brutus.py basic
edvlf
```

------

### Résolution

------

- Script python décalant de 3 les caractères de la chaîne mise en paramètre dans le sens contraire de l'alphabet : déchiffrement de César.

```python
#!/usr/bin/python3
import os, sys

clair = sys.argv[1]
taille = len(clair)
aux = []

for i in range(taille) : 
	aux.append(ord(clair[i]))

decalage = 3
depart_ascii = 97
nbMots = 26

clair = ""
for k in range(taille) :
	aux[k] = (((aux[k]-decalage-depart_ascii)%nbMots)+depart_ascii)
	clair += chr(aux[k])

print(clair)
```

- Exécution du script écrit précédemment.

```bash
$ python3 brutus.py edvlf
basic
```

`CRYPTIS{basic}` 

# crypto_0150_vendredi_13

------

### Titre : Vendredi 13

### Points : 150

------

### Description

------

Nous avons un mot de passe chiffré : rapelcgvba_rdhnyf_qrpelcgvba.

Veuillez entrer la réponse sous la forme : CRYPTIS{*le mot de passe en clair*}

------

### Réalisation

------

- Le **ROT13** , *rotate by 13 places*, est un cas particulier du chiffrement de César. Il s’agit d’un décalage de 13 caractères de chaque lettre du texte à chiffrer. Le codage et le décodage se font exactement de la même manière.
- Script python décalant de 13 les caractères de la chaîne mise en paramètre dans le sens de l'alphabet : ROT13.

```python
#!/usr/bin/python3
import os, sys

clair = sys.argv[1]
taille = len(clair)
aux = []

for i in range(taille) : 
	aux.append(ord(clair[i]))

decalage_rot13 = 13
depart_ascii = 97
nbMots = 26

clair = ""
for k in range(taille) :
	if aux[k] > 96 and aux[k] < 97+26 : 
		aux[k] = (((aux[k]+decalage_rot13-depart_ascii)%nbMots)+depart_ascii)
	clair += chr(aux[k])

print(clair)

```

- Exécution du script écrit précédemment.

```bash
$ python3 vendredi_13.py encryption_equals_decryption
rapelcgvbalrdhnyflqrpelcgvba

```

------

### Résolution

------

- La réalisation est identique à la résolution : le chiffrement est équivalement au déchiffrement

```python
#!/usr/bin/python3
import os, sys

clair = sys.argv[1]
taille = len(clair)
aux = []

for i in range(taille) : 
	aux.append(ord(clair[i]))

decalage_rot13 = 13
depart_ascii = 97
nbMots = 26

clair = ""
for k in range(taille) :
	if aux[k] > 96 and aux[k] < 97+26 : 
		aux[k] = (((aux[k]+decalage_rot13-depart_ascii)%nbMots)+depart_ascii)
	clair += chr(aux[k])

print(clair)

```

- Exécution du script écrit précédemment.

```bash
$ python3 vendredi_13.py rapelcgvbalrdhnyflqrpelcgvba
encryption_equals_decryption

```

`CRYPTIS{encryption_equals_decryption}` 

# crypto_0200_encodage

------

### Titre : Encodage==

### Points : 200

------

### Description

------

Voici un encodage : ZGVjb2RlX2lzX3N1Y2Nlc3NlZA==.

Veuillez entrer la réponse sous la forme : CRYPTIS{*le mot désencodé*}

------

### Réalisation

------

- **Base64** est un codage de l'information utilisant 64 caractères, choisis pour être disponible sur la majorité des systèmes.
- Encodage du flag en base 64.

```bash
$ echo decode_is_successed | base64
ZGVjb2RlX2lzX3N1Y2Nlc3NlZA==

```

------

### Résolution

------

- Nous nous retrouvons avec un encodage en format base64, il suffit donc de le désencoder.

```bash
$ echo ZGVjb2RlX2lzX3N1Y2Nlc3NlZA== | base64 --decode
decode_is_successed

```

`CRYPTIS{decode_is_successed}` 

# crypto_0300_combo

------

### Titre : Combo

### Points : 300

------

### Description

------

Voici un mot de passe chiffré : Y2VicHJmZl96dms=.

Veuillez entrer la réponse sous la forme : CRYPTIS{*mot de passe en clair*}

------

### Réalisation

------

- Ce challenge utilise deux procédés : l'encodage en base64 et le chiffrement en ROT13.
- Script python décalant de 13 les caractères de la chaîne mise en paramètre dans le sens de l'alphabet : ROT13.

```python
#!/usr/bin/python3
import os, sys

clair = sys.argv[1]
taille = len(clair)
aux = []

for i in range(taille) : 
	aux.append(ord(clair[i]))

decalage_rot13 = 13
depart_ascii = 97
nbMots = 26

clair = ""
for k in range(taille) :
	if aux[k] > 96 and aux[k] < 97+26 : 
		aux[k] = (((aux[k]+decalage_rot13-depart_ascii)%nbMots)+depart_ascii)
	clair += chr(aux[k])

print(clair)

```

```bash
# Exécution du script précédemment écrit
$ python3 vendredi_13.py process_mix
cebprff_zvk
# Encodage du flag en base 64.
$ echo cebprff_zvk | base64
Y2VicHJmZl96dms=

```

------

### Résolution

------

- Nous nous retrouvons avec un encodage en format base64.

```bash
$ echo Y2VicHJmZl96dms= | base64 --decode
cebprff_zvk

```

- Le résultat ne veut pas dire grand chose et le tester en tant que flag n'est pas concluant.
- Voici un script tester tous les décalages possibles dans l'alphabet courant.

```python
#!/usr/bin/python3
import os, sys

chiffre = sys.argv[1]
taille = len(chiffre)
aux = []

for i in range(taille) : 
	aux.append(ord(chiffre[i]))

depart_ascii = 97
nbMots = 26

for decalage in range(1,26) :
	chiffre = ""
	for k in range(taille) :
		if aux[k] > 96 and aux[k] < 97+26 : 
			aux[k] = (((aux[k]+decalage-depart_ascii)%nbMots)+depart_ascii)
		chiffre += chr(aux[k])
	print(chiffre)

```

```bash
# Exécution du script précédemment écrit
$ python3 combo.py cebprff_zvk
# [...]
process_mix
# [...]

```

- Une liste de clair possible apparaît avec un seul élément portant du sens.

`CRYPTIS{process_mix}` 

# crypto_0300_h

------

### Titre : H

### Points : 300

------

### Description

------

Voici une phrase hashée par 2 fonctions différentes : **45bb21cd4ee4cf21c59b37e9c659503b** **e72c768115527ddb4c3f7e776d6391ad**.

Veuillez entrer la concaténation des deux mots d'origine : CRYPTIS{*origineHash1*_*origineHash2*}.

------

### Réalisation

------

- Mots de passe : **bien joué**
- Une fonction de hachage est  une fonction particulière qui, à partir d'une donnée fournie en entrée, calcule une *empreinte* servant à identifier rapidement la donnée initiale.
- Les fonctions de hachage utilisée sont MD4 et MD5 : ces fonctions cryptographiques conçues par le professeur Ronald Rivest sont dépréciées et à éviter.
- Méthode hashant les mots de passe : 
  - Utilisation du site *md5decrypt.net*
  - Choisir les fonctions md5 et md4
  - Hasher **bien** avec md4 et **joué** avec md5

------

### Résolution

------

- Méthode trouvant les fonctions de hachage plausibles
  - Utilisation du site *md5decrypt.net*
  - Utiliser le service de détecteur de hash
- Méthode trouvant les mots de passe :
  - Utilisation du site *md5decrypt.net*
  - Essaie des différentes fonctions de hachage plausibles sur les hashés
  - MD4 et MD5 donne respectivement les mots de passe du premier et du deuxième hashés

`CRYPTIS{bien_joué}` 

# crypto_0400_blaise_v

------

### Titre : Blaise V.

### Points : 400

------

### Description

------

Voici un mot de passe chiffré par notre cher Blaise : Zirsxarmdpvcwildtmvcyvtfkfcdmoeimencbinoxcvejoxrbickjgxusopjowmsxdkggvikorrbiayrlkmqcezvinkvydxyaycpvcaycxxgopjo.

Veuillez entrer la réponse sous la forme : CRYPTIS{*clé de chiffrement du chiffré*}

------

### Réalisation

------

- Chiffrement du clair avec le chiffrement de Vigenère à l'aide de la clef **key** 

  Le chiffre de Vigenère est un système de chiffremen poly-alphabétique : c’est un chiffrement par substitution, mais une même lettre du message clair peut, suivant sa position dans celui-ci, être remplacée par des lettres différentes.

  Pour pouvoir chiffrer notre texte, à chaque caractère nous utilisons une lettre de la clé pour effectuer la substitution.

- Technique de chiffrement utilisée : 

  - Utilisation du site *https://www.dcode.fr/chiffre-vigenere*
  - Cliquer sur chiffrer en ayant rempli les champs au préalable 
  - Renvoie du chiffré à gauche

------

### Résolution

------

- Méthode trouvant le chiffrement : Blaise est le prénom de Vigenère après une petite recherche sur votre *meilleur outil* Google.
- Méthode trouvant la taille de la clef : 
  - Répétition de la chaîne **ayc** : fortes probabilités que ce soit une même chaîne de caractère chiffrée avec une même partie de clef
  - Cette répétition ayant une distance de 3 : probabilité que la taille est de taille 3
- Méthode déchiffrant notre chiffré
  - Utilisation du site *https://www.dcode.fr/chiffre-vigenere*
  - Cliquer sur déchiffrer en ayant rempli les champs au préalable
    - taille trouvée : 3
    - chiffré 
  - Renvoie du clair à gauche

`CRYPTIS{key}` 

# misc_0001_welcome

------

### Titre : Welcome

### Points : 1

------

### Description

------

Pour cet événement, le format des flags est `CRYPTIS{GneuneuGneu}` . D'accord ?

Comme vous êtes sympa, je vous offre un petit point, faites en bonne usage. Ne me remerciez pas :)

`CRYPTIS{<3_<3_<3_<3_<3}`

------

### Réalisation

------

- NÉANT

------

### Résolution

------

- copier/coller le flag

`CRYPTIS{<3_<3_<3_<3_<3}` 

# misc_0100_extension

------

### Titre : Extension

### Points : 100

------

### Description

------

Vous trouverez ci-dessous le fichier contenant le flag.

------

### Réalisation

------

- Création d'un pdf **flag.pdf** contenant le flag en clair

```bash
$ mv flag.pdf flag.png

```

------

### Résolution

------

- L'ouverture de cette *image* signale une erreur

```bash
$ file flag.png
flag.png: PDF document, version 1.7

# On peut noter que l'extension de ce fichier est un pdf, hors nous avons un png
$ mv flag.png flag.pdf

```

- Ouvrir le pdf pour trouver le flag en clair

`CRYPTIS{easy_misc}` 

# misc_0200_lorem

------

### Titre : Lorem

### Points : 200

------

### Description

------

Vous trouverez ci-dessous le fichier contenant le flag.

------

### Réalisation

------

Utilisation du site Lorem Ipsum ( https://fr.lipsum.com/ )

Création de 200 paragraphes. Copié / collé dans le .txt.

Ajout du flag comme nouveau paragraphe quelque part dans le fichier

------

### Résolution

------

```bash
$ grep "CRYPTIS" gneugneu.txt

```

`CRYPTIS{L0sT_1n_L4t1n}` 

# misc_0400_crackmepls

------

### Titre : Crackmepls

### Proints : 400

------

### Description

------

Ouvrez ce zip.

------

### Réalisation

------

Création d'un fichier .txt contenant le flag.

```bash
$ zip -e crackmepls.zip crackmepls

```

------

### Résolution

------

```bash
$ fcrackzip -v -D -u -p rockyou.txt crackmepls.zip

```

`CRYPTIS{W4s_4n_3asY_P4ssW0Rd}` 

# misc_0400_utropie

------

### Titre : Utropie

### Points : 400

------

### Description

------

Utropie élevée.

http://10.10.10.2/flag.zip

Veuillez entrer la réponse sous la forme : `CRYPTIS{valeur}`.

------

### Réalisation

------

Utropie = Utopie + Entropie

```python
#!/usr/bin/python3
import math,random,string, sys

from threading import Thread

entropie="d15627104d07846ac2914a976e8e347a663bbd9b"
list_w=[]
char = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
HEX_CHARS = "1234567890abcdefABCDEF"

def dic_word():
    file=open("/usr/share/dict/american-english","r")
    for line in file:
        if "'" not in line:
            list_w.append(line.rstrip())

def genereword():
    res=""
    while len(res)<30:
        res+=list_w[random.randint(0,len(list_w)-1)]
    return res

def shannon_entropy(data, iterator):
    if not data:
        return 0
    entropy = 0
    for x in iterator:
        p_x = float(data.count(x))/len(data)
        if p_x > 0:
            entropy += - p_x*math.log(p_x, 2)
    return entropy

class Entropy(Thread):
    def __init__(self, tab):
        Thread.__init__(self)
        self.tab = tab
    def run(self):
        while(len(self.tab)<25):
            res=genereword()
            while shannon_entropy(res,char)>3:
                res=genereword()
            self.tab.append(res)
    def get(self):
        return self.tab

dic_word()

tab1=[]
tab2=[]
tab3=[]
tab4=[]
thread_1 = Entropy(tab1)
thread_2 = Entropy(tab2)
thread_3 = Entropy(tab3)
thread_4 = Entropy(tab4)

# Lancement des threads
thread_1.start()
thread_2.start()
thread_3.start()
thread_4.start()

# Attend que les threads se terminent
thread_1.join()
thread_2.join()
thread_3.join()
thread_4.join()
final=[]

final.extend(thread_1.get())
final.extend(thread_2.get())
final.extend(thread_3.get())
final.extend(thread_4.get())

file = open("flags.txt","w")
for i in range(0,1000000):
    random_w=final[i]
    if i == 750 000:
	        print("")
	        print("=>"+random_w)
    file.write(random_w+"
")
file.close()

```

```python
#!/usr/bin/python3
import os

for i in range(0,10):
    os.system("head -n -1 flag/flags.txt > flag/temp.txt ; mv flag/temp.txt flag/flags.txt")
    os.system("cd flag/ && git add flags.txt")
    os.system("cd flag/ && git commit -m 'flag'")

```

------

### Résolution

------

Nous avons créé ce challenge pour sensibiliser les personnes d'éviter de laisser des clés d'API dans des dépôts git. Même si la clé est perdue dans des fichiers, il sera toujours possible de la retrouver. Pour la résolution de ce challenge nous utiliserons [truffleHog](https://github.com/dxa4481/truffleHog).

```bash
$ truffleHog file:///path/to/directory/
~~~~~~~~~~~~~~~~~~~~~
Reason: High Entropy
Date: 2019-01-18 12:00:07
Hash: 17e57fc18b846e0f0f1fd918ef5d62336bb00a1c
Filepath: flags.txt
Branch: origin/master
Commit: flag

@@ -313488,7 +313488,6 @@ effecteddetestedaccuserscruets
 lensessecedesexpressessnipping
 eraserssweltersaftertastessands
 gauntnessinterningententestransients
-d15627104d07846ac2914a976e8e347a663bbd9b
 telltalestaircantnectarcaterer
 meanestmattressesconsonantantes
 sissiesrosetteshielddispensers

~~~~~~~~~~~~~~~~~~~~~

```

Nous pouvons aussi utiliser `git` pour trouver le flag :

```bash
$ git diff 226bed9 17e57fc
diff --git a/flags.txt b/flags.txt
index f39bb13..b4b5ead 100644
--- a/flags.txt
+++ b/flags.txt
@@ -313488,6 +313488,7 @@ effecteddetestedaccuserscruets
 lensessecedesexpressessnipping
 eraserssweltersaftertastessands
 gauntnessinterningententestransients
+d15627104d07846ac2914a976e8e347a663bbd9b
 telltalestaircantnectarcaterer
 meanestmattressesconsonantantes
 sissiesrosetteshielddispensers

```

`CRYPTIS{d15627104d07846ac2914a976e8e347a663bbd9b}` 

# prog_0200_speedy_gonzales

------

### Titre : Speedy Gonzales

### Points : 200

------

### Description

------

Ay Caramba !

------

### Réalisation

------

```python
import random,socket,select,time,re

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
                # il y a une demande de connexion
                nouvelle_connexion, depuis = ma_socket.accept()
                print ("Nouvelle connexion depuis ", depuis)
                nouvelle_connexion.sendall(b'Bienvenue
')

                calcul=[random.randint(100000, 1000000),random.randint(100000, 1000000),random.randint(100000, 1000000)]
                representation_calcul="["+",".join(str(x) for x in calcul)+"]"

                dic[depuis[0]]=[calcul,time.time()]
                nouvelle_connexion.sendall(bytes(representation_calcul,"utf-8"))

                surveillance.append(nouvelle_connexion)
                continue

            ligne = un_evenement.recv(1024)
            if not ligne :
                un_evenement.close()
                surveillance.remove(un_evenement) # le client s'est déconnecté
            else :
                nb=int(ligne)
                valeurs=dic[un_evenement.getpeername()[0]][0]
                if nb==valeurs[0]*valeurs[1]-valeurs[2] and time.time()-dic[un_evenement.getpeername()[0]][1]<2:
                    print ("A réussi => ",un_evenement.getpeername())
                    un_evenement.sendall(bytes("CRYPTIS{b1p_b1p}","utf-8"))


    ma_socket.close()

```

------

### Résolution

------

```python
import socket, re

sock=socket.socket(socket.AF_INET, socket.SOCK_STREAM, socket.IPPROTO_TCP)
sock.connect(("localhost",3000))

rep = sock.recv(1024)
print(rep)

rep=sock.recv(1024)
valeurs=re.findall("(\d+),(\d+),(\d+)",str(rep))
print(int(valeurs[0][0])*int(valeurs[0][1])-int(valeurs[0][2]))

sock.sendall(bytes(str(int(valeurs[0][0])*int(valeurs[0][1])-int(valeurs[0][2])),"utf-8"))

rep = sock.recv(1024)
print(rep)

sock.close()
print("End client")

```

```bash

```

`CRYPTIS{b1p_b1p}` 

# reverse_0250_reverse_1

------

### Titre : Reverse One

### Points : 250

------

### Description

------

Reverse me if you can :)

------

### Réalisation

------

Nous allons écrire un programme en C qui, une fois lancé, va demander à l'utilisateur de lui fournir une certaine chaîne de caractères, qui correspondra au flag du challenge. Cette chaîne sera : `CRYPTIS{thanks_to_strings_cmd}`.

Nous allons donc stocker ce flag avec un `char *flag`.

```c
#include <stdio.h>
#include <string.h>

int main() {
  
  char input[100];
  char *a = "Bonjour";
  char *b = "Ce challenge est trop facile";
  char *flag = "CRYPTIS{thanks_to_strings_cmd}";
  char *c = "Je ne sais plus trop quoi écrire";
  char *d = "Bon j'arrête";
  char *e = "<3";
  
  printf("Give me the flag: ");
  scanf("%s", input);

  int i = 0;
  if (strlen(input) == 30) { 
    i = 0;
    while (input[i] != '' && flag[i] != '') {
      if (input[i] != flag[i]) {
        break;
      }
      i++;
    }
  }

  if (i == strlen(input) && i == strlen(flag)) {
    printf("Congratulation, you can submit this flag :)
");
  } else {
    printf("Bad flag, try again :(
");
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

------

### Résolution

------

Regardons d'abord le type du fichier fourni pour ce challenge. Pour cela nous utilisons la commande linux `file`.

```bash
# type de fichier
$ file ./reverse_me_1
reverse_me_1: ELF 64-bit LSB shared object, x86-64,...

```

Ce fichier est donc un exécutable pour linux (`ELF`: Linux, `PE` : Windows).

```bash
$ # exécution
$ ./reverse_me_1
Give me the flag: GneuGneuGneu
Bad flag, try again :(

```

On peut donc penser que si on fourni le bon flag, celui-ci sera accepté par le programme.

Pour commencer, nous allons utiliser la commande `strings` afin de peut-être trouver le flag. 

```bash
# consultons le manuel
$ man strings
strings - find the printable strings in a object, or other binary, file

```

Cette commande permet d'afficher toutes les chaînes de caractères présentes dans n'importe quel type de fichier.

```bash
$ strings reverse_me_1
...
CRYPTIS{thanks_to_strings_cmd}
...

```

Dans les résultats de la commande, on peut voir la flag.

En utilisant la commande `grep`nous pouvons filtrer le nombre de lignes en sortie.

```bash
$ strings reverse_me_1 | grep "CRYPTIS"
CRYPTIS{thanks_to_strings_cmd}

```

Avec le `| grep "CRYPTIS"`, une ligne peut s'afficher si et seulement si elle contient le mot `CRYPTIS`. Ce sont les premières lettres du flag que l'on cherche.

`CRYPTIS{thanks_to_strings_cmd}` 

# reverse_0500_reverse_2

------

### Titre : Reverse Two

### Points : 500

------

### Description

------

Reverse me if you can :)

------

### Réalisation

------

Ce challenge est une suite au challenge `reverse_0250_reverse_1`. Il suit le même principe, sauf qu'au lieu de stocker le flag dans une chaîne de caractères en dur dans le code. Nous allons stocker les valeurs ASCII de chaque lettre du flag dans une `char flag[]`. Cela permet d'empêcher à la commande `strings`d'afficher notre flag en clair.

Nous utilisons ce script python afin de trouver les valeurs ASCII associées à notre flag `CRYPTIS{ascii_flager}`.

```python
#!/usr/bin/python3

res = ''
for c in 'CRYPTIS{ascii_flager}':
    res += str(ord(c)) + ' '

print(res)

```

```bash
$ python3 ./encode.py
67 82 89 80 84 73 83 123 97 115 99 105 105 95 102 108 97 103 101 114 125

```

Nous remplissons donc la tableau `char flag[]` avec les valeurs ASCII du flag. Il faut penser à ajouter un `0` à la fin pour terminer la chaîne.

```c
#include <stdio.h>
#include <string.h>

int main() {
  
  char input[100];
  char *a = "Re-Bonjour";
  char *b = "Ce challenge est un peu moins facile";
  char  flag[] = {67, 82, 89, 80, 84, 73, 83, 123, 97, 115, 99, 105, 105, 95, 102, 108, 97, 103, 101, 114, 125, 0};
  char *c = "L'examen de crypto était sympa, pas vrai ?";
  char *d = "Good luck";
  char *e = "<3";
  
  printf("Give me the flag: ");
  scanf("%s", input);

  int i = 0;
  if (strlen(input) == strlen(flag)) {
    while (input[i] != '' && flag[i] != '') {
      if ((int)input[i] != flag[i]) {
        break;
      }
      i++;
    }
  }

  if (i == strlen(input) && i == strlen(flag)) {
    printf("Congratulation, you can submit this flag :)
");
  } else {
    printf("Bad flag, try again :(
");
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

------

### Résolution

------

On commence comme pour le `reverse_0250_reverse_1` avec la commande `file` pour connaitre le type de fichier.

```bash
$ file ./reverse_me_2
reverse_me_1: ELF 64-bit LSB shared object, x86-64,...

```

On a donc encore un exécutable pour linux. Maintenant, utilisons la commande `strings`.

```bash
$ strings ./reverse_me_2 | grep "CRYPTIS"

```

C'est triste, il n'y a aucun résultat. Nous allons donc maintenant utiliser un programme afin d'explorer notre `reverse_me_2`. Nous utiliserons `radare2`. Pout le lancer il faut lui donner notre `reverse_me_2`en paramètre.

```bash
$ r2 ./reverse_me_2
[0x000006a0]>

```

On se retouve maintenant, dans l'interpréteur de `radare2`.

L'étape suivante est d'analyser `reverse_me_2` avec la commande `aaa` puis d'afficher les fonctions trouvées par `radare2` avec la commande `afl`.

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
0x000007aa   14 493          main
0x000009a0    4 101          sym.__libc_csu_init
0x00000a10    1 2            sym.__libc_csu_fini
0x00000a14    1 9            sym._fini

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
0x000007da      48898540ffff.  mov qword [local_c0h], rax
|           0x000007e1      c68560ffffff.  mov byte [local_a0h], 0x43  ; 'C'
|           0x000007e8      c68561ffffff.  mov byte [local_9fh], 0x52  ; 'R'
|           0x000007ef      c68562ffffff.  mov byte [local_9eh], 0x59  ; 'Y'
|           0x000007f6      c68563ffffff.  mov byte [local_9dh], 0x50  ; 'P'
|           0x000007fd      c68564ffffff.  mov byte [local_9ch], 0x54  ; 'T'
|           0x00000804      c68565ffffff.  mov byte [local_9bh], 0x49  ; 'I'
|           0x0000080b      c68566ffffff.  mov byte [local_9ah], 0x53  ; 'S'
|           0x00000812      c68567ffffff.  mov byte [local_99h], 0x7b  ; '{'
|           0x00000819      c68568ffffff.  mov byte [local_98h], 0x61  ; 'a'
|           0x00000820      c68569ffffff.  mov byte [local_97h], 0x73  ; 's'
|           0x00000827      c6856affffff.  mov byte [local_96h], 0x63  ; 'c'
|           0x0000082e      c6856bffffff.  mov byte [local_95h], 0x69  ; 'i'
|           0x00000835      c6856cffffff.  mov byte [local_94h], 0x69  ; 'i'
|           0x0000083c      c6856dffffff.  mov byte [local_93h], 0x5f  ; '_'
|           0x00000843      c6856effffff.  mov byte [local_92h], 0x66  ; 'f'
|           0x0000084a      c6856fffffff.  mov byte [local_91h], 0x6c  ; 'l'
|           0x00000851      c68570ffffff.  mov byte [local_90h], 0x61  ; 'a'
|           0x00000858      c68571ffffff.  mov byte [local_8fh], 0x67  ; 'g'
|           0x0000085f      c68572ffffff.  mov byte [local_8eh], 0x65  ; 'e'
|           0x00000866      c68573ffffff.  mov byte [local_8dh], 0x72  ; 'r'
|           0x0000086d      c68574ffffff.  mov byte [local_8ch], 0x7d  ; '}'
...

# on quitte
[0x000007aa]> q

```

On peut voir que dans le contenu du `main` (sortie de `pdf`) que des données sont stockées avec leur valeur en hexadécimal. La structure de données utilisée est sûrement un tableau. On peut remarquer que les 3 premières valeurs sont `0x43`, `0x52` et `0x59`. En codage ASCII, ces 3 valeurs correspondent aux lettres `C`, `R`, `Y`. Ce sont donc les premières lettres du flag que l'on cherche, car ces dernières respectent le format`CRYPTIS{...}`. On peut voir que `radare2` nous aide beaucoup dans cette situation, en effet ce dernier nous affiche directement les caractères ASCII correspondants aux valeurs hexadécimales.

Pour terminer nous pouvons récupérer chaque valeur hexadécimale, et afficher le caractère ASCII associé avec un programme python.

```python
#!/usr/bin/python3

flag = [0x43, 0x52, 0x59, 0x50, 0x54, 0x49, 0x53, 0x7b, 0x61, 0x73, 0x63, 0x69, 0x69, 0x5f, 0x66, 0x6c, 0x61, 0x67, 0x65, 0x72, 0x7d]

res = ''
for c in flag:
	res += chr(c)

print(res)

```

```bash
$ python3 ./resolv.py
CRYPTIS{ascii_flager}

```

`CRYPTIS{ascii_flager}` 

# reverse_0750_reverse_3

------

### Titre : Reverse Three

### Points : 750

------

### Description

------

Reverse me if you can :)

------

### Réalisation

------

Ce troisième challenge est une suite au `reverse_0500_reverse_2`. La flag `CRYPTIS{ascii_flager_with_offset}` est encore écrit dans le code, mais cette fois, on a appliqué un chiffrement par décalage de `-20` sur les valeurs ASCII d'origines.

Voici le script pour réaliser le décalage de `-20`en utilisant python.

```python
#!/usr/bin/python3

res = ''
for c in 'CRYPTIS{ascii_flager_with_offset}':
    res += chr(ord(c)-20) + ' '

print(res)

```

```bash
$ python3 ./encode.py
/ > E < @ 5 ? g M _ O U U K R X M S Q ^ K c U ` T K [ R R _ Q ` i 

```

Code principal proche des précédents.

```c
#include <stdio.h>
#include <string.h>

int main() {
  
  char input[100];
  char *a = "Re-Bonjour";
  char *b = "Bon, c'est l'heure de réfléchir (un tout petit peu)";
  char  flag[] = {'/', '>', 'E', '<', '@', '5', '?', 'g', 'M', '_', 'O', 'U', 'U', 'K', 'R', 'X', 'M', 'S', 'Q', '^', 'K', 'c', 'U', '`', 'T', 'K', '[', 'R', 'R', '_', 'Q', '`', 'i', ''};
  char *c = "APGES TEAM";
  char *d = "Good luck";
  char *e = "<3";
  
  printf("Give me the flag: ");
  scanf("%s", input);

  int i = 0;
  while (input[i] != '' && flag[i] != '') {
    if ((int)input[i] != (int)flag[i]+20) {
      break;
    }
    i++;
  }
  if (i == strlen(input) && i == strlen(flag)) {
    printf("Congratulation, you can submit this flag :)
");
  } else {
    printf("Bad flag, try again :(
");
  }
  
  return 0;
}

```

```bash
# compilation
$ gcc main.c -o reverse_me_3

# exécution
$ ./reverse_me_3
Give me the flag: GneuGneuGneu
Bad flag, try again :(

```

------

### Résolution

------

On commence comme pour le `reverse_0250_reverse_1`. On commence par la commande `file` pour connaître le type de fichier.

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
0x000007aa   14 593          main
0x00000a00    4 101          sym.__libc_csu_init
0x00000a70    1 2            sym.__libc_csu_fini
0x00000a74    1 9            sym._fini

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
0x000007da      48898540ffff.  mov qword [local_c0h], rax
|           0x000007e1      c68550ffffff.  mov byte [local_b0h], 0x2f  ; '/'
|           0x000007e8      c68551ffffff.  mov byte [local_afh], 0x3e  ; '>'
|           0x000007ef      c68552ffffff.  mov byte [local_aeh], 0x45  ; 'E'
|           0x000007f6      c68553ffffff.  mov byte [local_adh], 0x3c  ; '<'
|           0x000007fd      c68554ffffff.  mov byte [local_ach], 0x40  ; '@'
|           0x00000804      c68555ffffff.  mov byte [local_abh], 0x35  ; '5'
|           0x0000080b      c68556ffffff.  mov byte [local_aah], 0x3f  ; '?'
|           0x00000812      c68557ffffff.  mov byte [local_a9h], 0x67  ; 'g'
|           0x00000819      c68558ffffff.  mov byte [local_a8h], 0x4d  ; 'M'
|           0x00000820      c68559ffffff.  mov byte [local_a7h], 0x5f  ; '_'
|           0x00000827      c6855affffff.  mov byte [local_a6h], 0x4f  ; 'O'
|           0x0000082e      c6855bffffff.  mov byte [local_a5h], 0x55  ; 'U'
|           0x00000835      c6855cffffff.  mov byte [local_a4h], 0x55  ; 'U'
|           0x0000083c      c6855dffffff.  mov byte [local_a3h], 0x4b  ; 'K'
|           0x00000843      c6855effffff.  mov byte [local_a2h], 0x52  ; 'R'
|           0x0000084a      c6855fffffff.  mov byte [local_a1h], 0x58  ; 'X'
|           0x00000851      c68560ffffff.  mov byte [local_a0h], 0x4d  ; 'M'
|           0x00000858      c68561ffffff.  mov byte [local_9fh], 0x53  ; 'S'
|           0x0000085f      c68562ffffff.  mov byte [local_9eh], 0x51  ; 'Q'
|           0x00000866      c68563ffffff.  mov byte [local_9dh], 0x5e  ; '^'
|           0x0000086d      c68564ffffff.  mov byte [local_9ch], 0x4b  ; 'K'
|           0x00000874      c68565ffffff.  mov byte [local_9bh], 0x63  ; 'c'
|           0x0000087b      c68566ffffff.  mov byte [local_9ah], 0x55  ; 'U'
|           0x00000882      c68567ffffff.  mov byte [local_99h], 0x60  ; '`'
|           0x00000889      c68568ffffff.  mov byte [local_98h], 0x54  ; 'T'
|           0x00000890      c68569ffffff.  mov byte [local_97h], 0x4b  ; 'K'
|           0x00000897      c6856affffff.  mov byte [local_96h], 0x5b  ; '['
|           0x0000089e      c6856bffffff.  mov byte [local_95h], 0x52  ; 'R'
|           0x000008a5      c6856cffffff.  mov byte [local_94h], 0x52  ; 'R'
|           0x000008ac      c6856dffffff.  mov byte [local_93h], 0x5f  ; '_'
|           0x000008b3      c6856effffff.  mov byte [local_92h], 0x51  ; 'Q'
|           0x000008ba      c6856fffffff.  mov byte [local_91h], 0x60  ; '`'
|           0x000008c1      c68570ffffff.  mov byte [local_90h], 0x69  ; 'i'
...
# on quitte
[0x000007aa]> q

```

On peut voir que dans le contenu du `main()` (sortie de `pdf`) que des données sont stockées, avec leur valeur en hexadécimal. C'est probablement un tableau qui contient toutes ces valeurs. On peut remarquer que les 3 premières valeurs sont `0x2f`, `0x3e` et `0x45`. En codage ASCII, ces 3 valeurs correspondent aux caractères `/`, `>`, `E`.  Ces valeurs sont plutôt étranges, cependant, on remarque que `|0x2f - 0x3e|` (la différence) est égale à 15, qui correspond à la distance entre les lettres `C` et `R`  . Également, `|0x3e - 0x45|` vaut 7, c'est-à-dire à la distance entre les lettres `R` et `Y`. On comprend rapidement que l'on a appliqué un chiffrement par décalage sur le flag. Le décalage est la différence entre la lettre voulue, par exemple `C` (c'est-à-dire `0x43`) et la lettre donnée, dans notre cas, c'est `0x2f`.

```bash
# calcul du décalage
$ python3 -c "print(abs(0x43-0x2f))" # on veut la valeur absolue avec abs()
20

```

Un décalage de `-20` a donc été appliqué à notre flag, pour trouver ce dernier, il faudra simplement, réaliser un décalage inverse de `+20`. Voici le script qui permet de réaliser le décalage inverse sur les valeurs hexadécimales.

```python
#!/usr/bin/python3

flag = [0x2f, 0x3e, 0x45, 0x3c, 0x40, 0x35, 0x3f, 0x67, 0x4d, 0x5f, 0x4f, 0x55, 0x55, 0x4b, 0x52, 0x58, 0x4d, 0x53, 0x51, 0x5e, 0x4b, 0x63, 0x55, 0x60, 0x54, 0x4b, 0x5b, 0x52, 0x52, 0x5f, 0x51, 0x60, 0x69]

res = ''
for c in flag:
	res += chr(c+20)

print(res)

```

```bash
$ python3 ./resolv.py
CRYPTIS{ascii_flager_with_offset}

```

Un autre moyen de remarquer la présence d'un décalage de `-20` est de regarder dans le code assembleur du `main()`.

```assembly
# on affiche le main
[0x000006a0]> pdf
...
|      :|   0x00000951      83c014         add eax, 0x14
|      :|   0x00000954      39c2           cmp edx, eax
|     ,===< 0x00000956      752e           jne 0x986
...
# on quitte
[0x000007aa]> q

```

On peut voir que sur cet extrait d'instructions, un `add eax, 0x14`, l'instruction `add` comme son nom l'indique, permet de réaliser une addition. Dans notre cas, elle ajoute `0x14` à la valeur du registre `eax`. Pour faire simple : `eax = eax + 0x14`. On remarque aussi que `Ox14` vaut 20, car `16 + 4 = 20`. Donc c'est à ce moment qu'on réalise le `+20` dans le code C afin de voir si on a bien les bons caractères. Ensuite, `cmp edx, aex` permet de comparer notre `eax` avec `edx`. Et de prendre une décision selon le résultat avec `jne 0x986`. Le `jne` signifie Jump Not Equal, c'est dans le cas ou `edx` et `eax` ne sont pas égaux.

`CRYPTIS{ascii_flager_with_offset}` 

# stega_0050_spider

------

### Titre : Spider

### Points : 50

------

### Description

------

Trop facile.

------

### Réalisation

------

```bash
$ echo "CRYPTIS{N0t_H1dd3N}" >> spider.beurk

```

------

### Résolution

------

Ici, deux outils sont possibles : `cat` et `strings`. Si on utilise le premier, on aura plein de caractères non-lisible et incompréhensible.
Alors que le second affichera que des caractères ASCII compréhensible

------

```bash
$ strings spider.beurk | tail -n 1
CRYPTIS{N0t_H1dd3N}

```

`CRYPTIS{N0t_H1dd3N}` 

# stega_0100_monkey

------

### Titre : Monkey

### Points : 100

------

### Description

------

Avez-vous un commentaire à ajouter ?

------

### Réalisation

------

L'objectif de ce challenge est de faire découvrir les metadatas. Tous fichiers multimédias en possèdent et apportent énormément d'informations. Notamment celles associées aux photos, on va avoir énormément d'informations comme le type d'appareil photos , les coordonées gps, la date, ...

Il faut donc faire attention a ce qu'on partage notamment sur les réseaux sociaux ;-) 

```bash
$ exiftool -comment="CRYPTIS{T0_3@5y_to_f0ùNd}" monkey.jpg

```

------

### Résolution

------

Dans un premier temps, on va essayer de récupérer le flag avec `strings`.

```bash
$ strings monkey.jpg | grep CRYPTIS
CRYPTIS{T0_3@5y_to_f0

```

Cependant on a pas tous le flag donc il faudra utiliser un autre outil.

```bash
$ exiftool monkey.jpg
ExifTool Version Number         : 11.10
File Name                       : monkey.jpg
Directory                       : .
File Size                       : 141 kB
File Modification Date/Time     : 2019:01:30 13:54:55+01:00
File Access Date/Time           : 2019:01:30 14:28:54+01:00
File Inode Change Date/Time     : 2019:01:30 13:54:55+01:00
File Permissions                : rw-r--r--
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
Comment                         : ​CRYPTIS{T0_3@5y_to_f0ùNd}​
Image Width                     : 1100
Image Height                    : 715
Encoding Process                : Progressive DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:4:4 (1 1)
Image Size                      : 1100x715
Megapixels                      : 0.786

```

`CRYPTIS{T0_3@5y_to_f0ùNd}`​ 

# stega_0100_punisher

------

### Titre : Punisher

### Points : 100

------

### Description

------

Punisher sous l... :)

------

### Réalisation

------

Ici on va cacher des informations dans les bits de poids faibles de l'image. On va donc modifier très légèrement les couleurs de l'image, mais ces changements seront invisibles pour l'œil humain.

Cette méthode n'est d'ailleurs pas utilisable sur tous les formats par exemple JPEG sera impossible, car il va compresser l'image et ainsi perdre ces informations.

```python
import cv2

def to_bit_generator(msg):
    for c in (msg):
        o = ord(c)
        for i in range(8):
            yield (o & (1 << i)) >> i

hidden_message = to_bit_generator("CRYPTIS{L3B_Pun!sh}" )
# Read the original image
img = cv2.imread('punisher.png')
hight=len(img)
width=len(img[0])
for h in range(hight):
    for w in range(width):
        # Write the hidden message into the least significant bit
        try :
            img[h][w] = (img[h][w] & ~1) | next(hidden_message)
        except :
            continue
# Write out the image with hidden message
cv2.imwrite("punisher_out.png", img)

```

------

### Résolution

------

On peut utiliser l'application [Aperi'solve](https://aperisolve.fr/).

b1,b,msb,xy .. text: "CRYPTIS{L3B_Pun!sh}"

`CRYPTIS{L3B_Pun!sh}` 

# sonic_0400_sonic

------

### Titre : Sonic

### Points : 400

------

### Description

------

Nos espions ont intercepté cette communication lors de leur dernière mission. Aidez-nous à trouver ce qui se cache derrière cette dernière. Bonne chance.

------

### Réalisation

------

Le but de ce challenge est de cacher un flag dans un fichier audio. Ce type de challenges est souvent présent dans les CTF. Voici les étapes pour créer un son à partir de l'image d'un flag :

- avoir une image en noir et blanc sur laquelle se trouve un flag
- ouvrir cette image avec __Coagula (Windows)__
- écouter l'audio : `Sound > Render Without Blue`
- enregistrer l'audio : `File > Save Sound As ...`

On se retrouve maintenant avec un fichier audio, on peut vérifier ça avec la commande `file` qui permet de connaître le type d'un fichier.

```bash
$ file sonic.wav
sonic.wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, stereo 22050 Hz

```

------

### Résolution

------

L'écoute du fichier n'apporte pas grand chose sur la manière de trouver le flag. Utilisons le commande `file` pour s'assurer que nous avons bien un fichier audio `wav`.

```bash
$ file sonic.wav
sonic.wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, stereo 22050 Hz

```

C'est donc bien le cas. Utilisons maintenant `Sonic Visualiser` afin d'analyser le spectrogramme de l'audio.

- ouvrir le fichier `sonic.wav`  avec le logiciel d'analyse de fichiers audio `Sonic Visualiser`
- inspecter le spectrogramme : `Layer > Add Spectrogram > All Channels Mixed`
- Paramètres :
  - Color : Black on White
  - Scale : dBV | None
  - Window : 512 | 93.75 % | 4x
  - Bins : All Bins | Linear

Avec ces bons paramètres, on peut facilement lire les lettres de flag.

`CRYPTIS{flag_in_the_sound}` 

# stega_0450_fryle

------

### Titre : Fryle

### Points : 450

------

### Description

------

Fry a encore tous cassé !

------

### Réalisation

L'objectif est de montrer que les fichiers peuvent être très légèrement modifiés et ne plus du tout être reconnu par le système. Ainsi, les fichiers ne seront plus lisibles même si ils contiennent toujours la même information.

------

```bash
$ echo 'wtf' | xxd -p
777466
$ xxd -r -p -o 0 <(echo 8977 7466) futurama.png

```

------

### Résolution

------

```bash
$ xxd futurama.png |head
00000000: 8977 7466 0d0a 1a0a 0000 000d 4948 4452  .wtf........IHDR
00000010: 0000 01f4 0000 0177 0802 0000 00dc 902e  .......w........
00000020: ab00 0020 0049 4441 5478 0100 fe80 017f  ... .IDATx......
00000030: 01ff ffff 0000 0000 0000 0000 0000 0000  ................
00000040: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000050: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000080: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000090: 0000 0000 0000 0000 0000 0000 0000 0000  ................

```

On remarque que l'extension a été changé en wtf si suffit donc de le remplacer par PNG

```bash
$ echo PNG | xxd -p
504e47
$ xxd -r -p -o 0 <(echo 8950 4e47) futurama.png

```

`CRYPTIS{F!L3_3rr0R}` 

# web_0200_hidden

------

### Titre : Hidden

### Points : 200

------

### Description

------

http://10.10.10.2

------

### Réalisation

------

Page HTML simple avec ajout du flag en tant que commentaire dans le fichier.

------

### Résolution

------

Utiliser l'outil de développement web. Il nous permet de voir le code source de la page HTML. 

On peut ensutie trouver le flag avec une recherche dans le code source.

On observera qu'il avait était mis comme commentaire dans le code source, et de ce fait ne pouvait être vu dans la page directement.

`CRYPTIS{W3ll_h1dd3N_N0?}` 

# web_0200_mr_robot

------

### Titre : Mr.robot

### Points : 200

------

### Description

------

http://10.10.10.2:8080

------

### Réalisation

------

Objectif : faire découvrir le fichier `robots.txt` utilisé par tous les robots de moteurs de recherche. Fichier très important si l'on souhaite que des pages ne deviennent pas publiques. On va créer un fichier `robots.txt` qui va contenir le flag

------

### Résolution

------

```bash
$ wget ip:port/robots.txt

```

`CRYPTIS{Th3_R0bot_!s_c0ming}` 

# web_0200_void

------

### Titre : Void

### Points : 200

------

### Description

------

http://10.10.10.2:8081

------

### Réalisation

------

On va créer un fichier `404.html` qui va contenir le flag. Puis ajouter une règle dans le fichier de configuration du site pour automatiquement redirigé les requêtes 404 vers cette page.

------

### Résolution

------

On va chercher à obtenir une page random pour aller sur la page d'erreur 404.

```bash
$ wget ip:port/gnegneugneu

```

`CRYPTIS{s0rry_1_d0n_t_f1Nd}` 

# web_0300_map_du_site

------

### Titre : Map du site

### Points : 300

------

### Description

------

Sortez votre carte, sinon vous allez vous perdre :)

http://10.10.10.2:8082

------

### Réalisation

------

Objectif : faire découvrir le fichier `sitemaps.xml` utilisé par tous les robots de moteurs de recherche. Ce fichier permet d'améliorer l'exploration du site web par les robots.

On va créer un fichier `flag.txt` qui va contenir le Flag

```bash
$ mkdir -p faut/que/je/trouve/une/url/que/persone/peut/trouver/sauf/les/robots
$ touch flag.txt

```

puis un fichier `sitemaps.xml` qui possède le chemin du fichier

------

### Résolution

------

```bash
$ wget ip:port/sitemaps.xml
$ wget ip:port/faut/que/je/trouve/une/url/que/persone/peut/trouver/sauf/les/robots.txt

```

`CRYPTIS{l0st_1n_th3_d4rk}` 

# web_0300_what

------

### Titre : What

### Points : 300

------

### Description

------

Je ne vous comprends pas ! 

http://10.10.10.2:8081

ERREUR 400

------

### Réalisation

------

On va créer un fichier 400.html qui va contenir le Flag
puis ajouter une règle dans le fichier de configuration du site pour automatiquement redirigé les requêtes 400 vers cette page

------

### Résolution

------

```bash
$ nc ip port
GET /

```

`CRYPTIS{Wh@t_d0_you_s@!d}` 

# web_0400_brownies

------

### Titre : Brownies

### Points : 400

------

### Description

------

Une petite faim ?

http://10.10.10.2:8083

------

### Réalisation

------

On crée un un fichier PHP permettant de placer un cookie une fois qu'on arrive sur la page. Si le cookie n'existe pas, il en crée un avec un MD5 du mot "administrator", sinon il remplace ce cookie par un autre, contenant un MD5 du mot "intruder". Un formulaire est ajouté à la page afin de pouvoir permettre à l'utilisateur d'entrer un mot de passe qui lui fournira le flag.

```php+HTML
    <html>
    <head>
    <title>Hello</title>
    <body>

    <?php
    if (isset($_POST['pass'])){
        if($_POST['pass'] == "administrator"){
            echo "CRYPTIS{Br0wN13s_4r3_sO_g80d}";
        }
    } else {
        if (isset($_COOKIE['intruder'])) {
            echo 'You again, intruder ?';
            $temps = 365*24*3600;
            setcookie ("intruder", "e0c554ca949c29c35f7d24ba2310bdf8",time()+$temps);
            echo '<form action="" method="post">';
            echo 'Password : <input type = "text" name = "pass"><br />';
            echo '<input type = "submit" value = "Send">';
        }
        else {
            echo 'Here for the first time ?';
            $temps = 365*24*3600;
            setcookie ("intruder", "200ceb26807d6bf99fd6f4f0d1ca54d4" ,time()+$temps);
                echo '<form action="" method="post">';
                echo 'Password : <input type = "text" name = "pass"><br />';
                echo '<input type = "submit" value = "Send">';
        }
    }
    ?>
    </body>
    </html>

```

------

### Résolution

------

Utiliser l'outil de développement web. Dans l'onglet Stockage, on peut retrouver le cookie " intruder ".

On peut remarquer qu'il s'agit d'un  MD5. Si il s'agit de notre première visite sur le site ( ce qui est confirmé par la phrase "Here for the first time ?") en déchiffrant ce MD5 on retrouvera le mot "administrator".

En entrant " administrator " dans le formulaire sur le site on obtiendra le flag.

Si il ne s'agit pas de votre première visite sur le site ( ce qui est confirmé par la phrase "You again, intruder ?"), il faudra supprimer le cookie dans l'onglet Stockage et recharger la page.

`CRYPTIS{Br0wN13s_4r3_sO_g80d}` 

# web_0450_lfi

------

### Titre : LFI

### Points : 450

------

### Description

------

Rien à dire.
Ah si, les fichiers .txt c'est la vie.
http://10.10.10.2:8084

------

### Réalisation

------

Ce type de faille est très fréquentes sur internet. Il permet à un attaquant d'inclure un fichier distant non prévu par les développeur ou upload par l'attaquant. La faille est due à l'utilisation de l'entrée par l'utilisateur sans vérifications. De plus, on peut imaginer que le développeur a ajouté `.php` après la variable, mais on peut toujours passer au-delà avec le caractère NULL : %00.

Dans le fichier `index.php` on a le code suivant :

```php
<?php
   $fichier = $_GET['page'];
   if(isset($fichier){
       include("$fichier");
   } else {
    // ...
   }
?>

```

Le danger ici est l'utilisation de la fonction `include` qui va permettre de pouvoir inclure un fichier non prévu par le dévelopeur. Comme le fichier contenant le flag.

------

### Résolution

------

```bash
$ wget ip:port/index.php?page=flag.txt

```

`CRYPTIS{y0u_4r3_4_h@ck3r_3ll10t}` 

# web_0500_inspecteur_gadget

------

### Titre : Inspecteur gadget

### Points : 500

------

### Description

------

gogo gadgeto firefox!
Mince Sophie, j'ai encore tout cassé.

http://10.10.10.2:8085

------

### Réalisation

------

Objectif : Montré que dans une page HTML, on peut ajouter des champs et tout ce que l'on souhaite et les transmettre au serveur.

Dans le fichier index.php on a le code suivant :

```php
<?php
   if(isset($_POST["user"]) and $_POST["user"]=="admin" 
      and isset($_POST["password"]) and $_POST["password"]=="admin")
  		echo "<p style='color:white'>CRYPTIS{d0n_t_f0rg3t_t0_ch4ng3_p4ssw0rd}</p>";
  ?>

```

------

### Résolution

------

Il n'y a pas de grand difficulté ici. il faut trouver le bon champ a envoyer dans le post et les bonnes informations.
On peut soit utiliser un navigateur web ou utiliser Postman par exemple. Ou sinon on peut directement utiliser la commande `curl` :

```bash
$ curl -X POST -d "user=admin&password=admin" http://ip:port/index

```

`CRYPTIS{d0n_t_f0rg3t_t0_ch4ng3_p4ssw0rd}` 

