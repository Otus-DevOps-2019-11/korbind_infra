#!/bin/bash

INVENTORY_FILE="inventory.json"

getip() {
  (cd ../terraform/stage; terraform state show "$1" | grep nat_ip | awk -F\" '{print $2}')
}

case $1 in
'--list' )
  APP_IP=$(getip module.app.google_compute_instance.app)
  DB_IP=$(getip module.db.google_compute_instance.db)
  cat ${INVENTORY_FILE} | sed "s/{{APP_IP}}/${APP_IP}/g" | sed "s/{{DB_IP}}/${DB_IP}/g"
  ;;
* )
  ;;
esac

