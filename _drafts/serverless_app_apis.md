
- usually < 1 request per second
- busiest times:
  1. 2023-10-04 1450-1500 117 requests

based on that

far less than 86400 requests/day => < 2678400 reqs/month => Lambda-Kosten – mit kostenlosem Kontingent (monatlich): 0.34 USD
 + 2 outgoing per incoming request: 8035200 reqs/month -> 1.5 USD (AWS, Azure both)
 Estimate on 1: ~522288 reqs/month

# AWS Lambda
1 Million Anforderungen pro Monat kostenlos
Datenverarbeitungsservice, der Ihren Code beim Eintreten bestimmter Ereignisse ausführt und die Rechenressourcen entsprechend automatisch verwaltet.

1 000 000 Anforderungen pro Monat kostenlos 
Bis zu 3,2 Millionen Sekunden Rechenzeit pro Monat


# Microsoft Azure Functions

Meter			Free Grant (Per Month)	Pay as you go
Execution Time*		400,000 GB-s		€0.000016/GB-s
Total Executions*	1 million executions	€0.191 per million executions

