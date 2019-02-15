---
layout: post
title: "EVENT_02 - Writeups"
categories: Events
excerpt_separator:  <!--more-->
---
<!--more-->

### Date : 13/02/2019 - 18h (<a href="https://slides.com/adelalm/event_02" target="_blank">slides</a>)

<details><summary><h3 style="display: inline;">Menu</h3></summary><ul><li><a href="#stega_0001_welcome">stega_0001_welcome</a></li>
<li><a href="#stega_0010_mail">stega_0010_mail</a></li>
<li><a href="#stega_0100_titanic">stega_0100_titanic</a></li>
<li><a href="#stega_0200_art">stega_0200_art</a></li>
<li><a href="#stega_0300_johnny">stega_0300_johnny</a></li>
<li><a href="#stega_0300_mysterybox">stega_0300_mysterybox</a></li>
<li><a href="#stega_0200_sonic">stega_0200_sonic</a></li>
<li><a href="#stega_0300_jon">stega_0300_jon</a></li>
<li><a href="#stega_0199_inutile_v2">stega_0199_inutile_v2</a></li>
<li><a href="#stega_0300_anti_sonic">stega_0300_anti_sonic</a></li>
<li><a href="#stega_0300_apollo">stega_0300_apollo</a></li>
<li><a href="#stega_0300_colorimetrie">stega_0300_colorimetrie</a></li>
<li><a href="#stega_0250_html">stega_0250_html</a></li>
<li><a href="#stega_0400_samuel">stega_0400_samuel</a></li>
<li><a href="#stega_0600_lsb">stega_0600_lsb</a></li>
</ul></details>

# stega_0001_welcome

---

### Titre : Welcome

### Point : 1

------

### Description

------

Dobby est un elfe liiiibre !

------

### Réalisation

------

```bash
$ flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
```

* Ajout du texte sur l'image à l'aide de gimp préalablement installé

------

### Résolution

------

* Il suffit d'observer l'image et de recopier le flag

`CRYPTIS{Welc0m3_1n_5teg4no}`

# stega_0010_mail

------

### Titre : Mail

### Points : 10

------

### Description

------

Cherchez un flag dans le mail que vous avez reçu pour cet événement.

------

### Réalisation

------

