#!/bin/sh
pkill -9 -f "code-server" && sleep 3
/usr/bin/code-server --config /config.yaml >> /application.log 2>&1 &