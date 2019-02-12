---
layout: page
title: Config.
sidebar_link: true
---

Pour avoir accès à la plateforme de challenges ([CTFd](https://github.com/CTFd/CTFd)), vous devez configurer votre machine afin qu'elle puisse accèder au bon réseau.
Cette configuration est divisée en 2 étapes :
* [Configurer l'hôte](#configurer-l'hôte)
  - [Windows](#windows)
  - [Linux](#linux)
* [Configurer VirtualBox](#configurer-virtualbox)

---
# Configurer l'hôte
---

---
### Windows
---

<img class="center" src="/assets/images/config/win-c1.png" alt="Menu démarrer"> 

> Ouvrez le **Menu Démarrer** afin d'accèder au **Panneau de configuration**

---

<img class="center" src="/assets/images/config/win-c2.png" alt="Panneau de configuration"> 

> Dans la partie Réseau et Internet cliquez sur **Afficher l'état et la gestion du réseau**

---

<img class="center" src="/assets/images/config/win-c3.png" alt="Centre réseau et partage"> 

> Arrivé sur cette page, sélectionnez l'interface filaire de votre machine (lien en bleu).

---

<img class="center" src="/assets/images/config/win-c4.png" alt="État de Ethernet0">

> Cliquez ensuite sur **Propriétés**.

---

<img class="center" src="/assets/images/config/win-c5.png" alt="Propriétés de Ethernet0">

Sélectionnez **Internet Protocol Version 4 (TCP/IPv4)**

---

<img class="center" src="/assets/images/config/win-c6.png" alt="Configuration d'IPv4">

Vous arrivez sur la fenêtre de configuration de l'interface. Normalement, la case "Obtenir une adresse automatique" est coché, changez cela et mettez "**Utiliser l'adresse IP suivante**".

---

<img class="center" src="/assets/images/config/win-c7.png" alt="Nouvelle configuration IPv4">

Vous pouvez maintenant rentrer votre adresse IP (fourni par les orga.) dans le champ "**Adresse IP**". Le "**Masque de sous-réseau**" est `255.255.255.0`.

---

Enregistrez vos modifications, il vous faut maintenant configurer **VirtualBox**.


**REMARQUE IMPORTANTE !!** : pensez à refaire la même manipulation après le CTF en repassant sur "**Obtenir une adresse automatique**".

---
### Linux
---

```bash
# arrêter le service
$ sudo systemctl stop network-manager

# configurer l'interface filaire
$ sudo ip addr add 10.10.10.1/24 dev eth0

# relancer le service
$ sudo systemctl start network-manager
```

---
# Configurer VirtualBox
---

A cette étape, vous avez normalement accès à la platforme depuis votre système hôte. Rendez-vous sur [http://10.10.10.1](http://10.10.10.1) pour vous assurer que cela fonctionne.

<img class="center" src="/assets/images/config/vb-c1.png" alt="VirtualBox accueil">

> Pour configurer VirtualBox, éteignez d'abord votre VM, si cela n'est pas déjà fait. Puis sélectionnez cette dernière. Cliquez ensuite sur "**Configuration**".

---

<img class="center" src="/assets/images/config/vb-c2.png" alt="VirtualBox configuration">

Arrivez sur la fenêtre de configuration, sélectionnez "**Réseau**". Et sur l'onglet "**Interface 1**", cochez la case "**Activer l'interface réseau**" et choisissez le mode d'accès réseau "**NAT**". Enregistrez et lancez votre VM. Vous avez maintenant un accès à internet ainsi que la possibilité de joindre la plateforme pour le CTF.

<img class="center" src="/assets/images/config/vb-c3.png" alt="VirtualBox configuration">

Si vous rencontrez des problèmes, n'hésitez pas à soliciter les organisateurs :)