Nous allons ajouter un lien qui va pointer sur une page `secret.html` sur le site [teamcryptis.fr](http://team-cryptis.fr). Nous allons encoder ce lien en `base64`.

```bash
$ echo -n 'http://teamcryptis.fr/secret.html' | base64
aHR0cDovL3RlYW1jcnlwdGlzLmZyL3NlY3JldC5odG1s
```

On ajoute donc `aHR0cDovL3RlYW1jcnlwdGlzLmZyL3NlY3JldC5odG1s` à la fin du mail de l'`event_02`.

------

### Résolution

------

En regardant le mail, on voit une chaine de caractères qui se trouve tout en bas. Il s'agit d'un encodage en `base64`. Il faut alors le décoder.

```bash
$ echo -n 'aHR0cDovL3RlYW1jcnlwdGlzLmZyL3NlY3JldC5odG1s' | base64 -d
http://teamcryptis.fr/secret.html
```

On se rend sur le site, et le flag se trouve bien sur la page.

`CRYPTIS{10_points_:)}`
# stega_0100_titanic

---

### Titre : Titanic

### Points : 100

---

### Description

---

Certaines choses peuvent en cacher des plus grandes...

Voici une image interceptée : `iceberg.jpg`

---

### Réalisation

---

Les **métadata** sont des données servant à définir ou décrire une autre donnée quel que soit son support. Certaines images contiennent des métadonnées que vous pouvez lire pour déterminer les fonctionnalités de l’image et vous pouvez également écrire de nouvelles métadonnées.

Pour ce challenge, nous allons utiliser une photo à laquelle nous allons ajouter une **métadata** qui sera un commentaire. Ce commentaire sera le flag encodé en hexadécimal.

```bash
# flag en hexadécimal
$ echo "CRYPTIS{warning_metadata}" | xxd -ps
435259505449537b7761726e696e675f6d657461646174617d0a
```
Nous utilisons l'outil `exiftool` afin d'ajouter un champ commentaire à notre image. Ce dernier sera donc notre **metadata**.

```bash
# ajout metadata
$ exiftool -comment="435259505449537b7761726e696e675f6d657461646174617d0a" iceberg.jpg
```

---

### Résolution

---

Pour résoudre ce challenge nous allons utiliser l'outil `exiftool` afin de connaitre les **metadata** d'une image.

```bash
$ exiftool iceberg.jpg
ExifTool Version Number         : 11.16
File Name                       : iceberg.jpg
Directory                       : .
File Size                       : 1016 kB
File Modification Date/Time     : 2019:02:09 15:25:15+01:00
File Access Date/Time           : 2019:02:09 15:25:15+01:00
File Inode Change Date/Time     : 2019:02:09 15:25:15+01:00
File Permissions                : rw-r--r--
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
Comment                         : 435259505449537b7761726e696e675f6d657461646174617d0a
Image Width                     : 3024
Image Height                    : 4032
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:2:0 (2 2)
Image Size                      : 3024x4032
Megapixels                      : 12.2
```

Parmi les champs, on peut voir `Comment: 435259505449537b7761726e696e675f6d657461646174617d0a`. Cette valeur ressemble à de l'hexadécimal. Essayons de passer en ascii.

```bash
# hex to ascii
$ echo '435259505449537b7761726e696e675f6d657461646174617d0a' | xxd -ps -r
CRYPTIS{warning_metadata}
```

`CRYPTIS{warning_metadata}`

# stega_0200_art

------

### Titre : Art

### Points : 200

------

### Description

------

Les artistes ont souvent essayé de laisser des messages dans leurs oeuvres.

------

### Réalisation

------

* On utilise https://manytools.org/hacker-tools/convert-images-to-ascii-art/ afin de reproduire le logo de la Team CRYPTIS.

* On cache ensuite le flag en disperçant les lettres au milieu de tous les autres caractères.

* On rajoute ce texte dans une page HTML. 

------

### Résolution

------

Première solution

On utilise la commande `sed` nous permettant d'afficher le contenu d'un fichier en supprimant certains éléments. 

Nous allons donc supprimer tous les caractères inutiles. 

En plus de cela, nous remplacerons les espaces et les retours à la ligne avec la commande `tr` par '' .

Enfin, nous récupérerons la ligne qui commence, nous l'espérons, par l'intitulé du flag.

```bash
$ sed 's/[&@(#?.$\/\%*,]//g' art.html | tr -d '\n' | tr -d ' ' | grep "CRYPTIS"
<html><head><metahttp-equiv="content-type"content="texthtml;charset=windows-1252"><head><body><code><spanstyle="display:block;line-height:8px;font-size:8px;font-weight:bold;white-space:pre;font-family:monospace;color:black;background:white;">CRYPTIS{St3g4_1s_4rt}<span><code><body><html>
```

Bingo !

Seconde solution :

On remarque la présence de lettres parmi de nombreux caractères qui se répètent. On décide de les éliminer en utilisant par exemple Ctrl + Maj + F afin de remplacer tous les "&" par "" par exemple. 

Une fois qu'on a tout supprimé, il nous reste à recoller les morceaux pour retrouver le flag.

`CRYPTIS{St3g4_1s_4rt}`

# stega_0300_johnny

---

### Titre : Johnny

### Points : 300

---

### Description

---

Nous avons intercepté une image : file.

Veuillez retrouver le message transmis en secret !

---

### Réalisation

---

* Utilisation de l'outil steghide pour cacher de l'information dans l'image, en l'occurence ici, le flag.
  * *L'outil **Steghide** est un programme de stéganographie capable de masquer des données dans divers types de fichiers image et audio. Les fréquences d'échantillonnage respectueuses de la couleur ne sont pas modifiées, ce qui rend l'incorporation résistant aux tests statistiques de premier ordre.*

```bash
# Création du fichier contenant le flag
$ echo "CRYPTIS{p3Tit_J0hN}" > flag.txt
# Insertion du fichier à l'image avec une protection par mot de passe
$ steghide --embed -ef flag.txt -cf john.jpg -e none -Z
Enter passphrase : strawberries
Re-Enter passphrase : strawberries
camouflage des données de "flag.txt" dans "john.jpg". terminé.
```

---

### Résolution

---

* Une **WordList** est un fichier texte représentant un dictionnaire de mot de passe connu, probable ou même ciblé à la personne après l'étude de cette dernière. Elle permet de faire des attaques de mots de passe avec l'utilisation de cette liste afin d'éviter une fastidieuse et/ou infructueuse attaque par force brute.
* **Stegcracker** est un simple outil de brute force sur une image *stéganographiée* pouvant utiliser une WordList.
* Le mot de passe étant assez simple à cracker, il suffit d'employer une attaque par dictionnaire
  * Wordslist utilisé : rockyou.txt
  * Outil de crack : stegcracker

```bash
# Lancement du crack
$ stegcracker john.jpg rockyou.txt 
StegCracker - (https://github.com/Paradoxis/StegCracker)
Copyright (c) 2019 - Luke Paris (Paradoxis)

Attacking file 'john.jpg' with wordlist '../../rockyou.txt'..
Successfully cracked file with password: strawberries
Your file has been written to: john.jpg.out
# Lecture du fichier généré par le succès du crack
$ strings john.jpg.out
CRYPTIS{p3Tit_J0hN}
```

`CRYPTIS{p3Tit_J0hN}`

# stega_0300_mysterybox

------

### Titre : Mysterybox

### Points : 300

------

### Description

------

Votre avez reçu ce fichier, signalé comme important par votre collègue.

------

### Réalisation

------

On commence par mettre le flag dans un fichier .txt.

```bash
$ echo "CRYPTIS{S1mpl3_St3g4}" > flag.txt
```

On compresse ensuite ce fichier.

On modifie son nom.

```bash
$ mv flag.txt.zip mysterybox.zip
```

On télécharge une image, que l'on nommera `mystere.jpg`.

On utilise la commande suivante pour cacher le fichier ZIP dans l'image :

```bash
$ cat mystere.jpg mysteryzip.zip > mysterybox.png
```

On obtient une nouvelle image dans laquelle est cachée le fichier ZIP.

------

### Résolution

------

On récupère une image.

Après inspection avec la commande `file` on ne trouve rien d'intéressant.

```bash
$ file mysterybox.png 
mysterybox.png: JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 276x182, frames 3
```

Cependant la commande `strings` nous affiche un fichier `flag.txt` qui serait contenu vraisemblablement dans l'image.

```bash
$ strings mysterybox.png
...
__MACOSX/._flag.txtUX

cg`b`
85%%
$U9 
d`0G
O4*K/H-4
HMJ5K
j.-I
646124
flag.txtUX
Q]\PK
__MACOSX/UX
Q]\PK
__MACOSX/._flag.txtUX
Q]\PK
```

On utilise donc la commande :

```bash
$ binwalk -e mysterybox.png
```

On obtient un dossier dans lequel on retrouve le flag.txt

`CRYPTIS{S1mpl3_St3g4}`

# stega_0200_sonic

---

### Titre : Sonic

### Points : 200

---

### Description

---

Nos espions ont intercepté cette communication lors de leur dernière mission. Aidez-nous à trouver ce qui se cache derrière cette dernière. Bonne chance.

---

### Réalisation

---

Le but de ce challenge est de cacher un flag dans un fichier audio. Ce type de challenge est souvent présent dans les CTF. Voici les étapes pour créer un son à partir de l'image d'un flag :

* avoir une image en noir et blanc sur laquelle se trouve un flag
* ouvrir cette image avec __Coagula (Windows)__
* écouter l'audio : `Sound > Render Without Blue`
* enregistrer l'audio : `File > Save Sound As ...`

On se retrouve maintenant avec un fichier audio, on peut vérifier ça avec la commande `file` qui permet de connaître le type d'un fichier.

```bash
$ file sonic.wav
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

