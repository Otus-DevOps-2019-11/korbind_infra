#!/bin/bash

cat > /etc/systemd/system/reddit-app.service <<  _SERVICE_
[Unit]
Description=test-app
After=mongod.service
Requires=mongod.service

[Service]
Type=simple
User=appuser
Group=appuser
PIDFile=/home/appuser/reddit/reddit-app.pid
WorkingDirectory=/home/appuser/reddit
ExecStart=/usr/local/bin/puma --pidfile /home/appuser/reddit/reddit-app.pid
Restart=always

[Install]
WantedBy=multi-user.target

_SERVICE_

systemctl enable reddit-app

