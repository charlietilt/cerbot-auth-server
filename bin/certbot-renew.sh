#!/bin/bash
PID_FILE=/var/run/cerbot-auth-server.pid

echo "starting cerbot-auth-server..."
node ./server.js &
PID=$!
echo $! >$PID_FILE
echo "cerbot server running: [$PID]"
certbot renew --manual-auth-hook ./certbot-authenticator.sh --manual-cleanup-hook ./certbot-cleanup.sh

echo "Update complete...stopping certbot-auth-server..."
exec rm $PID_FILE
exec kill -9 $PID