* ouvrir le fichier `sonic.wav`  avec le logiciel d'analyse de fichiers audio `Sonic Visualiser`
* inspecter le spectrogramme : `Layer > Add Spectrogram > All Channels Mixed`
* Paramètres :
  * Color : Black on White
  * Scale : dBV | None
  * Window : 512 | 93.75 % | 4x
  * Bins : All Bins | Linear

Avec ces bons paramètres, on peut facilement lire les lettres de flag.

`CRYPTIS{Sonic_Visualis3r}`
# stega_0300_jon

---

### Titre : Jon

### Points : 300
---

### Description

---

Un fan de game of thrones s'amuse à échanger des messages codés...

---

### Réalisation

---

Comme quoi on peut cacher du texte n'importe où.
```bash
$ stegsnow -m "CRYPTIS{Th3_w1nt3R_1s_H3r3}" -C jon.txt >jon.txt.snow
Compressed by 8540159293384050688.00%
Message exceeded available space by approximately inf%.
An extra 8 lines were added.
```

---

### Résolution

---

Ici, on a un texte avec plein de blanc a la fin .... On remarque que le nom du challenge est juste "Jon" et que tout le texte parle de Jon Snow. Peut-être Snow est un indice ? Après une petite recherche avec notre ami google on découvre un outil stegsnow qui permet de cacher du texte dans du texte.

