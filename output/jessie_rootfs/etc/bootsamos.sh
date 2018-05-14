cd  /usr/local/skywire/go/bin
nohup ./manager -web-dir /usr/local/skywire/go/src/github.com/skycoin/skywire/static/skywire-manager > /dev/null 2>&1   &
sleep 3
nohup ./node -connect-manager -manager-address 192.168.0.2:5998 -manager-web 192.168.0.2:8000 -discovery-address discovery.skycoin.net:5999-021192b6e41286d6799cb7ebf8c65ccc24c5d0bf0c9d98d6c48b651047be102113 -address :5000 -web-port :6001  > /dev/null 2>&1  &
cd /

