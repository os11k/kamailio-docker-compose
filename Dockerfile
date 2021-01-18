FROM debian:buster

RUN apt-get update && \
apt-get -y install dnsutils git gcc g++ flex bison make pkg-config libpcre3-dev && \
\
#Here we are getting IP address of server and then we are setting it to advertise IP
IP=$(echo $(dig +short myip.opendns.com @resolver1.opendns.com)) &&\
echo "listen=eth0:5060 advertise $IP:5060" >> /kamailio.listen && \
cd /usr/src/ && \
git clone -b 5.2 https://github.com/kamailio/kamailio kamailio && \
cd kamailio && \
#Here you can build your Kamailio on specific commit, it is allways good practice to do so
#git checkout 02d70893718a96f552dc6426d016a0342e47247f && \ 
\
#Here you can include modules for building with Kamailio, don't forget about required packages if needed
#make include_modules="lcr dialplan" cfg && \ 
make Q=0 all && make install

WORKDIR /usr/local/etc/kamailio/
VOLUME ["/usr/local/etc/kamailio"]

CMD ["/usr/local/sbin/kamailio", "-DD","-P", "/var/run/kamailio.pid", "-m", "512", "-M", "12", "-f", "/usr/local/etc/kamailio/kamailio.cfg"]