On exécute la commande suivante :

```bash
$ stegsnow jon.txt
Warning: residual of 4 bits not output
�ӓ��s�JxWD�
           K*ӯ�X_�4���w
```

On obtient un résultat qui ne semble pas être ouf. Après une lecture du man, on peut tester l'option -C pour compress

```bash
$ stegsnow -C jon.txt.snow
CRYPTIS{Th3_w1nt3R_1s_H3r3}
```

# stega_0199_inutile_v2

------

### Titre : Inutile 2.0

### Points : 199

------

### Description

---

Les descriptions de challenge c'est sur-côté.

------

### Réalisation

------

On récupère l'héxadécimal du flag.

```bash
$ echo -n "CRYPTIS{D4yly_l1f3_St3g4}" | hexdump -e '32/1 "%02x"'
43 52 59 50 54 49 53 7b 44 34 79 6c 79 5f 6c 31 66 33 5f 53 74 33 67 34 7d
```

* Puis on crée une page HTML affichant des produits, leur quantité et leur identifiant.
* On crée 25 produits classés par ordre alphabétique.
* La " quantité " de ces objets représentera les valeurs en hexadécimal (on remplacera les lettres par un mot commençant par la même lettre en majuscule).
* Puis on classe ces produits dans le désordre.
* Enfin, on ajoute les identifiants qui formeront un mauvais flag.

------

### Résolution

------

On trouve quelque chose qui ressemble à une liste de produits. 

Notre intuition nous porte à croire que les quantités sont des valeurs hecadécimales. 

Une fois récupérées et traduites, on obtient un flag, mais dans le désordre.

```bash
$ echo 7D6C3343506749346C5F79545334593144797453335F527B66 | xxd -r -p
}l3CPgI4l_yTS4Y1DytS3_R{
```

On remarque alors que les produits pourraient être classés par ordre alphabétique. 

On trouve alors :

```
43 52 59 50 54 49 53 7b 44 34 79 6c 79 5f 6c 31 66 33 5f 53 74 33 67 34 7d 
```

On va traduire une nouvelle fois :

```bash
$ echo 43 52 59 50 54 49 53 7b 44 34 79 6c 79 5f 6c 31 66 33 5f 53 74 33 67 34 7d | xxd -r -p
```

On a notre flag ! 

`CRYPTIS{D4yly_l1f3_St3g4}`

# stega_0300_anti_sonic

---

### Titre : Anti Sonic

### Points : 300

---

### Description

---

Trouvez le flag caché dans ce fichier.

Basique.

---

### Réalisation

---

Le but de ce challenge est de brouiller les pistes en faisant croire que le flag se trouve dans  le spectrogramme d'un fichier audio (idée classique lorsque l'on voit un fichier audio en CTF).

Réalisation du fichier audio :

