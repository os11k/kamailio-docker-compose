kamailio-docker-compose
============

This are docker-compose files for building latest(not master) version of Kamailio. Everything by default and minimalistic as possible.

I used sample config file what comes with that version, it differs only with one line what adds include with listen address and most important advertise address, what is necessary to run Kamailio behind NAT.

If you are not running your Kamailio behind NAT(in 99% cases in docker, you are behind nat), then you can remove that line.

### Usage
```
apt-get update && apt-get upgrade -y && apt-get install docker-compose -y
mkdir /docker && cd /docker
git clone https://github.com/os11k/kamailio-docker-compose.git
cd ./kamailio-docker-compose/
docker-compose up -d --build
```
