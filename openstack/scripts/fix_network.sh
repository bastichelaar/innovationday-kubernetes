#!/bin/bash
GOOD_IPV4=`curl http://169.254.169.254/2009-04-04/meta-data/public-ipv4`

sed -i -e "s/\$COREOS_PUBLIC_IPV4/$GOOD_IPV4/g" /run/systemd/system/etcd.service.d/20-cloudinit.conf
sed -i -e "s/\$COREOS_PUBLIC_IPV4/$GOOD_IPV4/g" /etc/systemd/system/apiserver.service
sed -i -e "s/\$COREOS_PUBLIC_IPV4/$GOOD_IPV4/g" /etc/systemd/system/kubelet.service

systemctl daemon-reload
systemctl restart etcd
systemctl restart apiserver
systemctl restart kubelet