- avoir une image en noir et blanc sur laquelle se trouve un message
- ouvrir cette image avec __Coagula (Windows)__
- écouter l'audio : `Sound > Render Without Blue`
- enregistrer l'audio : `File > Save Sound As ...`

On se retrouve maintenant avec un fichier audio, on peut vérifier ça avec la commande `file` qui permet de connaître le type d'un fichier.

```bash
$ file anti_sonic.wav
sonic.wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, stereo 22050 Hz
```

Pour terminer, ajoutons notre flag avec un simple `echo` avec la redirection `>>` qui permet de rediriger la sortie standard dans `anti_sonic.wav`, sans écraser le contenu de ce dernier.

```bash
$ echo "CRYPTIS{good_job<3}" >> anti_sonic.wav
```

---

### Résolution

---

L'écoute du fichier n'apporte pas grand chose sur la manière de trouver le flag. Utilisons le commande `file` pour s'assurer que nous avons bien un fichier audio `wav`.

```bash
$ file anti_sonic.wav
sonic.wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, stereo 22050 Hz
```

C'est donc bien le cas. Utilisons maintenant `Sonic Visualiser` afin d'analyser le spectrogramme de l'audio.

* ouvrir le fichier `sonic.wav`  avec le logiciel d'analyse de fichiers audio `Sonic Visualiser`
* inspecter le spectrogramme : `Layer > Add Spectrogram > All Channels Mixed`

