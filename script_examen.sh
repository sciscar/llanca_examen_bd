#/bin/bash
apt update
apt install -y iptables
snap install docker
groupadd docker
useradd -s /bin/bash -m examen
echo examen:examen | chpasswd
gpasswd -a examen docker
su examen -c 'git clone https://github.com/sciscar/bd_examen.git && cd bd_examen && docker-compose up -d'
#sleep 30
#sh -c 'echo " pre-up iptables -A OUTPUT -p tcp -m owner --uid-owner examen -j DROP" >> /etc/network/interfaces'
#iptables -A OUTPUT -p tcp -m owner --uid-owner examen -j DROP
