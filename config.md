---
layout: page
title: Configuration
sidebar_link: true
---

---
# Configuration de l'hôte
---

Le but de cette partie est de configurer votre interface filaire afin qu'elle puisse être connectée au réseau.

---
### Configuration sur Windows
---

Ouvrez le **Menu Démarrer** afin d'acccèder au **Panneau de configuration**.
<img class="center" src="/assets/images/config/win-c1.png" alt="Menu démarrer"> 

---

Arrivé sur le Panneau de configuration, dans la partie Réseau et Internet cliquez sur **Afficher l'état et la gestion du réseau**.
<img class="center" src="/assets/images/config/win-c2.png" alt="Panneau de configuration"> 

---

Arrivé sur cette page, sélectionnez l'interface filaire de votre machine (lien en bleu).
<img class="center" src="/assets/images/config/win-c3.png" alt="Centre réseau et partage"> 

---

Cliquez ensuite sur **Propriétés**.
<img class="center" src="/assets/images/config/win-c4.png" alt="État de Ethernet0">

---

Sélectionnez **Internet Protocol Version 4 (TCP/IPv4)**
<img class="center" src="/assets/images/config/win-c5.png" alt="Propriétés de Ethernet0">

---

Vous arrivez sur la fenêtre de configuration de l'interface. Normalement, la case "Obtenir une adresse automatique" est coché, changez cela et mettez "**Utiliser l'adresse IP suivante**".
<img class="center" src="/assets/images/config/win-c6.png" alt="Configuration d'IPv4">

---

Vous pouvez maintenant rentrer votre adresse IP (fourni par les orga.) dans le champ "**Adresse IP**". Le "**Masque de sous-réseau**" est `255.255.255.0`.
<img class="center" src="/assets/images/config/win-c7.png" alt="Nouvelle configuration IPv4">

---

Enregistrez vos modifications, il vous faut maintenant configurer **VirtualBox**.


**REMARQUE IMPORTANTE !!** : pensez à refaire la même manipulation après le CTF en repassant sur "**Obtenir une adresse automatique**".

---
### Configuration sur Linux
---

```bash
$ sudo systemctl status network-manager
$ sudo systemctl stop network-manager

$ sudo ip addr add 10.10.10.1/24 dev eth0

$ sudo systemctl start network-manager

# tester, normalement avec des résultats
$ ping 10.10.10.1
```

---
# Configuration de VirtualBox
---

Pour commencez, éteignez votre machine, si cela n'est pas déjà fait. Puis selectionnez cette dernière. Cliquez ensuite sur "**Configuration**".
<img class="center" src="/assets/images/config/vb-c1.png" alt="VirtualBox accueil">

---

Arrivez sur la fenêtre de configuration, selectionnez "**Réseau**". Et sur l'onglet "**Interface 1**", cochez la case "***Activer l'interface réseau**" et choisisez le mode d'accès réseau "**NAT**". Enregistrez et lancez votre VM. Vous avez maintenenant un accès à internet ainsi que la possibilité de joindre la platforme pour le CTF.
<img class="center" src="/assets/images/config/vb-c2.png" alt="VirtualBox configuration">

Si vous rencontrez des problèmes, n'hésitez pas à sociliter les organisateurs :)
