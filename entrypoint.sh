#!/bin/sh
nohup gotty -w sh &
nginx -g "daemon off;"

