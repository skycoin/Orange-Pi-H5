cd  /usr/local/skywire/go/bin
nohup ./manager -web-dir /usr/local/skywire/go/src/github.com/skycoin/skywire/static/skywire-manager > /dev/null 2>&1   &
sleep 3
nohup ./node -connect-manager -manager-address 192.168.0.2:5998 -manager-web 192.168.0.2:8000 -discovery-address discovery.skycoin.net:5999-034b1cd4ebad163e457fb805b3ba43779958bba49f2c5e1e8b062482904bacdb68 -address :5000 -web-port :6001  > /dev/null 2>&1  &
cd /

