sudo mkdir cache
sudo chmod -R 1777 *
sudo docker rm -f bind9-container
sudo docker run -d --name bind9-container -e TZ=UTC -p 53:53 -p 53:53/udp \
    -v `pwd`/cache:/var/cache/bind \
    -v `pwd`/records:/var/lib/bind \
    -v `pwd`/named.conf.options:/etc/bind/named.conf.options \
    -v `pwd`/named.conf.local:/etc/bind/named.conf.local \
    -v `pwd`/local.test.zone:/etc/bind/local.test.zone \
    ubuntu/bind9


#   -v `pwd`/named.conf:/etc/bind/named.conf \
