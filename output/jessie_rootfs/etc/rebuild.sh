#!/bin/sh

start () {
	sec_st=$(cat /sys/block/mmcblk0/mmcblk0p2/start)
echo "d
2
n
p
2
${sec_st}

w
" | fdisk /dev/mmcblk0
	rm /etc/resolv.conf
	echo "nameserver 192.168.0.1" > /etc/resolv.conf
#	macaddr="00:"`echo $(dd bs=1 count=3 if=/dev/random 2>/dev/null ) | md5sum | sed 's/\(..\)/&:/g' | cut -c1-14`
#	echo "hwaddress ether $macaddr" >> /etc/network/interfaces.d/eth0
	echo "#!/bin/sh" > /etc/rebuild.sh
	echo "start () {" >> /etc/rebuild.sh
	echo "resize2fs /dev/mmcblk0p2"  >> /etc/rebuild.sh
#	echo "update-rc.d -f $0 remove" >> /etc/rebuild.sh
	echo "cp -R  /usr/local/pack/* /var/cache/apt/archives/"  >> /etc/rebuild.sh
	echo "apt-get -y --force-yes install git" >> /etc/rebuild.sh 
	echo "apt-get -y --force-yes install gcc" >> /etc/rebuild.sh 
	echo "cp /etc/bootsamos.sh /etc/rebuild.sh" >> /etc/rebuild.sh	
	echo "sync" >> /etc/rebuild.sh
	echo "reboot" >> /etc/rebuild.sh  
	echo "}" >> /etc/rebuild.sh
	echo "start" >> /etc/rebuild.sh
	sync
	reboot
}

start


