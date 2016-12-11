---
id: 207
title: OpenVPN der UPB unter Linux
date: 2014-05-31T16:16:30+00:00
author: ironjan
layout: post
guid: http://ironjan.de/?p=207
permalink: /2014/05/31/openvpn-der-upb-unter-linux/
categories:
  - All
---
Auf den Seiten des IMT findet sich eine [Anleitung zum Einrichten des VPN-Zugriffs](https://hilfe.uni-paderborn.de/VPN_einrichten "Anleitung des IMTs"). Dort wird auch eine .conf-Datei bereitgestellt, welche vom Benutzer importiert werden soll. Da diese bei mir einige Probleme verursachte (VPN Zugriff nicht möglich, Freeze im Einstellungsbildschirm), habe ich folgende Ergänzungen zur IMT-Anleitung:

  * Beide Pfade (upb-network-ca.pem und Network_Certificate.p12) müssen in der Datei enthalten sein und absolut angegeben werden
  * &#8220;resolv-retry infinite&#8221; wurde entfernt (der oben genannte Freeze wurde durch eine Endlosschleife verursacht)

Hier eine von mir minimal korrigierte [openvpn-upb]({{ site.url }}/uploads/2014/05/openvpn-upb.conf). Die Pfade (s.o.) müssen noch korrigiert werden.

Edit: broken Link durch Redesign der Uni-Homepage gefixt.