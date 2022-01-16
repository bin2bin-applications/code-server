#!/bin/sh
kill -9 $(cat /process.pid 2>/dev/null) 2>/dev/null && sleep 5
/usr/bin/code-server --config /config.yaml &>> /application.log &
echo $! > /process.pid