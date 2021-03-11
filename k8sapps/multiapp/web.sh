#!/bin/bash

if  [  "$customer"  ==  "app1" ]
then
  cp -rf /app/app1/*  /var/www/html/
  httpd -DFOREGROUND
elif   [  "$customer"  ==  "app2" ]
then
    cp -rf /app/app2/*  /var/www/html/
    httpd -DFOREGROUND

elif   [  "$customer"  ==  "app3" ]
then
    cp -rf /app/app3/*  /var/www/html/
    httpd -DFOREGROUND
else 
    echo "You have passed wrong variable value "  >/var/www/html/index.html
    httpd -DFOREGROUND
fi 



