#!/bin/bash
#iptables-restore /home/Administrador/llanca_examen_bd/regles_iptables.txt
iptables -F
iptables -X
iptables -A OUTPUT -p tcp -d aules.edu.gva.es --dport 443 -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o wlan0 -p udp  --dport 53 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -o wlan0 -p tcp  --dport 53 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p tcp -d portal.edu.gva.es --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d fonts.googleapis.com --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d www.googletagmanager.com --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d www.google-analytics.com --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d cdnjs.cloudflare.com --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d fonts.gstatic.com --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d gva.es --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d cdn.jsdelivr.net --dport 443 -j ACCEPT
iptables -A OUTPUT -o wlan0  -p tcp -m owner --uid-owner examen -j DROP
