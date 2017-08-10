#!/bin/sh
stat=0
CURL_RET=$(curl -I www.baidu.com | grep "HTTP/1.1 200 OK" |  awk '{ print 0+$2}')

#echo $CURL_RET

if [ '$(ifconfig eth0 | grep "inet addr")' ]; then
	stat=$((stat+1))
fi

if [ $CURL_RET -eq 200 ]; then 
  stat=$((stat+1))
fi

if [ ! $stat -eq 2 ]; then
  sudo /etc/init.d/networking restart
fi
