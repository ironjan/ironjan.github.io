---
title: Trouble mit dem Play Store
author: ironjan
date: 2017-06-12T18:00:00+00:00
layout: post
categories:
  - All
  - Projekte
  - Metal Only
---

{% include image name="google_play_notification_impersonation.png" caption="Metal Only wurde aus Play Store entfernt" %}

Eines meiner Projekte - die App für den [Metal Only e. V.](https://www.metal-only.de/) - wurde vor kurzem aus dem Play Store entfernt. 
In diesem Post möchte ich kurz beschreiben, welche Schritte notwendig waren, 
die App wieder in den Store zu bekommen. 

<!--more-->

Bei der Wiedereinstellung wurde vom 
Google Play Review Team eine angebliche Violation der [Payment Policy](https://play.google.com/about/monetization-ads/payments/) 
festgestellt, um die sich ebenfalls gekümmert werden musste. Da letzteres ein 
Wiederholungsfall war, wusste ich hier zumindest, wie ich vorgehen musste. Das 
einzige Problem war nur noch: die Entfernung und Sperrung von Apps geschieht 
automatisch und sehr schnell – die manuelle Überprüfung der Appeals dauert 
jedoch einige Zeit.

Die Notification Mail spricht von maximal 72 Stunden. Bei der ersten Payment 
Policy Violation war dies tatsächlich der Fall. Die Clearance beiden anderen 
anderen Violations dauerte teilweise länger.

## Payment Policy Violation

{% include image name="google_play_notification_payment_policy.png" alt="Violation der Payment Policy" %}

Grund für diese Violation war das Einbinden einer Spenden-Funktion in der App, 
ohne die [Google Play In-App-Abrechnung](https://developer.android.com/google/play/billing/index.html) zu 
verwenden. Der Grund hierfür war sehr pragmatisch: Metal Only e. V. nimmt 
Spenden nur über Paypal oder Überweisung entgegen, weshalb eine echte Spenden-Funktion in der App nicht notwendig war. Stattdessen wird der Nutzer 
an Paypal weitergeleitet, über welches die Spendenvorgänge abgewickelt werden.

Nach einem kurzem Dialog mit dem Support Team stellte sich heraus, dass meine 
App die Payment Policy nicht verletzt:

 * Es handelt sich um Spenden und keine Kaufvorgänge
 * Die Spenden werden für eine annerkannte, gemeinnützige Organisation 
   gesammelt

Da meine App diese Kriterien erfüllt, konnte die Payment Policy Violation 
geklärt werden und die App durfte unverändert im Store bleiben.

## Impersonation Policy Violation

{% include image name="google_play_notification_impersonation.png" caption="Angebliche Verletzung der Impersonation Policy" %}

Diese Violation hat mich sehr überrascht, da die App laut Google Play 
Publisher Dashboard seit Dezember 2013 veröffentlicht ist. Es ist sehr 
erfreulich, dass Google eine Impersonation Policy hat. Ärgerlich ist nur, dass 
die Entfernung sofort ohne Kontaktaufnahme erfolgt. 

Hier der grobe Ablauf der Violation Clearance (Zeitangaben in MEZ, war zu dem Zeitpunkt in MEZ+1):

 * 12. Mai 2017 um 02:37: Entfernung der App
 * 12. Mai 2017 um 06:36: Gespräch mit Wolle, um eine erneute (aber 
   schriftliche) Erlaubnis zur Nutzung des Names und der Assets des Metal Only e. V.s zu bekommen
 * 12. Mai 2017 um 10:49: Einreichung des Appeals mit schriftlicher Erlaubnis
 * 20. Mai 2017 um 02:54: Acceptance des Appeals, Wiedereinreichung der App
 * 20. Mai 2017 um 13:10: Violation der Payment Policy

## Payment Policy Violation 2

Leider gab es nach Wiedereinreichung der App ein erneutes Problem: trotz 
mehrerer erfolgreicher Updates seit Clearance der Payment Policy Violation 
wurde erneut eine angebliche Verletzung dieser Policy festgestellt. Dank der 
ersten Erfahrung wusste ich, welche Infos benätigt wurden; dennoch dauerte die 
Klärung dieses Mal deutlich länger:

 * 20. Mai 2017 um 13:20: Einreichung des Appeals inkl. der Infos vom ersten 
   Appeal mit Ticketnummer
 * 27. Mai 2017 um 14:46: Push des Tickets
 * 1. Juni 2017 um 08:46: Zweiter Push des Tickets
 * 7. Juni 2017 um 11:53: Antwort des Play Supports, Appeal wird akzeptiert
 * 7. Juni 2017 um 13:11: Danke an den Support mit Bitte um "Anbringen einer 
   Notiz", damit ich nicht erneut Payment Policy Violations kriege ;)
 * 8. Juni 2017 um 05:04: Notiz wurde "an meiner App angebracht"

## Fazit

> Gemeinsam zur weltweit vertrauenswürdigsten Quelle für Apps und Spiele werden
> [Richtlinienübersicht für Entwickler](https://play.google.com/about/developer-content-policy/)

Aufgrund meiner Erfahrungen habe ich gemischte Gefühle. Einerseits finde ich 
es gut, dass Google schnell gegen Violations vorgeht. Andererseits dauerte die 
vollständige Klärung meiner Appeals sehr lange und mir wäre viel Ärger durch 
eine vorherige Kontaktaufnahme erspart geblieben. Besonders die Verletzung der 
Impersonation Policy hätte vor Entfernung der App geklärt werden können. 12-24 
Stunden Reaktionszeit für den Entwickler wären völlig ausreichend – nicht bei 
jeder App natürlich, aber Metal Only war bereits mehr als 2 Jahre ohne ungeklärte Violations im Store :/

Insbesondere die Entfernung der App traf mich hart: nach jeder Clearance ist 
ein Update erforderlich, egal in welcher Form. Falls das Update aufgrund einer 
weiteren Violation zurückgehalten wird, kann das ganze dauern. Ein 
wiederholtes Verletzen von Policies kann zu einer Sperrung des ganzen Accounts 
führen, weshalb ich mich zum Abwarten entschlossen hatte. 
