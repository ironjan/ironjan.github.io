---
id: 158
title: MensaUPB veröffentlicht
date: 2014-04-17T14:21:53+00:00
author: ironjan
excerpt: 'Vor einigen Tagen war es endlich so weit: die Open Source App MensaUPB konnte wieder im Play Store veröffentlicht werden.'
layout: post
guid: http://ironjan.de/?p=158
permalink: /2014/04/17/mensaupb-veroffentlicht/
categories:
  - All
  - Mensa UPB
  - Projekte
---
Vor einigen Tagen war es endlich so weit und [MensaUPB](https://play.google.com/store/apps/details?id=de.ironjan.mensaupb) konnte wieder im Play Store veröffentlicht werden. Auf expliziten Wunsch wird es auch hier Updates zur App geben &#8211; jedoch ohne Support.

[<img class="alignnone size-medium wp-image-161" src="http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-57-58-225x400.png" alt="Screenshot_2014-04-10-22-57-58" width="225" height="400" srcset="http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-57-58-225x400.png 225w, http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-57-58-112x200.png 112w, http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-57-58-576x1024.png 576w, http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-57-58-624x1109.png 624w, http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-57-58.png 720w" sizes="(max-width: 225px) 100vw, 225px" />]({{ site.url }}/uploads/2014/04/Screenshot_2014-04-10-22-57-58.png) [<img class="alignnone size-medium wp-image-162" src="http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-58-13-225x400.png" alt="Screenshot_2014-04-10-22-58-13" width="225" height="400" srcset="http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-58-13-225x400.png 225w, http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-58-13-112x200.png 112w, http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-58-13-576x1024.png 576w, http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-58-13-624x1109.png 624w, http://ironjan.de/wp-content/uploads/2014/04/Screenshot_2014-04-10-22-58-13.png 720w" sizes="(max-width: 225px) 100vw, 225px" />]({{ site.url }}/uploads/2014/04/Screenshot_2014-04-10-22-58-13.png)

Der Quellcode des Projekts ist auf [github](https://github.com/ironjan/MensaUPB) zu finden. Dieser ist zwar kompilierbar, kann jedoch kaum getestet werden, da die &#8220;geheime URL&#8221; (siehe unten) nicht weitergegeben werden darf.

Das Wiederveröffentlichen der App wurde hauptsächlich dadurch möglich, dass das Studentenwerk der Universität Paderborn nun auch eine Nutzung der Speisepläne erlaubt. Zudem wurde eine explizite Schnittstelle eingerichtet, damit Entwickler die Daten nutzen können. Vor Einrichtung dieser Schnittstelle wurden &#8220;halb-öffentliche&#8221; xml-Dateien (0) heruntergeladen, die Daten wurden extrahiert und lokal gespeichert bis sie nicht mehr aktuell waren.

Die neue Implementierung ist ähnlich, musste jedoch auf die neue CSV-Schnittstelle angepasst werden. Zudem wird nun auf das Android Sync Framework gesetzt. Dies erfordert zwar weitere Zugriffsrechte, jedoch wird die Implementierung erheblich vereinfacht.

Eine weitere Änderung betrifft das Design, welches nun auf Holo Light basiert, statt auf dark. Zudem wurde das Theme mit Hilfe von <http://android-holo-colors.com/> angepasst, um besser zum App-Icon zu passen.

[<img class="alignnone  wp-image-163" src="http://ironjan.de/wp-content/uploads/2014/04/ic_launcher-400x400.png" alt="ic_launcher" width="131" height="131" srcset="http://ironjan.de/wp-content/uploads/2014/04/ic_launcher-400x400.png 400w, http://ironjan.de/wp-content/uploads/2014/04/ic_launcher-200x200.png 200w, http://ironjan.de/wp-content/uploads/2014/04/ic_launcher.png 512w" sizes="(max-width: 131px) 100vw, 131px" />]({{ site.url }}/uploads/2014/04/ic_launcher.png)

Das Icon selbst wurde neu gestaltet, um &#8211; dem Android Design Guide folgende &#8211; &#8220;einen leicht erkennbaren Umriss&#8221; zu haben. Das grüne Dreieck im Hintergrund soll einerseits Messer und Gabel besser erkennbar machen, andererseits aber auch auf die nun deutlich bessere Zusammenarbeit mit dem Studentenwerk hinzuweisen: grün ist nämlich die Farbe, die im Re-Design des Stundentenwerks für die Gastronomie steht.

Ein Nachteil ist jedoch noch, dass die Speisepläne aus Gründen der Qualitätssicherung nicht komplett öffentlich nutzbar sind: jeder Entwickler muss explizit beim Studentenwerk anfragen, um eine eindeutige URL zu bekommen, die er in seiner Anwendung nutzen kann. Auch ist ungeklärt, ob diese geheime URL an Teammitglieder weitergegeben werden darf oder nicht.

Download der apk: [MensaUPB-v1.4.0]({{ site.url }}/uploads/2014/04/MensaUPB-v1.4.0.apk)

(0) Diese xml-Dateien wurden vom Studentenwerk weder beworben noch verlinkt, waren jedoch weitläufig bekannt und über eine Google-Suche zu finden.