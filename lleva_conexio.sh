iptables -A OUTPUT -p tcp -m owner --uid-owner examen -j DROP
