#/bin/bash
apt update
apt install -y iptables
snap install docker
groupadd docker
useradd -s /bin/bash -m $1
echo $1:$1 | chpasswd
gpasswd -a $1 docker
mv llanca_examen_bd/lleva_conexio.sh /etc/init.d/
git clone https://github.com/sciscar/bd_examen.git 
cd bd_examen 
docker-compose up -d
mv llanca_examen_bd/examen /home/$1/Escriptori/examen
#su examen -c 'cd /home/examen && git clone https://github.com/sciscar/bd_examen.git && cd bd_examen && docker-compose up -d'
#sleep 30
#sh -c 'echo " pre-up iptables -A OUTPUT -p tcp -m owner --uid-owner examen -j DROP" >> /etc/network/interfaces'
iptables -A OUTPUT -p tcp -m owner --uid-owner $1 -j DROP

chmod +x /etc/init.d/lleva_conexio.sh
update-rc.d lleva_conexio.sh defaults 80
