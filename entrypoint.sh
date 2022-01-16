#!/bin/sh
kill -9 $(cat /process.pid 2>/dev/null) 2>/dev/null
/usr/bin/code-server --config /config.yaml &
echo $! > /process.pid
tail -f /dev/null