Il faut maintenant jouer sur les paramètres afin de rendre lisible le contenu (s'il y en a). On se rend finalement compte que le flag n'est pas dans le spectogramme...

Néanmoins, il existe quelques règles de bonnes pratique lorsqu'on débute un challenge.

Si c'est un fichier, le passer sous les outils `file` et `strings` est un minimum.

* `strings`: affiche les chaines de caractères affichables du fichier cible.

* `grep`: affiche les lignes contenant la chaîne mis en paramètre du fichier cible.

```bash
$ strings anti_sonic.wav | grep CRYPTIS
CRYPTIS{good_job<3}
```

`CRYPTIS{good_job<3}`



# stega_0300_apollo

---

### Titre : Apollo

### Points : 300

---

### Description

---

Nous avons retrouvé une transmission d'Apollo, arriverez-vous à la décoder ?

---

### Réalisation

---

Pour la création de ce challenge nous avons utilisé le dépot git suivant : 

[Robot36](https://github.com/xdsopl/robot36/) 

Il permet d'encoder une image vers un fichier audio (on va éviter d'appeler ça de la musique xD) ou l'inverse.

```bash
$ robot36/encode flag.ppm flag.wav
```
---

### Résolution

---

Pour décoder ce message, on peut utiliser plusieurs méthodes : 

=> Avec un téléphone et l'application [Robot36](https://play.google.com/store/apps/details?id=xdsopl.robot36) mais douloureux pour les oreilles 

=>Robot36

```bash
$ robot36/decode flag.wav output.ppm
$ display output.ppm
```

`CRYPTIS{4p0ll0_fl4g}`

# stega_0300_colorimetrie

------

### Titre : Colorimétrie

### Points : 300

------

### Description

------

Nous avons intercepté cette image : colorimetrie.jpg.

Hint : Nous pensons que les couleurs peuvent nous dire quelque chose, veuillez vérifier !

Veuillez entrer la solution sous la forme CRYPTIS{*message*}.

------

### Réalisation

------

- Le codage RGB consiste à représenter l'espace des couleurs à partir de trois rayonnements monochromatiques de couleurs : rouge, vert et bleu.

  Ainsi, le modèle RGB propose de coder sur un octet chaque composante de couleur, ce
  qui correspond à 256 intensités de rouge, 256 intensités de vert et 256 intensités
  de bleu.

- Création de l'image

  - Conversion du message dans le flag en décimal : ASCII(te1nte5_rgb) -> B10(116 101 49 110 116 101 53 95 114 103 98)

  - Chaque cube de l'image représente 3 lettres successives du flag

  - La taille du cube représente la position des lettres dans le message

  - Palette RGB : 

    - Nuance de rouge représente la valeur décimale de la première lettre,
    - Nuance de vert représente la valeur décimale de la seconde lettre,
    - Nuance de bleu représente la valeur décimale de la troisième lettre.

  - J'ai utilisé paint pour créer les couleurs

------

### Résolution

------

* Utilisation d'un site générant les palettes de couleur d'une image : https://html-color-codes.info/colors-from-image/
  * Récupération des valeurs héxa de chacune des couleurs des rectangles puis les convertir en ascii
  * Le message est la mise dans le bon ordre des chaînes obtenues par rapport aux aires des rectangles : des plus grandes aux plus petites.

`CRYPTIS{te1nte5_rgb}`

# stega_0250_html

---

### Titre : HTmL

### Points : 250

---

### Description

---

Un développeur s'est amusé a caché un message sur ce site web : http://10.10.10.2

Mais est-ce bien caché ?

---

### Réalisation

---

La partie intéressante ici est que le débuggeur HTML ne montre pas les majuscules des balises. Il faut donc penser à aller dans le code source de la page.

On va ensuite exécuter le code python et le tour est joué.
```python
def writeData(data,name_file):
    file=open(name_file, "r")
    new_file=open(name_file+".new", "w")
    i=0
    for line in file:
        changeline=""
        if line.rstrip()=="<!DOCTYPE html>":
            continue
        balise=False
        for indice in range(len(line)):
            if line[indice] =="<":
                balise=True
            elif line[indice]==" "or line[indice]==">":
                balise=False
            if balise and line[indice] in "abcdefghijklmnopqrstuvwxyz" and i<len(binary_message):
                if binary_message[i]=="0":
                    changeline+=line[indice].upper()
                    i+=1
                else:
                    changeline+=line[indice]
                    i+=1
            else:
                if i==len(binary_message) and not balise:
                    i+=1
                    changeline+=" STOPHERE"
                changeline+=line[indice]

        new_file.write(changeline)
```
---

### Résolution

---

Deux options s'offrent à vous :
 --> à la main (mais faut être un peu fou!)
 --> faire un script (c'est quand même plus sympa :wink: )

```python
def readData(name_file):
    file=open(name_file, "r")
    s=""
    nextStop=False
    for line in file:
        res=re.findall("<([a-zA-Z]+)|<\/([a-zA-Z]+)",line)
        if nextStop:
            break
        if "STOPHERE" in line:
            nextStop=True
        for tuple in res:
            tex=tuple[1]
            if tuple[0]!="":
                tex=tuple[0]
            for c in tex:
                if c.isupper():
                    s+="0"
                elif not c.isupper() :
                    s+="1"
    return s
```
on obtient ensuite une suite de 0/1
```
0100001101010010010110010101000001010100010010010101001101111011011010000011000101000100011001000011001101101110010111110110110100110011011100110101001100110100011001110011001101011111001100010110111001011111011101000011010001100111010100110111110111
```
On a plus qu'à le traduire en ASCII.
`CRYPTIS{h1Dd3n_m3sS4g3_1n_t4gS}`

# stega_0400_samuel

------

### Titre : Samuel. -

### Points : 400

------

### Description

------

Notre ami Samuel nous a envoyé un fichier. Découvrez ce qu'il vous a dit. 

Veuillez entrer la réponse sous la forme : CRYPTIS{réponse}.

------

### Réalisation

------

On utilise http://www.unit-conversion.info/texttools/morse-code/ afin d'écrire le flag en morse.

```
m0rse_1s_th3_n3w_fl4g
```

Nous donnera :

```bash
-- ----- .-. ... . ··--·- .---- ... ··--·- - .... ...-- ··--·- -. ...-- .-- ··--·- ..-. .-.. ....- --.
```

Après cela, on télécharge 3 images : un point, un trait et un carré. Ce dernier représentera l'espace entre les mots. 

On compose ensuite un fichier .gif animé avec le site https://giphy.com/create/gifmaker .

------

### Résolution

------

La description du challenge nous indique qu'un message est caché dans le fichier reçu. 

Ce dernier est un GIF. On y remarque la présence de points, de traits et de carrés. Cela ressemble étrangement a du morse...

On utilisera https://ezgif.com/split afin de voir ce que contient le GIF.

On tombe effectivement sur du morse ! 

Une fois déchiffré avec le site http://www.unit-conversion.info/texttools/morse-code/, on retrouve le flag.

`CRYPTIS{m0rse_1s_th3_n3w_fl4g}`

# stega_0600_lsb

---

### Titre : lsb

### Points : 600
---

### Description

---

Michael Jackson serait-il toujours parmi nous ?

---

### Réalisation

---

Le challenge a été fait pour faire découvrir que l'on peut cacher des informations en LSB aussi en musique. 

LSB => on va cacher des données dans les bytes de poids faibles de la musique.

Ainsi, lorsque l'on écoute la musique, on entend absolument rien de choquant cependant un message a été caché à l'intérieur de celle-ci ;-) .

```python
#!/usr/bin/python3
import wave

# read wave audio file
song = wave.open("michael.wav", mode='rb')

# lecture de la musique
# song.getnframes => retourne le nombre de frame audio
# song.readframes => retourne n frames de la musique (String de bits)
# list => convertir une chaine de caractères en liste
# bytearray => retourne un objet de type bytearray
frame_bytes = bytearray(list(song.readframes(song.getnframes())))

string='CRYPTIS{M1ch43l_J4cks0n_st1ll_4_l1v3}'
#On va completer la suite par des #
nbhast=int((len(frame_bytes)-(len(string)*8*8))/8)
string = string + nbhast*'#'


# Convert text to bit array
tableau=[]
for caractere in string:
    # valeur_binaire du caractere qu'on va ajouter
    valeur_binaire=bin(ord(caractere))

    # 0b1110100.lstrip('0b') ==> 1110100
    # 1110100.rjust(8,'0') ==> 01110100 -- ajoute des 0 pr que le nombre de bits soit de 8
    valeur_binaire=valeur_binaire.lstrip('0b').rjust(8,'0')
    tableau.append(valeur_binaire)

# Convertir la liste de string en liste de int (où chaque valeur du tableau est 1 bits)
# exemple :
#  ['01000011', '01010010'] ==> [0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0]
bits = list(map(int, ''.join(tableau)))

# On va remplacer les bites de
for i, bit in enumerate(bits):
    # on a nos 8 bits
    # on va faire un & logique avec 254 pour le dernier bit a 0
    # exemple :
    #  1010 1011 & 254 => 1010 1010
    # puis un ou logique pour ajouter le bit contenant notre information
    # 1010 1010 & 1 => 1010 1011
    frame_bytes[i] = (frame_bytes[i] & 254) | bit

# on convertir en bytes
frame_modified = bytes(frame_bytes)

#on ecrit le nouveau fichier
with wave.open('song_embedded.wav', 'wb') as fd:
    fd.setparams(song.getparams())
    fd.writeframes(frame_modified)
song.close()
```

---

### Résolution

---

```python
#!/usr/bin/python3
import wave
song = wave.open("song_embedded.wav", mode='rb')

#On obtient un objet de type bytearray representant notre musique
frame_bytes = bytearray(list(song.readframes(song.getnframes())))

extracted=[]
for i in range(len(frame_bytes)):
    #On fait un & logique avec 1 pour obtenir le dernier bit
    extracted.append(frame_bytes[i] & 1)

# extracted = [frame_bytes[i] & 1 for i in range(len(frame_bytes))]
string_array=[]
for i in range(0,len(extracted),8):
    #on recuperes les 8 prochains bits (String)
    bites="".join(map(str,extracted[i:i+8]))
    #on le convertis en binaire
    decimal=int(bites,2)
    #on ajoute le caractere
    if chr(decimal) =="#":
        break
    string_array.append(chr(decimal))

string = "".join(string_array)

print("Sucessfully decoded: "+string)
song.close()
```

```bash
$ python3 decrypt.py
Sucessfully decoded: CRYPTIS{M1ch43l_J4cks0n_st1ll_4_l1v3}
```

`CRYPTIS{M1ch43l_J4cks0n_st1ll_4_l1v3}`

