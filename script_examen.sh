#/bin/bash
apt update
apt install -y iptables
snap install docker
useradd -s /bin/bash -m -G docker examen
echo examen:examen | chpasswd
su examen -c 'git clone https://github.com/sciscar/bd_examen.git && cd bd_examen && docker-compose up -d'
#sh -c 'echo " pre-up iptables -A OUTPUT -p tcp -m owner --uid-owner examen -j DROP" >> /etc/network/interfaces'
iptables -A OUTPUT -p tcp -m owner --uid-owner examen -j DROP
