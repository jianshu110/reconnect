#!/bin/sh
RECON_FILE="/usr/bin/reconnect.sh"
ROOT_PATH=$(pwd)

CRONTEB_RET=$(cat /var/spool/cron/crontabs/root | grep "/usr/bin/reconnect.sh")
UPDATE_CRONTEB=0
if [ -f "${RECON_FILE}" ];then
  UPDATE_CRONTEB=$((UPDATE_CRONTEB+1))
  sudo rm /usr/bin/reconnect.sh
fi
sudo cp ${ROOT_PATH}/reconnect.sh /usr/bin/
sudo chmod +x /usr/bin/reconnect.sh
if [ ${UPDATE_CRONTEB} -eq 0 ];then
  sudo echo "*/2 * * * * sudo /usr/bin/reconnect.sh" >> /var/spool/cron/crontabs/root
fi
echo install ok !!
