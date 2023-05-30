#/bin/bash
apt update
apt install -y iptables
snap install docker
groupadd docker
useradd -s /bin/bash -m examen
echo examen:examen | chpasswd
gpasswd -a examen docker
echo "*/1 *   * * *   root    /bin/sh /home/Administrador/llanca_examen_bd/lleva_conexio.sh" >> /etc/crontab
/etc/init.d/cron restart
git clone https://github.com/sciscar/bd_examen.git 
cd bd_examen 
docker-compose up -d
