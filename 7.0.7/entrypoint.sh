#!/usr/bin/env bash


rm -rf /var/run/httpd/httpd.pid

httpd -D FOREGROUND
