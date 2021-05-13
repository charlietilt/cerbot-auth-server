#!/bin/bash
echo $CERTBOT_VALIDATION > ./.well-known/acme-challenge/$CERTBOT_TOKEN
