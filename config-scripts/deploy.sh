#!/bin/bash

#download app
cd /home/appuser
git clone -b monolith https://github.com/express42/reddit.git

#install app
cd reddit && bundle install

#start app
puma -d

